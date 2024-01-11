package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

import model.Matiere;
import model.StockMatiere;

@WebServlet("/acheter-matiere")
public class AcheterMatiereController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("matieres", Matiere.getAll());
            req.setAttribute("active", "matiere");
            req.setAttribute("content", "acheter-matiere");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("idMatiere") != null && req.getParameter("quantite") != null) {
                int idMatiere = Integer.parseInt(req.getParameter("idMatiere"));
                double quantite = Double.parseDouble(req.getParameter("quantite"));
                String dateAchat = LocalDateTime.now().toString();
                try {
                    LocalDateTime localDateTime = LocalDateTime.parse(req.getParameter("dateAchat"));
                    dateAchat = localDateTime.toString();
                } catch (Exception e) {
                }
                StockMatiere achatMatiere = new StockMatiere(0, idMatiere, quantite, dateAchat);
                achatMatiere.entrerStock();
            }
            resp.sendRedirect("acheter-matiere");
        } catch (Exception e) {
            resp.sendRedirect("alerte?message=" + e.getMessage());
            e.printStackTrace();
        }
    }
}
