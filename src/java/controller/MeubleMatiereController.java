package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Style;

@WebServlet("/meuble-matiere")
public class MeubleMatiereController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setAttribute("active", "meuble");
            req.setAttribute("content", "meuble-matiere");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        try {
//            if (req.getParameter("idStyle") != null) {
//                int idStyle = Integer.parseInt(req.getParameter("idStyle"));
//                if (req.getParameterValues("idMatiere[]") != null) {
//                    String[] listIdMatiere = req.getParameterValues("idMatiere[]");
//                    Style style = new Style(idStyle, "");
//                    style.addMatieres(listIdMatiere);
//                }
//                resp.sendRedirect("matiere-style?idStyle=" + idStyle);
//            } else {
//                resp.sendRedirect("matiere-style");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }

}
