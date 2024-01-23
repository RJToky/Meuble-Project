package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import model.Embauche;

import model.Employe;
import model.Ouvrier;

@WebServlet("/ajouter-employe")
public class AjouterEmployeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("employes", Employe.getAll());
            req.setAttribute("ouvriers", Ouvrier.getAll());
            req.setAttribute("active", "employe");
            req.setAttribute("content", "ajouter-employe");
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
                    Employe employe = new Employe(0, nom);
                    employe.insert();
                }
            } else if (req.getParameter("idEmploye") != null && req.getParameter("idOuvrier") != null && req.getParameter("dateEmbauche") != null) {
                int idEmploye = Integer.parseInt(req.getParameter("idEmploye"));
                int idOuvrier = Integer.parseInt(req.getParameter("idOuvrier"));
                String dateEmbauche = req.getParameter("dateEmbauche");
                
                Embauche embauche = new Embauche(0, idEmploye, idOuvrier, dateEmbauche);
                embauche.insert();
            }
            resp.sendRedirect("ajouter-employe");
        } catch (Exception e) {
            resp.sendRedirect("alerte?message=" + e.getMessage());
        }
    }
}
