package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Matiere;

import java.io.IOException;

@WebServlet("/matiere")
public class MatiereController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("content", "insertion-matiere");
        req.getRequestDispatcher("layouts/layout_app.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("nom") != null) {
            String nom = req.getParameter("nom");
            Matiere matiere = new Matiere(0, nom);
            try {
                matiere.insert();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        resp.sendRedirect("matiere");
    }

}