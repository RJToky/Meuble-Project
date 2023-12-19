package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/fabrication-meuble")
public class FabricationMeubleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
//            req.setAttribute("taille", null);
//            req.setAttribute("matieres", null);
            req.setAttribute("active", "meuble");
            req.setAttribute("content", "fabrication-meuble");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        try {
//            if (req.getParameter("nom") != null && req.getParameter("idCategorie") != null && req.getParameter("idStyle") != null) {
//                String nom = req.getParameter("nom").trim();
//                int idCategorie = Integer.parseInt(req.getParameter("idCategorie"));
//                int idStyle = Integer.parseInt(req.getParameter("idStyle"));
//                if (!nom.equals("")) {
//                }
//            }
//            resp.sendRedirect("ajouter-meuble");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }

}
