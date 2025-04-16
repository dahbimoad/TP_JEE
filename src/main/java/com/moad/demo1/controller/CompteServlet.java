package com.moad.demo1.controller;

import com.moad.demo1.dao.DAOServices;
import com.moad.demo1.model.Message;
import com.moad.demo1.model.Personne;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "compteServlet", urlPatterns = {"/compte"})
public class CompteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("utilisateur") == null) {
            response.sendRedirect(request.getContextPath() + "/connexion");
            return;
        }

        Personne utilisateur = (Personne) session.getAttribute("utilisateur");

        List<Message> messages = DAOServices.getUserMessages(utilisateur.getIdPersonne());

        request.setAttribute("messages", messages);

        request.getRequestDispatcher("/compte.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}