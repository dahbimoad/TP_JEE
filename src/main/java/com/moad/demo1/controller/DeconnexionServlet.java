package com.moad.demo1.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "deconnexionServlet", urlPatterns = {"/deconnexion"})
public class DeconnexionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer la session actuelle
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Détruire la session
            session.invalidate();
        }

        // Rediriger vers la page d'accueil
        response.sendRedirect(request.getContextPath() + "/accueil");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}