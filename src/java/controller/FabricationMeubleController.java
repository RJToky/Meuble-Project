package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import model.Meuble;
import model.FabricationMeuble;

@WebServlet("/fabrication-meuble")
public class FabricationMeubleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("idMeuble") != null) {
                int idMeuble = Integer.parseInt(req.getParameter("idMeuble"));
                req.setAttribute("idMeuble", idMeuble);

                Meuble meuble = new Meuble();
                meuble.setId(idMeuble);
                req.setAttribute("matieres", meuble.getMatieres());

                FabricationMeuble fabricationMeuble = new FabricationMeuble();
                fabricationMeuble.setIdMeuble(idMeuble);
                req.setAttribute("fabricationMeubles", fabricationMeuble.getByIdMeuble());

                req.setAttribute("tailles", meuble.getTailles());
            }
            req.setAttribute("meubles", Meuble.getAll());
            req.setAttribute("active", "meuble");
            req.setAttribute("content", "fabrication-meuble");
            req.getRequestDispatcher("layouts/layout-app.jsp").forward(req, resp);
        } catch (Exception e) {
            PrintWriter out = resp.getWriter();
            out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            if (req.getParameter("idMeuble") != null && req.getParameter("idTaille") != null && req.getParameterValues("idMatiere[]") != null) {
                int idMeuble = Integer.parseInt(req.getParameter("idMeuble"));
                int idTaille = Integer.parseInt(req.getParameter("idTaille"));
                String[] listIdMatiere = req.getParameterValues("idMatiere[]");

                double[] quantites = new double[listIdMatiere.length];
                for (int i = 0; i < quantites.length; i++) {
                    quantites[i] = 0;
                    if (!req.getParameter("quantite-" + listIdMatiere[i]).isEmpty()) {
                        quantites[i] = Double.parseDouble(req.getParameter("quantite-" + listIdMatiere[i]));
                    }
                }

                FabricationMeuble fabricationMeuble = new FabricationMeuble();
                fabricationMeuble.setIdMeuble(idMeuble);
                fabricationMeuble.setIdTaille(idTaille);
                fabricationMeuble.insert(listIdMatiere, quantites);

                resp.sendRedirect("fabrication-meuble?idMeuble=" + idMeuble);

            } else if (req.getParameter("idMeuble") != null && req.getParameter("idTaille") != null && req.getParameter("quantite") != null) {
                int idMeuble = Integer.parseInt(req.getParameter("idMeuble"));
                int idTaille = Integer.parseInt(req.getParameter("idTaille"));
                int quantite = Integer.parseInt(req.getParameter("quantite"));
                
                String dateCommande = LocalDateTime.now().toString();
                try {
                    LocalDateTime localDateTime = LocalDateTime.parse(req.getParameter("dateCommande"));
                    dateCommande = localDateTime.toString();
                } catch (Exception e) {
                }
                Meuble meuble = new Meuble();
                meuble.setId(idMeuble);
                meuble.commander(idTaille, quantite, dateCommande);

                resp.sendRedirect("fabrication-meuble?idMeuble=" + idMeuble);
            }
        } catch (Exception e) {
            resp.sendRedirect("alerte?message=" + e.getMessage());
        }
    }
}
