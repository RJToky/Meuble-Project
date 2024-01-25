package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import model.Client;
import model.Genre;

@WebServlet("/ajouter-client")
public class AjouterClientController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("genres", Genre.getAll());
            req.setAttribute("active", "client");
            req.setAttribute("content", "ajouter-client");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);;
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("nom") != null && req.getParameter("idGenre") != null) {
                String nom = req.getParameter("nom").trim();
                int idGenre = Integer.parseInt(req.getParameter("idGenre"));
                if (!nom.equals("")) {
                    Client client = new Client(0, nom, idGenre);
                    client.insert();
                }
            }
            resp.sendRedirect("ajouter-client");
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }
}
