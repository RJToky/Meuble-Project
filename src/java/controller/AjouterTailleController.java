package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

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
                    Taille taille = new Taille(0, nom, -1);
                    taille.insert();
                }
            } else if (req.getParameter("idTaille") != null && req.getParameter("coefficient") != null) {
                Taille taille = new Taille();
                taille.set("coefficient", req.getParameter("coefficient"));
                taille.where("id", req.getParameter("idTaille"));
                taille.update();
            }
            resp.sendRedirect("ajouter-taille");
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }
}
