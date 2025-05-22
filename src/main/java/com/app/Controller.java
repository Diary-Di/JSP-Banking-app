package com.app;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = request.getParameter("page");
        String contentPage;

        // Map the page parameter to the corresponding JSP
        switch (page != null ? page : "") {
            case "transfert":
                contentPage = "transfert_page.jsp";
                break;
            case "retrait":
                contentPage = "retrait_page.jsp";
                break;
            case "transactions":
                contentPage = "transactions_page.jsp";
                break;
            case "home":
            default:
                contentPage = "home_page.jsp";
                break;
        }

        // Set the content page and current page as request attributes
        request.setAttribute("contentPage", contentPage);
        request.setAttribute("currentPage", page != null ? page : "home");

        // Check if it's an AJAX request
        String ajax = request.getHeader("X-Requested-With");
        if ("XMLHttpRequest".equals(ajax)) {
            // For AJAX, include only the content JSP
            request.getRequestDispatcher("/WEB-INF/pages/" + contentPage).include(request, response);
        } else {
            // For regular requests, forward to index.jsp
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}