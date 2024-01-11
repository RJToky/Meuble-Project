package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

import model.VMeubleValeur;

@WebServlet("/meuble-valeur")
public class MeubleValeurController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("valeurMin") != null && req.getParameter("valeurMax") != null) {
                double valeurMin = Double.parseDouble(req.getParameter("valeurMin"));
                double valeurMax = Double.parseDouble(req.getParameter("valeurMax"));

                ArrayList<VMeubleValeur> vMeubleValeurs = VMeubleValeur.getByValeurMinMax(valeurMin, valeurMax);
                if (!vMeubleValeurs.isEmpty()) {
                    req.setAttribute("vMeubleValeurs", vMeubleValeurs);
                }
                
                req.setAttribute("valeurMin", valeurMin);
                req.setAttribute("valeurMax", valeurMax);
            }
            req.setAttribute("active", "meuble");
            req.setAttribute("content", "meuble-valeur");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.sendRedirect("alerte?message=" + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
