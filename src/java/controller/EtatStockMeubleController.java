package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import model.VEtatStockMeuble;

@WebServlet("/etat-stock-meuble")
public class EtatStockMeubleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("vEtatStockMeubles", VEtatStockMeuble.getAll());
            req.setAttribute("active", "meuble");
            req.setAttribute("content", "etat-stock-meuble");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }

}
