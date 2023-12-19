package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Meuble;
import model.FabricationMeuble;

import java.io.IOException;
import model.Taille;

@WebServlet("/fabrication-meuble")
public class FabricationMeubleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("idMeuble") != null) {
                int idMeuble = Integer.parseInt(req.getParameter("idMeuble"));
                Meuble meuble = new Meuble();
                meuble.setId(idMeuble);
                req.setAttribute("tailles", Taille.getAll());
                req.setAttribute("matieres", meuble.getMatieres());
                req.setAttribute("idMeuble", idMeuble);
            }
            req.setAttribute("meubles", Meuble.getAll());
            req.setAttribute("active", "meuble");
            req.setAttribute("content", "fabrication-meuble");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("idMeuble") != null && req.getParameter("idTaille") != null && req.getParameterValues("idMatiere[]") != null && req.getParameterValues("quantite[]") != null) {
                int idMeuble = Integer.parseInt(req.getParameter("idMeuble"));
                int idTaille = Integer.parseInt(req.getParameter("idTaille"));
                String[] listIdMatieres = req.getParameterValues("idMatiere[]");
                String[] listQuantites = req.getParameterValues("quantite[]");
                
                FabricationMeuble fabricationMeuble = new FabricationMeuble();
                fabricationMeuble.setIdMeuble(idMeuble);
                fabricationMeuble.setIdTaille(idTaille);
                fabricationMeuble.insert(listIdMatieres, listQuantites);
            }
            resp.sendRedirect("ajouter-meuble");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
