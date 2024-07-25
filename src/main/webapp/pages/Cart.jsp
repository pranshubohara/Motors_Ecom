<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/Cart.css" />
</head>

<body>
    <jsp:include page="Header.jsp"/>
	<jsp:include page="Footer.jsp"/>
    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/user_info" user="root"  password=""/>

    <sql:query dataSource="${dataSource}" var="carts">
        SELECT c.CART_ID, p.product_name, p.price 
        FROM cart_table c
        JOIN product_table p ON c.PRODUCT_ID = p.product_id
        WHERE c.username = ?
        <sql:param value="${sessionScope.username}"/>
    </sql:query>
    
    <div class="cart">
        <h2>Shopping Cart</h2>
        <c:choose>
            <c:when test="${empty sessionScope.username}">
                <p>Login is required to view the shopping cart.</p>
            </c:when>
            <c:when test="${not empty carts.rows}">
                <div class="row">
                    <c:set var="totalAmount" value="0"/> <!-- Initialize the total amount -->
                    <c:forEach var="cart" items="${carts.rows}">
                        <div class="product-box">
                            <form action="${pageContext.request.contextPath}/RemoveCartItemServlet" method="post">
                                <input type="hidden" name="cartId" value="${cart.CART_ID}" />
                                <button type="submit" class="remove-button">x</button>
                            </form>                   	

                            <h3 class="product-title">${cart.product_name}</h3>
                            <p class="product-price">Price: $<fmt:formatNumber value="${cart.price}" type="number"/></p>
                            <p class="product-id">Cart Item: ${cart.CART_ID}</p>
                            <c:set var="totalAmount" value="${totalAmount + cart.price}"/> <!-- Calculate total -->
                        </div>
                    </c:forEach>
                    <div class="total">
                        Total: $<fmt:formatNumber value="${totalAmount}" type="number"/>
                    </div>
                    
                    <form id="order-form" action="${pageContext.request.contextPath}/AddOrderServlet" method="post">
                        <input type="hidden" name="totalAmount" value="${totalAmount}" />
                        <button type="button" id="order-button" onclick="placeOrder()">Order</button>
                    </form>				
                </div>
            </c:when>
            <c:otherwise>
                <p>No items in the cart.</p>
            </c:otherwise>
        </c:choose>
    </div>
    
    <script>
        // Function to display items in the cart when the page loads
        window.onload = function() {
            displayCartItems();
        };
        
        
        
        // Function to display items in the cart
        function displayCartItems() {
            var cartContainer = document.getElementById("cart-product-container");
            var totalAmount = 0;

            // Retrieve items from local storage
            var cartItems = JSON.parse(localStorage.getItem("cartItems")) || [];

            // Clear previous items in the cart
            cartContainer.innerHTML = "";

            // Iterate through each item and display it in the cart
            cartItems.forEach(function(item) {
                var cartProduct = document.createElement("div");
                cartProduct.classList.add("product");

                var cartImg = document.createElement("img");
                cartImg.src = item.imageSrc;
                cartImg.alt = item.name;
                cartProduct.appendChild(cartImg);

                var cartProductInfo = document.createElement("div");
                cartProductInfo.classList.add("product-info");

                var cartProductName = document.createElement("h3");
                cartProductName.textContent = item.name;
                cartProductInfo.appendChild(cartProductName);

                var cartProductPrice = document.createElement("p");
                cartProductPrice.textContent = "Price: $" + item.price;
                cartProductInfo.appendChild(cartProductPrice);

                cartProduct.appendChild(cartProductInfo);
                cartContainer.appendChild(cartProduct);

                // Calculate total amount
                totalAmount += item.price;
            });

            // Update total amount
            document.getElementById("total-amount").textContent = "$" + totalAmount.toFixed(2);
        }

        function removeProductBox(button) {
            var productBox = button.parentElement;
            productBox.remove();
        }

        function placeOrder() {
            document.getElementById('order-form').submit();
            alert("Your order has been placed successfully!");
        }
        
    </script>
</body>
</html>
