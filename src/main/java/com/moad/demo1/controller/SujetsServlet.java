package com.moad.demo1.controller;


import com.moad.demo1.dao.DAOServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "sujetsServlet", urlPatterns = {"/sujets"})
public class SujetsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer les sujets des messages publics
        List<String> sujets = DAOServices.getPublicSubjects();

        // Stocker la liste dans l'attribut de la requête
        request.setAttribute("sujets", sujets);

        // Rediriger vers la page des sujets
        request.getRequestDispatcher("/sujets.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}