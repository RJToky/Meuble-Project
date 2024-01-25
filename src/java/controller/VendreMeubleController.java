package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import model.Client;

import model.Meuble;
import model.Taille;

@WebServlet("/vendre-meuble")
public class VendreMeubleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("clients", Client.getAll());
            req.setAttribute("meubles", Meuble.getAll());
            req.setAttribute("tailles", Taille.getAll());
            req.setAttribute("active", "meuble");
            req.setAttribute("content", "vendre-meuble");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            if (req.getParameter("idClient") != null && req.getParameter("idMeuble") != null && req.getParameter("idTaille") != null && req.getParameter("quantite") != null && req.getParameter("dateVente") != null) {
                int idClient = Integer.parseInt(req.getParameter("idClient"));
                int idMeuble = Integer.parseInt(req.getParameter("idMeuble"));
                int idTaille = Integer.parseInt(req.getParameter("idTaille"));
                int quantite = Integer.parseInt(req.getParameter("quantite"));

                String dateVente = LocalDate.now().toString();
                try {
                    LocalDate localDate = LocalDate.parse(req.getParameter("dateVente"));
                    dateVente = localDate.toString();
                } catch (Exception e) {
                }
                Meuble meuble = new Meuble();
                meuble.setId(idMeuble);
                meuble.vendre(idClient, idTaille, quantite, dateVente);

                resp.sendRedirect("vendre-meuble");
            }
        } catch(Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }

}
