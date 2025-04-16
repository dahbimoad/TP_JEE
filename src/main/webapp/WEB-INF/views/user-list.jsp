<%--
  Created by IntelliJ IDEA.
  User: mouad
  Date: 4/16/2025
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User Management</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
    }
    h1 {
      color: #333;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    th, td {
      padding: 10px;
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
      padding: 8px 12px;
      margin: 5px;
      background-color: #4CAF50;
      color: white;
      text-decoration: none;
      border-radius: 4px;
    }
    .btn-danger {
      background-color: #f44336;
    }
    .btn-warning {
      background-color: #ff9800;
    }
  </style>
</head>
<body>
<h1>User Management</h1>

<div>
  <a href="${pageContext.request.contextPath}/users/new" class="btn">Add New User</a>
</div>

<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>Nom</th>
    <th>Prénom</th>
    <th>Email</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="user" items="${users}">
    <tr>
      <td>${user.id}</td>
      <td>${user.nom}</td>
      <td>${user.prenom}</td>
      <td>${user.email}</td>
      <td>
        <a href="${pageContext.request.contextPath}/users/edit?id=${user.id}" class="btn btn-warning">Edit</a>
        <a href="${pageContext.request.contextPath}/users/delete?id=${user.id}" class="btn btn-danger"
           onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>