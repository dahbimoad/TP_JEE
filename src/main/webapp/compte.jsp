<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Messagerie - Mon Compte</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/messagerie.css">
</head>
<body>
<header>
  <div class="app-title"><i class="fas fa-envelope icon"></i> Messagerie</div>
  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/accueil"><i class="fas fa-home icon"></i> Accueil</a>
    <a href="${pageContext.request.contextPath}/sujets"><i class="fas fa-tags icon"></i> Sujets</a>
    <a href="${pageContext.request.contextPath}/deconnexion" class="btn btn-danger"><i class="fas fa-sign-out-alt icon"></i> Déconnexion</a>
  </div>
</header>

<div class="container">
  <div class="welcome-message fade-in">
    <h2><i class="fas fa-user-circle icon"></i> Bienvenue, ${sessionScope.utilisateur.prenom} ${sessionScope.utilisateur.nom}</h2>
    <p>Voici vos messages personnels. Vous pouvez consulter tous les messages qui vous sont adressés.</p>
  </div>

  <div class="card fade-in">
    <h2 class="card-title"><i class="fas fa-envelope-open-text icon"></i> Mes Messages</h2>

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
            <td colspan="2" class="empty-message"><i class="fas fa-info-circle"></i> Vous n'avez pas encore de messages.</td>
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

  <div class="session-info">
    <p><i class="fas fa-key icon"></i> Session ID: <%= session.getId() %> | <i class="fas fa-clock icon"></i> Créée le: <%= new java.util.Date(session.getCreationTime()) %> | <i class="fas fa-hourglass-half icon"></i> Expire dans: <%= session.getMaxInactiveInterval() / 60 %> minutes</p>
  </div>
</div>
</body>
</html>