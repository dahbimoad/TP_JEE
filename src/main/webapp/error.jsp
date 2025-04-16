<%--
  Created by IntelliJ IDEA.
  User: mouad
  Date: 4/16/2025
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Error</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
      padding: 20px;
      background-color: #f8f8f8;
    }
    .error-container {
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      padding: 20px;
      max-width: 800px;
      margin: 0 auto;
    }
    h1 {
      color: #e74c3c;
    }
    .error-details {
      background-color: #f5f5f5;
      padding: 15px;
      border-radius: 4px;
      margin-top: 20px;
    }
    .btn {
      display: inline-block;
      padding: 10px 15px;
      margin-top: 20px;
      background-color: #3498db;
      color: white;
      text-decoration: none;
      border-radius: 4px;
    }
  </style>
</head>
<body>
<div class="error-container">
  <h1>Error</h1>
  <p>Sorry, an error occurred while processing your request.</p>

  <div class="error-details">
    <h3>Error Details:</h3>
    <p><strong>Type:</strong> ${pageContext.exception.getClass().getName()}</p>
    <p><strong>Message:</strong> ${pageContext.exception.message}</p>
  </div>

  <a href="${pageContext.request.contextPath}/users" class="btn">Return to Home</a>
</div>
</body>
</html>