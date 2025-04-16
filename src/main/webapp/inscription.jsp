<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Messagerie - Inscription</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/messagerie.css">
</head>
<body>
<header>
    <div class="app-title"><i class="fas fa-envelope icon"></i> Messagerie</div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/accueil"><i class="fas fa-home icon"></i> Accueil</a>
        <a href="${pageContext.request.contextPath}/connexion"><i class="fas fa-sign-in-alt icon"></i> Connexion</a>
        <a href="${pageContext.request.contextPath}/sujets"><i class="fas fa-tags icon"></i> Sujets</a>
    </div>
</header>

<div class="container">
    <div class="form-container fade-in">
        <div class="form-icon">
            <i class="fas fa-user-plus"></i>
        </div>

        <h2 style="text-align: center; border-bottom: none;"><i class="fas fa-user-plus icon"></i> Inscription</h2>

        <c:if test="${not empty erreur}">
            <div class="error-message">
                <i class="fas fa-exclamation-circle icon"></i> ${erreur}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/inscription" method="post">
            <div class="form-group">
                <label for="nom"><i class="fas fa-user icon"></i> Nom:</label>
                <input type="text" id="nom" name="nom" required placeholder="Entrez votre nom">
            </div>

            <div class="form-group">
                <label for="prenom"><i class="fas fa-user icon"></i> Prénom:</label>
                <input type="text" id="prenom" name="prenom" required placeholder="Entrez votre prénom">
            </div>

            <div class="form-group">
                <label for="motDePasse"><i class="fas fa-lock icon"></i> Mot de passe:</label>
                <input type="password" id="motDePasse" name="motDePasse" required placeholder="Créez un mot de passe">
            </div>

            <div class="password-requirements">
                <p><i class="fas fa-info-circle icon"></i> Pour des raisons de sécurité, votre mot de passe doit:</p>
                <div class="requirement"><i class="fas fa-check"></i> Contenir au moins 8 caractères</div>
                <div class="requirement"><i class="fas fa-check"></i> Inclure des lettres et des chiffres</div>
                <div class="requirement"><i class="fas fa-check"></i> Contenir des caractères spéciaux recommandés</div>
            </div>

            <button type="submit" class="btn btn-block"><i class="fas fa-user-plus icon"></i> S'inscrire</button>
        </form>

        <div class="form-footer">
            <p>Déjà inscrit? <a href="${pageContext.request.contextPath}/connexion"><i class="fas fa-sign-in-alt icon"></i> Se connecter</a></p>
        </div>
    </div>
</div>
</body>
</html>