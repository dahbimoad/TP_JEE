<%--
  Created by IntelliJ IDEA.
  User: mouad
  Date: 4/16/2025
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Messagerie - Inscription</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
        }
        header {
            background-color: #f8f9fa;
            padding: 10px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .nav-links a {
            margin-left: 15px;
            text-decoration: none;
            color: #007bff;
        }
        h1, h2 {
            color: #333;
        }
        .form-container {
            max-width: 500px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn {
            display: inline-block;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .error-message {
            color: #dc3545;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<header>
    <h1>Messagerie</h1>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/accueil">Accueil</a>
        <a href="${pageContext.request.contextPath}/connexion">Connexion</a>
        <a href="${pageContext.request.contextPath}/sujets">Sujets</a>
    </div>
</header>

<h2>Inscription</h2>

<div class="form-container">
    <c:if test="${not empty erreur}">
        <div class="error-message">
                ${erreur}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/inscription" method="post">
        <div class="form-group">
            <label for="nom">Nom:</label>
            <input type="text" id="nom" name="nom" required>
        </div>

        <div class="form-group">
            <label for="prenom">Prénom:</label>
            <input type="text" id="prenom" name="prenom" required>
        </div>

        <div class="form-group">
            <label for="motDePasse">Mot de passe:</label>
            <input type="password" id="motDePasse" name="motDePasse" required>
        </div>

        <button type="submit" class="btn">S'inscrire</button>
    </form>

    <p>Déjà inscrit? <a href="${pageContext.request.contextPath}/connexion">Se connecter</a></p>
</div>
</body>
</html>