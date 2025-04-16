package com.moad.demo1.controller;


import com.moad.demo1.dao.DAOServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "inscriptionServlet", urlPatterns = {"/inscription"})
public class InscriptionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/inscription.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String motDePasse = request.getParameter("motDePasse");

        if (nom == null || prenom == null || motDePasse == null ||
                nom.trim().isEmpty() || prenom.trim().isEmpty() || motDePasse.trim().isEmpty()) {

            request.setAttribute("erreur", "Tous les champs sont obligatoires.");
            request.getRequestDispatcher("/inscription.jsp").forward(request, response);
            return;
        }

        boolean success = DAOServices.registerUser(nom, prenom, motDePasse);

        if (success) {
            request.setAttribute("message", "Inscription réussie! Vous pouvez maintenant vous connecter.");
            request.getRequestDispatcher("/connexion.jsp").forward(request, response);
        } else {
            request.setAttribute("erreur", "Erreur lors de l'inscription. Veuillez réessayer.");
            request.getRequestDispatcher("/inscription.jsp").forward(request, response);
        }
    }
}
