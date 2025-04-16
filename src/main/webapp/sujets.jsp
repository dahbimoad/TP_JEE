<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Messagerie - Sujets</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/messagerie.css">
</head>
<body>
<header>
    <div class="app-title"><i class="fas fa-envelope icon"></i> Messagerie</div>
    <div class="nav-links">
        <c:choose>
            <c:when test="${not empty sessionScope.utilisateur}">
                <!-- User is logged in -->
                <a href="${pageContext.request.contextPath}/accueil"><i class="fas fa-home icon"></i> Accueil</a>
                <a href="${pageContext.request.contextPath}/compte"><i class="fas fa-user icon"></i> Mon Compte</a>
                <a href="${pageContext.request.contextPath}/deconnexion"><i class="fas fa-sign-out-alt icon"></i> Déconnexion</a>
            </c:when>
            <c:otherwise>
                <!-- User is not logged in -->
                <a href="${pageContext.request.contextPath}/accueil"><i class="fas fa-home icon"></i> Accueil</a>
                <a href="${pageContext.request.contextPath}/connexion"><i class="fas fa-sign-in-alt icon"></i> Connexion</a>
                <a href="${pageContext.request.contextPath}/inscription"><i class="fas fa-user-plus icon"></i> Inscription</a>
            </c:otherwise>
        </c:choose>
    </div>
</header>

<div class="container">
    <div class="card fade-in">
        <h3 class="card-title"><i class="fas fa-info-circle icon"></i> À propos des sujets</h3>
        <p>Cette page affiche tous les sujets des messages publics disponibles dans notre système. Les sujets sont mis à jour régulièrement.</p>
    </div>

    <div class="card fade-in">
        <h2 class="card-title"><i class="fas fa-tags icon"></i> Liste des sujets</h2>

        <c:choose>
            <c:when test="${empty sujets}">
                <div class="empty-message">
                    <i class="fas fa-folder-open"></i>
                    Aucun sujet disponible pour le moment.
                </div>
            </c:when>
            <c:otherwise>
                <ul class="subject-list">
                    <c:forEach var="sujet" items="${sujets}">
                        <li class="subject-item">
                            <i class="fas fa-tag"></i> ${sujet}
                        </li>
                    </c:forEach>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>