package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Style;

@WebServlet("/matiere-style")
public class MatiereStyleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("idStyle") != null) {
                int id = Integer.parseInt(req.getParameter("idStyle"));
                Style style = new Style(id, "");
                req.setAttribute("matieres", style.getMatieres());
                req.setAttribute("autresMatieres", style.getNotMatieres());
                req.setAttribute("idStyle", id);
            }
            req.setAttribute("styles", Style.getAll());
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("active", "style");
        req.setAttribute("content", "matiere-style");
        req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
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
                resp.sendRedirect("matiere-style?idStyle=" + idStyle);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
