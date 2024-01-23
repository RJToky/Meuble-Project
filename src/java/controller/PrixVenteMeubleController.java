package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import model.Meuble;
import model.Taille;
import model.PrixVenteMeuble;

@WebServlet("/prix-vente-meuble")
public class PrixVenteMeubleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("meubles", Meuble.getAll());
            req.setAttribute("tailles", Taille.getAll());
            req.setAttribute("active", "meuble");
            req.setAttribute("content", "prix-vente-meuble");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if(req.getParameter("idMeuble") != null && req.getParameter("idTaille") != null && req.getParameter("prixVente") != null) {
                int idMeuble = Integer.parseInt(req.getParameter("idMeuble"));
                int idTaille = Integer.parseInt(req.getParameter("idTaille"));
                double prixVente = Double.parseDouble(req.getParameter("prixVente"));

                PrixVenteMeuble prixVenteMeuble = new PrixVenteMeuble(0, idMeuble, idTaille, prixVente);
                prixVenteMeuble.insert();
            }
            resp.sendRedirect("prix-vente-meuble");
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }

}
