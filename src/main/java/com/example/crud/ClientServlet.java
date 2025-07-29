package com.example.crud;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ClientServlet")
public class ClientServlet extends HttpServlet {
    private ClientDAO clientDAO = new ClientDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "delete":
                String numToDelete = req.getParameter("numtel");
                try {
                    clientDAO.deleteClient(numToDelete);
                    // Handle AJAX vs normal request
                    String ajax = req.getHeader("X-Requested-With");
                    if ("XMLHttpRequest".equals(ajax)) {
                        res.setStatus(HttpServletResponse.SC_NO_CONTENT); // 204 No Content
                        return;
                    }
                    res.sendRedirect(req.getContextPath() + "/Controller?page=client");
                } catch (Exception e) {
                    e.printStackTrace();
                    res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de la suppression du client.");
                }
                break;

            case "list":
            default:
                List<Client> list = clientDAO.getAllClients();
                req.setAttribute("clients", list);
                req.setAttribute("contentPage", "client_page.jsp");
                req.getRequestDispatcher("/index.jsp").forward(req, res);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        // Get form values
        String fullNumTel = req.getParameter("fullNumTel");
        String nom = req.getParameter("nom");
        String sexe = req.getParameter("sexe");
        String ageStr = req.getParameter("age");
        String soldeStr = req.getParameter("solde");
        String mail = req.getParameter("mail");

        try {
            // Validation
            if (fullNumTel == null || nom == null || sexe == null || ageStr == null || soldeStr == null || mail == null) {
                throw new IllegalArgumentException("Tous les champs sont obligatoires.");
            }

            int age = Integer.parseInt(ageStr);
            int solde = Integer.parseInt(soldeStr);

            Client client = new Client(fullNumTel, nom, sexe, age, solde, mail);

            // Insert or update based on isEdit param
            if ("true".equals(req.getParameter("isEdit"))) {
                clientDAO.updateClient(client);
            } else {
                clientDAO.insertClient(client);
            }

            // Handle AJAX vs normal redirect
            String ajax = req.getHeader("X-Requested-With");
            if ("XMLHttpRequest".equals(ajax)) {
                res.setStatus(HttpServletResponse.SC_NO_CONTENT); // 204 No Content
                return;
            }

            res.sendRedirect(req.getContextPath() + "/Controller?page=client");

        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de l'insertion ou mise à jour du client.");
        }
    }
}