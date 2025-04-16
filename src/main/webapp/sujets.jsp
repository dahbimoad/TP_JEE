<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Messagerie - Sujets</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f7fa;
            color: #333;
        }
        header {
            background-color: #4a6fa5;
            color: white;
            padding: 15px 20px;
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .app-title {
            font-weight: 700;
            font-size: 24px;
            letter-spacing: 0.5px;
        }
        .nav-links a {
            margin-left: 20px;
            text-decoration: none;
            color: white;
            transition: all 0.3s ease;
            padding: 8px 12px;
            border-radius: 4px;
            font-weight: 500;
        }
        .nav-links a:hover {
            background-color: rgba(255,255,255,0.15);
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        h1, h2 {
            color: #2c3e50;
        }
        h2 {
            border-bottom: 2px solid #e6e6e6;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }
        .subject-list {
            list-style-type: none;
            padding: 0;
        }
        .subject-item {
            padding: 15px 20px;
            margin-bottom: 10px;
            background-color: white;
            border-radius: 8px;
            border-left: 5px solid #4a6fa5;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
        }
        .subject-item i {
            margin-right: 10px;
            color: #4a6fa5;
            font-size: 20px;
        }
        .subject-item:hover {
            background-color: #f0f5ff;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .empty-message {
            text-align: center;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            border-left: 5px solid #95a5a6;
            color: #7f8c8d;
            font-style: italic;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        .empty-message i {
            font-size: 40px;
            display: block;
            margin-bottom: 15px;
            color: #95a5a6;
        }
        .icon {
            margin-right: 5px;
        }
        .card {
            background-color: white;
            border-radius: 8px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        .card-title {
            color: #4a6fa5;
            margin-top: 0;
            font-size: 20px;
            border-bottom: 1px solid #e6e6e6;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }
    </style>
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
    <div class="card">
        <h3 class="card-title"><i class="fas fa-info-circle icon"></i> À propos des sujets</h3>
        <p>Cette page affiche tous les sujets des messages publics disponibles dans notre système. Les sujets sont mis à jour régulièrement.</p>
    </div>

    <h2><i class="fas fa-tags icon"></i> Liste des sujets</h2>

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
</body>
</html>