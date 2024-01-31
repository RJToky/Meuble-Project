package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import model.MainOeuvre;

import model.Style;
import model.Poste;

@WebServlet("/ajouter-main-oeuvre")
public class AjouterMainOeuvreController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("styles", Style.getAll());
            req.setAttribute("postes", Poste.getAll());
            req.setAttribute("active", "main-oeuvre");
            req.setAttribute("content", "ajouter-main-oeuvre");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("idStyle") != null && req.getParameter("idPoste") != null
                    && req.getParameter("heureTravail") != null && req.getParameter("nombrePersonne") != null) {
                int idStyle = Integer.parseInt(req.getParameter("idStyle"));
                int idPoste = Integer.parseInt(req.getParameter("idPoste"));
                double heureTravail = Double.parseDouble(req.getParameter("heureTravail"));
                int nombrePersonne = Integer.parseInt(req.getParameter("nombrePersonne"));

                MainOeuvre mainOeuvre = new MainOeuvre(0, idStyle, idPoste, heureTravail, nombrePersonne);
                mainOeuvre.insert();
            }
            resp.sendRedirect("ajouter-main-oeuvre");
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }
}
