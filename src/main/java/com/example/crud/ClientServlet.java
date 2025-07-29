package com.example.crud;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserServlet")
public class ClientServlet extends HttpServlet {
    private ClientDAO clientDAO = new ClientDAO();

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                req.getRequestDispatcher("client_form.jsp").forward(req, res);
                break;
            case "edit":
                String numtel = req.getParameter("numtel");
                Client c = clientDAO.getClientByNumTel(numtel);
                req.setAttribute("client", c);
                req.getRequestDispatcher("edit_client.jsp").forward(req, res);
                break;
            case "delete":
                clientDAO.deleteClient(req.getParameter("numtel"));
                res.sendRedirect("ClientServlet");
                break;
            default:
                List<Client> list = clientDAO.getAllClients();
                req.setAttribute("list", list);
                req.getRequestDispatcher("client_list.jsp").forward(req, res);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String numtel = req.getParameter("numtel_client");
        String nom = req.getParameter("nom_client");
        String sexe = req.getParameter("sexe_client");
        int age = Integer.parseInt(req.getParameter("age_client"));
        int solde = Integer.parseInt(req.getParameter("solde_client"));
        String mail = req.getParameter("mail_client");

        Client client = new Client(numtel, nom, sexe, age, solde, mail);

        if (req.getParameter("isEdit") != null) {
            clientDAO.updateClient(client);
        } else {
            clientDAO.insertClient(client);
        }
        res.sendRedirect("ClientServlet");
    }
}

