package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Meuble;

@WebServlet("/meuble-taille")
public class MeubleTailleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("idMeuble") != null) {
                int idMeuble = Integer.parseInt(req.getParameter("idMeuble"));
                Meuble meuble = new Meuble();
                meuble.setId(idMeuble);
                
                req.setAttribute("tailles", meuble.getTailles());
                req.setAttribute("autresTailles", meuble.getNotTailles());
                req.setAttribute("idMeuble", idMeuble);
            }
            req.setAttribute("meubles", Meuble.getAll());
            req.setAttribute("active", "meuble");
            req.setAttribute("content", "meuble-taille");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("idMeuble") != null) {
                int idMeuble = Integer.parseInt(req.getParameter("idMeuble"));
                if (req.getParameterValues("idTaille[]") != null) {
                    String[] listidTaille = req.getParameterValues("idTaille[]");
                    Meuble meuble = new Meuble();
                    meuble.setId(idMeuble);
                    meuble.addTaille(listidTaille);
                }
                resp.sendRedirect("meuble-taille?idMeuble=" + idMeuble);
            } else {
                resp.sendRedirect("meuble-taille");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
