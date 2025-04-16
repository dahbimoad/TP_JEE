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
    <title>Messagerie - Sujets</title>
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
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            padding: 12px;
            margin-bottom: 5px;
            background-color: #f8f9fa;
            border-radius: 4px;
            border-left: 4px solid #007bff;
        }
        li:hover {
            background-color: #e9ecef;
        }
    </style>
</head>
<body>
<header>
    <h1>Messagerie</h1>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/accueil">Accueil</a>
        <a href="${pageContext.request.contextPath}/connexion">Connexion</a>
        <a href="${pageContext.request.contextPath}/inscription">Inscription</a>
    </div>
</header>

<h2>Liste des sujets</h2>

<ul>
    <c:choose>
        <c:when test="${empty sujets}">
            <li>Aucun sujet disponible pour le moment.</li>
        </c:when>
        <c:otherwise>
            <c:forEach var="sujet" items="${sujets}">
                <li>${sujet}</li>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</ul>
</body>
</html>