package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import model.Ouvrier;

@WebServlet("/ajouter-ouvrier")
public class AjouterOuvrierController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("active", "ouvrier");
        req.setAttribute("content", "ajouter-ouvrier");
        req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("type") != null) {
                String type = req.getParameter("type").trim();
                if (!type.equals("")) {
                    Ouvrier ouvrier = new Ouvrier(0, type);
                    ouvrier.insert();
                }
            }
            resp.sendRedirect("ajouter-ouvrier");
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }
}
