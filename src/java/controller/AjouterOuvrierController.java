package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import model.Ouvrier;
import model.TauxHoraire;

@WebServlet("/ajouter-ouvrier")
public class AjouterOuvrierController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("ouvriers", Ouvrier.getAll());
            req.setAttribute("active", "ouvrier");
            req.setAttribute("content", "ajouter-ouvrier");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("poste") != null) {
                String poste = req.getParameter("poste").trim();
                if (!poste.equals("")) {
                    Ouvrier ouvrier = new Ouvrier(0, poste);
                    ouvrier.insert();
                }
            } else if (req.getParameter("idOuvrier") != null && req.getParameter("valeur") != null) {
                int idOuvrier = Integer.parseInt(req.getParameter("idOuvrier"));
                double valeur = Double.parseDouble(req.getParameter("valeur"));
                TauxHoraire tauxHoraire = new TauxHoraire(0, idOuvrier, valeur);
                tauxHoraire.insert();
            }
            resp.sendRedirect("ajouter-ouvrier");
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }
}
