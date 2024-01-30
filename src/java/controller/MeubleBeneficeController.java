package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

import model.VMeubleBenefice;

@WebServlet("/meuble-benefice")
public class MeubleBeneficeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("beneficeMin") != null && req.getParameter("beneficeMax") != null) {
                double beneficeMin = Double.parseDouble(req.getParameter("beneficeMin"));
                double beneficeMax = Double.parseDouble(req.getParameter("beneficeMax"));

                ArrayList<VMeubleBenefice> vMeubleBenefices = VMeubleBenefice.getByBeneficeMinMax(beneficeMin, beneficeMax);
                if (!vMeubleBenefices.isEmpty()) {
                    req.setAttribute("vMeubleBenefices", vMeubleBenefices);
                }
                req.setAttribute("beneficeMin", beneficeMin);
                req.setAttribute("beneficeMax", beneficeMax);
            } else {
                ArrayList<VMeubleBenefice> vMeubleBenefices = VMeubleBenefice.getAll();
                if (!vMeubleBenefices.isEmpty()) {
                    req.setAttribute("vMeubleBenefices", vMeubleBenefices);
                }
            }
            req.setAttribute("active", "meuble");
            req.setAttribute("content", "meuble-benefice");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.sendRedirect("alerte?message=" + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
