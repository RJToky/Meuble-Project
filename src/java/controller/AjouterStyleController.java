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
            req.setAttribute("active", "style");
            req.setAttribute("content", "ajouter-style");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("nom") != null) {
                String[] listIdMatiere = req.getParameterValues("idMatiere[]");
                String nom = req.getParameter("nom").trim();
                if (!nom.equals("")) {
                    Style style = new Style(0, nom);
                    style.insert(listIdMatiere);
                }
            }
            resp.sendRedirect("ajouter-style");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
