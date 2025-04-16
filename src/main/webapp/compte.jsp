<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Messagerie - Mon Compte</title>
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
    .welcome-message {
      background-color: #e9f7ef;
      padding: 15px;
      border-radius: 5px;
      margin-bottom: 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #f2f2f2;
      color: #333;
    }
    tr:hover {
      background-color: #f5f5f5;
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
    .btn-danger {
      background-color: #dc3545;
    }
    .session-info {
      font-size: 12px;
      color: #6c757d;
      margin-top: 40px;
      padding: 10px;
      background-color: #f8f9fa;
      border-radius: 4px;
    }
  </style>
</head>
<body>
<header>
  <h1>Messagerie</h1>
  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/accueil">Accueil</a>
    <a href="${pageContext.request.contextPath}/sujets">Sujets</a>
    <a href="${pageContext.request.contextPath}/deconnexion" class="btn btn-danger">Déconnexion</a>
  </div>
</header>

<div class="welcome-message">
  <h2>Bienvenue, ${sessionScope.utilisateur.prenom} ${sessionScope.utilisateur.nom}</h2>
  <p>Voici vos messages personnels.</p>
</div>

<table>
  <thead>
  <tr>
    <th>Sujet</th>
    <th>Contenu</th>
  </tr>
  </thead>
  <tbody>
  <c:choose>
    <c:when test="${empty messages}">
      <tr>
        <td colspan="2">Vous n'avez pas encore de messages.</td>
      </tr>
    </c:when>
    <c:otherwise>
      <c:forEach var="message" items="${messages}">
        <tr>
          <td>${message.sujet}</td>
          <td>${message.contenu}</td>
        </tr>
      </c:forEach>
    </c:otherwise>
  </c:choose>
  </tbody>
</table>

<div class="session-info">
  <p>Session ID: <%= session.getId() %> | Créée le: <%= new java.util.Date(session.getCreationTime()) %> | Expire dans: <%= session.getMaxInactiveInterval() / 60 %> minutes</p>
</div>
</body>
</html>