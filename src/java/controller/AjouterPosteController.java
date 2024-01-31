package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import model.Poste;
import model.TauxHoraire;

@WebServlet("/ajouter-poste")
public class AjouterPosteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("postes", Poste.getAll());
            req.setAttribute("active", "poste");
            req.setAttribute("content", "ajouter-poste");
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
                if (!nom.equals("")) {
                    Poste poste = new Poste(0, nom);
                    poste.insert();
                }
            } else if (req.getParameter("idPoste") != null && req.getParameter("valeur") != null) {
                int idPoste = Integer.parseInt(req.getParameter("idPoste"));
                double valeur = Double.parseDouble(req.getParameter("valeur"));
                TauxHoraire tauxHoraire = new TauxHoraire(0, idPoste, valeur);
                tauxHoraire.insert();
            }
            resp.sendRedirect("ajouter-poste");
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }
}
