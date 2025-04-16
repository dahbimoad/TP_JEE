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

@WebServlet(name = "connexionServlet", urlPatterns = {"/connexion"})
public class ConnexionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if user is already logged in
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("utilisateur") != null) {
            // User is already logged in, redirect to compte.jsp
            response.sendRedirect(request.getContextPath() + "/compte");
            return;
        }

        // User is not logged in, show the login page
        request.getRequestDispatcher("/connexion.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer les paramètres du formulaire
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String motDePasse = request.getParameter("motDePasse");

        // Authentifier l'utilisateur
        Personne utilisateur = DAOServices.authenticateUser(nom, prenom, motDePasse);

        if (utilisateur != null) {
            // Authentification réussie

            // Créer une session
            HttpSession session = request.getSession(true);
            session.setAttribute("utilisateur", utilisateur);

            // Set session timeout to 30 minutes
            session.setMaxInactiveInterval(30 * 60);

            // Redirect to compte servlet instead of forwarding directly to JSP
            response.sendRedirect(request.getContextPath() + "/compte");
        } else {
            // Authentification échouée
            request.setAttribute("erreur", "Nom d'utilisateur, prénom ou mot de passe incorrect.");
            request.getRequestDispatcher("/connexion.jsp").forward(request, response);
        }
    }
}