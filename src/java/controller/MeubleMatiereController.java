package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Meuble;
import model.Matiere;

@WebServlet("/meuble-matiere")
public class MeubleMatiereController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("idMatiere") != null) {
                int idMatiere = Integer.parseInt(req.getParameter("idMatiere"));
                req.setAttribute("meubles", Meuble.getMeubles(idMatiere));
            }
            if(req.getParameter("idMeuble") != null) {
                int idMeuble = Integer.parseInt(req.getParameter("idMeuble"));
                req.setAttribute("", null);
            }
            req.setAttribute("matieres", Matiere.getAll());
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
