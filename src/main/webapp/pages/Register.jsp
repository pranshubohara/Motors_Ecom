<%@page import="util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/Register.css">
</head>
<body>


<div class="login-wrapper">


        <form action="${pageContext.request.contextPath}/RegisterServlet" method="post" class="form">
            <h2>Register</h2>

            <div class="input-group">
                    <label for="username">Username</label>
                <input type="text" name="username" id="username" required />

            </div>
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" required />

            </div>
            <div class="input-group">
                     <label for="password">Password</label>
                <input type="password" name="password" id="password" required />

            </div>
            <div class="input-group">
                 <label for="phone_number">Phone Number</label>
                <input type="tel" name="phone_number" id="phone_number" required />

            </div>
            <div class="input-group">
                    <label for="address">Address</label>
                <input type="text" name="address" id="address" required />

            </div>
            <input type="submit" value="Register" class="submit-btn" />
        <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
        <p class="error-message"><%=errorMessage%></p>
        <%
        }
        %> 
        </form>
    </div>

</body>
</html>