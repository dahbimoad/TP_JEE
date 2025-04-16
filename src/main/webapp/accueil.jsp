<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Messagerie - Accueil</title>
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
      margin-bottom: 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      background-color: white;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 0 15px rgba(0,0,0,0.05);
    }
    th, td {
      padding: 15px;
      text-align: left;
      border-bottom: 1px solid #e6e6e6;
    }
    th {
      background-color: #4a6fa5;
      color: white;
      font-weight: 600;
    }
    tr:hover {
      background-color: #f8f9fa;
    }
    tr:last-child td {
      border-bottom: none;
    }
    .message-subject {
      font-weight: 600;
      color: #3a5d7f;
    }
    .message-content {
      color: #555;
    }
    .btn {
      display: inline-block;
      padding: 10px 15px;
      background-color: #4a6fa5;
      color: white;
      text-decoration: none;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .btn:hover {
      background-color: #3a5d7f;
    }
    .empty-message {
      text-align: center;
      padding: 30px;
      color: #777;
      font-style: italic;
    }
    .icon {
      margin-right: 5px;
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
        <a href="${pageContext.request.contextPath}/compte"><i class="fas fa-user icon"></i> Mon Compte</a>
        <a href="${pageContext.request.contextPath}/sujets"><i class="fas fa-tags icon"></i> Sujets</a>
        <a href="${pageContext.request.contextPath}/deconnexion"><i class="fas fa-sign-out-alt icon"></i> Déconnexion</a>
      </c:when>
      <c:otherwise>
        <!-- User is not logged in -->
        <a href="${pageContext.request.contextPath}/connexion"><i class="fas fa-sign-in-alt icon"></i> Connexion</a>
        <a href="${pageContext.request.contextPath}/inscription"><i class="fas fa-user-plus icon"></i> Inscription</a>
        <a href="${pageContext.request.contextPath}/sujets"><i class="fas fa-tags icon"></i> Sujets</a>
      </c:otherwise>
    </c:choose>
  </div>
</header>

<div class="container">
  <h2><i class="fas fa-list icon"></i> Liste des messages</h2>

  <table>
    <thead>
    <tr>
      <th><i class="fas fa-heading icon"></i> Sujet</th>
      <th><i class="fas fa-align-left icon"></i> Contenu</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
      <c:when test="${empty messages}">
        <tr>
          <td colspan="2" class="empty-message"><i class="fas fa-info-circle"></i> Aucun message disponible pour le moment.</td>
        </tr>
      </c:when>
      <c:otherwise>
        <c:forEach var="message" items="${messages}">
          <tr>
            <td class="message-subject">${message.sujet}</td>
            <td class="message-content">${message.contenu}</td>
          </tr>
        </c:forEach>
      </c:otherwise>
    </c:choose>
    </tbody>
  </table>
</div>
</body>
</html>