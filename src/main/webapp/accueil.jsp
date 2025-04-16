<%--
  Created by IntelliJ IDEA.
  User: mouad
  Date: 4/16/2025
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Messagerie - Accueil</title>
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
  </style>
</head>
<body>
<header>
  <h1>Messagerie</h1>
  <div class="nav-links">
    <a href="${pageContext.request.contextPath}/connexion">Connexion</a>
    <a href="${pageContext.request.contextPath}/inscription">Inscription</a>
    <a href="${pageContext.request.contextPath}/sujets">Sujets</a>
  </div>
</header>

<h2>Liste des messages</h2>

<table>
  <thead>
  <tr>
    <th>Sujet</th>
    <th>Contenu</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="message" items="${messages}">
    <tr>
      <td>${message.sujet}</td>
      <td>${message.contenu}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>