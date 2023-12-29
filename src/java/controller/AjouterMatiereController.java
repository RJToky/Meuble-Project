package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Matiere;

@WebServlet("/ajouter-matiere")
public class AjouterMatiereController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("active", "matiere");
        req.setAttribute("content", "ajouter-matiere");
        req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("nom") != null) {
                String nom = req.getParameter("nom").trim();
                if (!nom.equals("")) {
                    Matiere matiere = new Matiere(0, nom);
                    matiere.insert();
                }
            }
            resp.sendRedirect("ajouter-matiere");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
