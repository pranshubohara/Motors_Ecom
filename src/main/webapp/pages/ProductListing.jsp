<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="util.StringUtils"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<jsp:include page="Footer.jsp"/>
<%
    HttpSession userSession = request.getSession();
    String currentUser = (String) userSession.getAttribute(StringUtils.USERNAME);
    String contextPath = request.getContextPath();
%>

 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/stylesheets/ProductListing.css">


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
             <a href="${pageContext.request.contextPath}/pages/Home.jsp">Home</a>
             <a href="${pageContext.request.contextPath}/pages/Product.jsp">Products</a>
             <a href="${pageContext.request.contextPath}/pages/Aboutus.jsp">About Us</a>
             <a href="${pageContext.request.contextPath}/pages/Cart.jsp">Cart</a>
             <a href="${pageContext.request.contextPath}/pages/UserProfile.jsp">Profile </a> 
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
 
<c:if test="${not empty products}">
    <div class="product-list">
        <c:forEach items="${products}" var="product">
            <div class="product">
                <h3>${product.PRODUCT_NAME}</h3>
                <p>${product.PRODUCT_DESCRIPTION}</p>
                <p>Price: ${product.PRICE}</p>
                <form id="add-to-cart-form-${product.PRODUCT_ID}" action="${pageContext.request.contextPath}/AddToCart" method="post">
                    <input type="hidden" name="productId" value="${product.PRODUCT_ID}">
                    <button type="button" class="add-to-cart-button" onclick="handleAddToCart(event, ${product.PRODUCT_ID})">
                        Add to Cart
                    </button>
                </form>
            </div>
        </c:forEach>
    </div>
</c:if>
<c:if test="${empty products}">
    <p>No products found.</p>
</c:if>

  <div id="loginPopup" class="popup">
        <div class="popup-content">
            <span class="close" onclick="closeLoginPopup()">&times;</span>
            <p>Login Required To Add Item To Cart</p>
        </div>
    </div>
 
<% 
    // Check if the "user" cookie is present
    Cookie[] cookies = request.getCookies();
    boolean sessionExists = false;
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user")) {
                sessionExists = true;
                break;
            }
        }
    }
%>
<script>
    function handleAddToCart(event, productId) {
        <% if (!sessionExists) { %>
            showLoginPopup();
        <% } else { %>
            document.getElementById('add-to-cart-form-' + productId).submit();
        <% } %>
    }

    function showLoginPopup() {
        var popup = document.getElementById("loginPopup");
        popup.style.display = "block";
    }

    function closeLoginPopup() {
        var popup = document.getElementById("loginPopup");
        popup.style.display = "none";
    }
</script>

