package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import model.Categorie;
import model.Meuble;
import model.Style;
import model.Taille;

@WebServlet("/ajouter-meuble")
public class AjouterMeubleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("categories", Categorie.getAll());
            req.setAttribute("styles", Style.getAll());
            req.setAttribute("tailles", Taille.getAll());
            req.setAttribute("active", "meuble");
            req.setAttribute("content", "ajouter-meuble");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("nom") != null && req.getParameter("idCategorie") != null
                    && req.getParameter("idStyle") != null) {
                String nom = req.getParameter("nom").trim();
                int idCategorie = Integer.parseInt(req.getParameter("idCategorie"));
                int idStyle = Integer.parseInt(req.getParameter("idStyle"));
                if (!nom.equals("")) {
                    Meuble meuble = new Meuble(0, nom, idCategorie, idStyle);
                    meuble.insert();
                }
            }
            Meuble lastMeuble = Meuble.getLast();
            resp.sendRedirect("fabrication-meuble?idMeuble=" + lastMeuble.getId());
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }
}
