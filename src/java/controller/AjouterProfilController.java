package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import model.Profil;

@WebServlet("/ajouter-profil")
public class AjouterProfilController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("active", "profil");
        req.setAttribute("content", "ajouter-profil");
        req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("nom") != null && req.getParameter("annee") != null && req.getParameter("coefficient") != null) {
                String nom = req.getParameter("nom").trim();
                int annee = Integer.parseInt(req.getParameter("annee"));
                int coefficient = Integer.parseInt(req.getParameter("coefficient"));
                if (!nom.equals("")) {
                    Profil profil = new Profil(0, nom, annee, coefficient);
                    profil.insert();
                }
            }
            resp.sendRedirect("ajouter-profil");
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }
}
