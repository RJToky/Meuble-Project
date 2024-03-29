package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import model.Style;

@WebServlet("/style-matiere")
public class StyleMatiereController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("idStyle") != null) {
                int idStyle = Integer.parseInt(req.getParameter("idStyle"));
                Style style = new Style(idStyle, "");
                req.setAttribute("vDetailMatieres", style.getVDetailMatieres());
                req.setAttribute("autresMatieres", style.getNotMatieres());
                req.setAttribute("idStyle", idStyle);
            }
            req.setAttribute("styles", Style.getAll());
            req.setAttribute("active", "style");
            req.setAttribute("content", "style-matiere");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("idStyle") != null) {
                int idStyle = Integer.parseInt(req.getParameter("idStyle"));
                if (req.getParameterValues("idMatiere[]") != null) {
                    String[] listIdMatiere = req.getParameterValues("idMatiere[]");
                    Style style = new Style(idStyle, "");
                    style.addMatieres(listIdMatiere);
                }
                resp.sendRedirect("style-matiere?idStyle=" + idStyle);
            } else {
                resp.sendRedirect("style-matiere");
            }
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }
}
