package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import model.Meuble;
import model.Taille;
import model.VStatistiqueVente;

@WebServlet("/statistique-vente")
public class StatistiqueVenteController extends HttpServlet  {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if(req.getParameter("idMeuble") != null && req.getParameter("idTaille") != null) {
                int idMeuble = Integer.parseInt(req.getParameter("idMeuble"));
                int idTaille = Integer.parseInt(req.getParameter("idTaille"));
                
                ArrayList<VStatistiqueVente> vStatistiqueVentes = VStatistiqueVente.getByMeubleTaille(idMeuble, idTaille);
                req.setAttribute("vStatistiqueVentes", vStatistiqueVentes);
                req.setAttribute("idMeuble", idMeuble);
                req.setAttribute("idTaille", idTaille);
            }
            req.setAttribute("meubles", Meuble.getAll());
            req.setAttribute("tailles", Taille.getAll());
            req.setAttribute("active", "statistique");
            req.setAttribute("content", "statistique-vente");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }
    
}
