package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import model.Matiere;
import model.PrixMatiere;

@WebServlet("/ajouter-matiere")
public class AjouterMatiereController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("matieres", Matiere.getAll());
            req.setAttribute("active", "matiere");
            req.setAttribute("content", "ajouter-matiere");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("nom") != null) {
                String nom = req.getParameter("nom").trim();
                double prixUnitaire = 0.0;
                if (!req.getParameter("prixUnitaire").isEmpty()) {
                    prixUnitaire = Double.parseDouble(req.getParameter("prixUnitaire"));
                }
                if (!nom.equals("")) {
                    Matiere matiere = new Matiere(0, nom);
                    matiere.insert(prixUnitaire);
                }
            } else if(req.getParameter("idMatiere") != null && req.getParameter("prixUnitaire") != null) {
                int idMatiere = Integer.parseInt(req.getParameter("idMatiere"));
                double prixUnitaire = Double.parseDouble(req.getParameter("prixUnitaire"));
                PrixMatiere prixMatiere = new PrixMatiere(0, idMatiere, prixUnitaire, LocalDateTime.now().toString());
                prixMatiere.insert();
            }
            resp.sendRedirect("ajouter-matiere");
        } catch (Exception e) {
            resp.sendRedirect("alerte?message=" + e.getMessage());
        }
    }
}
