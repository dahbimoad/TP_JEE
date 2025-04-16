<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Messagerie - Accueil</title>
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
  <div class="card fade-in">
    <h2 class="card-title"><i class="fas fa-list icon"></i> Liste des messages</h2>

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
</div>
</body>
</html>