package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Matiere;

@WebServlet("/meuble-matiere")
public class MeubleMatiereController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("idMatiere") != null) {
                int idMatiere = Integer.parseInt(req.getParameter("idMatiere"));
                Matiere matiere = new Matiere();
                matiere.setId(idMatiere);
                req.setAttribute("fabricationMeubles", matiere.getFabricationMeubles());
                req.setAttribute("idMatiere", idMatiere);
            }
            req.setAttribute("matieres", Matiere.getAll());
            req.setAttribute("active", "meuble");
            req.setAttribute("content", "meuble-matiere");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
