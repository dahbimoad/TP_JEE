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

        // Afficher la page de connexion
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
            HttpSession session = request.getSession();
            session.setAttribute("utilisateur", utilisateur);

            // Récupérer les messages personnels de l'utilisateur
            List<Message> messages = DAOServices.getUserMessages(utilisateur.getIdPersonne());
            request.setAttribute("messages", messages);

            // Rediriger vers la page du compte
            request.getRequestDispatcher("/compte.jsp").forward(request, response);
        } else {
            // Authentification échouée
            request.setAttribute("erreur", "Nom d'utilisateur, prénom ou mot de passe incorrect.");
            request.getRequestDispatcher("/connexion.jsp").forward(request, response);
        }
    }
}
