<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Messagerie - Inscription</title>
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
        .form-container {
            max-width: 500px;
            margin: 0 auto;
            padding: 30px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            transition: border-color 0.3s;
            font-size: 16px;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #4a6fa5;
            outline: none;
            box-shadow: 0 0 0 2px rgba(74, 111, 165, 0.2);
        }
        .btn {
            display: inline-block;
            padding: 12px 20px;
            background-color: #4a6fa5;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 16px;
            font-weight: 600;
            width: 100%;
        }
        .btn:hover {
            background-color: #3a5d7f;
        }
        .error-message {
            color: #e74c3c;
            background-color: #fdecea;
            padding: 12px;
            border-radius: 4px;
            margin-bottom: 20px;
            border-left: 4px solid #e74c3c;
        }
        .form-footer {
            margin-top: 25px;
            text-align: center;
            color: #7f8c8d;
        }
        .form-footer a {
            color: #4a6fa5;
            text-decoration: none;
            font-weight: 600;
        }
        .form-footer a:hover {
            text-decoration: underline;
        }
        .form-icon {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-icon i {
            font-size: 50px;
            color: #4a6fa5;
        }
        .password-requirements {
            margin-top: 20px;
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 4px;
            border-left: 3px solid #4a6fa5;
        }
        .requirement {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
            color: #555;
        }
        .requirement i {
            margin-right: 8px;
            color: #4a6fa5;
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
        <a href="${pageContext.request.contextPath}/accueil"><i class="fas fa-home icon"></i> Accueil</a>
        <a href="${pageContext.request.contextPath}/connexion"><i class="fas fa-sign-in-alt icon"></i> Connexion</a>
        <a href="${pageContext.request.contextPath}/sujets"><i class="fas fa-tags icon"></i> Sujets</a>
    </div>
</header>

<div class="container">
    <div class="form-container">
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

            <button type="submit" class="btn"><i class="fas fa-user-plus icon"></i> S'inscrire</button>
        </form>

        <div class="form-footer">
            <p>Déjà inscrit? <a href="${pageContext.request.contextPath}/connexion"><i class="fas fa-sign-in-alt icon"></i> Se connecter</a></p>
        </div>
    </div>
</div>
</body>
</html>