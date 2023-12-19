package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import model.Matiere;
import model.Style;

@WebServlet("/ajouter-style")
public class AjouterStyleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("matieres", Matiere.getAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("active", "style");
        req.setAttribute("content", "ajouter-style");
        req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("nom") != null) {
            try {
                String[] listIdMatiere = req.getParameterValues("idMatiere[]");
                String nom = req.getParameter("nom");
                Style style = new Style(0, nom);
                style.insert(listIdMatiere);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        resp.sendRedirect("ajouter-style");
    }

}