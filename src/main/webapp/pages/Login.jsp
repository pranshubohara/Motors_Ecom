<%@page import="util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/Login.css" />
<title>Login</title>
</head>
<body>

<div class="login-wrapper">
		<form action="${pageContext.request.contextPath}/LoginServlet" method="post" class="form">
        <h2>Login</h2>
        <div class="input-group">
            <label for="loginUser">User Name</label>
            <input type="text" name="username" id="loginUser" required />
            
        </div>
        <div class="input-group">
            <label for="loginPassword">Password</label>
            <input type="password" name="password" id="loginPassword" required />
            
        </div>
        <input type="submit" value="Login" class="submit-btn" />
        <div class="forgot-password">
        	
        	<br>
        	<br>
        	<p>
        	Don't have an account?
        	</p>
            <a href="Register.jsp">Please Register</a>
            <br>
        </div>
        <br>
     	<%
			String errMsg = (String) request.getAttribute(StringUtils.MESSAGE_ERROR);
			String successMsg = (String) request.getAttribute(StringUtils.MESSAGE_SUCCESS);

			if (errMsg != null) {
				// print
				%>
				<h7 class="success-msg"><% out.println(errMsg); %></h7>
				<%
			}

			if (successMsg != null) {
				// print
				out.println(successMsg);
			}
			%>
    </form>
</div>
</body>
</html>
