<%@page import="util.StringUtils"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%
    HttpSession userSession = request.getSession();
    String currentUser = (String) userSession.getAttribute(StringUtils.USERNAME);
    String contextPath = request.getContextPath();
%>

<link rel="stylesheet" type="text/css" href="../stylesheets/Header.css">


 <header class="header">
     <div class="navbar" id="navbar">
         <div class="brand"><a href="Home.jsp">Motor.</a></div>
         <div class="search-bar">
    		<form action="${pageContext.request.contextPath}/SearchProductServlet" method="get">
 				<input type="text" name="productName" placeholder="Search by name...">
 				<input type="text" name="unitPrice" placeholder="Price...">
 				<button type="submit">Search</button>
			</form>

		</div>

        <div class="nav-links">
             <a href="Home.jsp">Home</a>
             <a href="Product.jsp">Products</a>
             <a href="Aboutus.jsp">About Us</a>
             <a href="Cart.jsp">Cart</a>
             <a href="UserProfile.jsp">Profile </a> 
             <form action="<%
                 // Conditionally set the action URL based on user session
                 if (currentUser != null) {
                     out.print(contextPath + StringUtils.SERVLET_URL_LOGOUT);
                 } else {
                     out.print(contextPath + StringUtils.LOGIN_URL);
                 }
             %>" method="post">
                 <input type="submit" value="<%
                     // Conditionally set the button label based on user session
                     if (currentUser != null) {
                         out.print("Logout");
                     } else {
                         out.print("Login");
                     }
                 %>"/>
             </form>
         </div>
     </div>
 </header>

