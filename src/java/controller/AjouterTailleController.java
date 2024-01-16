package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import model.DetailTaille;

import model.Taille;

@WebServlet("/ajouter-taille")
public class AjouterTailleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("tailles", Taille.getAll());
            req.setAttribute("active", "taille");
            req.setAttribute("content", "ajouter-taille");
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
                    Taille taille = new Taille(0, nom);
                    taille.insert();
                }
            } else if (req.getParameter("idTaille") != null && req.getParameter("ordre") != null) {
                int idTaille = Integer.parseInt(req.getParameter("idTaille"));
                int ordre = Integer.parseInt(req.getParameter("ordre"));
                DetailTaille detailTaille = new DetailTaille(0, idTaille, ordre);
                detailTaille.insert();
            }
            resp.sendRedirect("ajouter-taille");
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }
}
