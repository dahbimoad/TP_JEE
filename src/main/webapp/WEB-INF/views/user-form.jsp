<%--
  Created by IntelliJ IDEA.
  User: mouad
  Date: 4/16/2025
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${user != null ? 'Edit User' : 'Add New User'}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        .form-container {
            max-width: 500px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn {
            display: inline-block;
            padding: 10px 15px;
            margin: 5px 0;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-secondary {
            background-color: #6c757d;
        }
    </style>
</head>
<body>
<h1>${user != null ? 'Edit User' : 'Add New User'}</h1>

<div class="form-container">
    <c:if test="${user != null}">
    <form action="${pageContext.request.contextPath}/users/update" method="post">
        <input type="hidden" name="id" value="${user.id}" />
        </c:if>
        <c:if test="${user == null}">
        <form action="${pageContext.request.contextPath}/users" method="post">
            </c:if>

            <div class="form-group">
                <label for="nom">Nom:</label>
                <input type="text" id="nom" name="nom" value="${user != null ? user.nom : ''}" required />
            </div>

            <div class="form-group">
                <label for="prenom">Prénom:</label>
                <input type="text" id="prenom" name="prenom" value="${user != null ? user.prenom : ''}" required />
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${user != null ? user.email : ''}" required />
            </div>

            <div>
                <button type="submit" class="btn">Save</button>
                <a href="${pageContext.request.contextPath}/users" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
</div>
</body>
</html>