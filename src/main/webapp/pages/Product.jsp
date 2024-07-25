<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/stylesheets/Product.css" /></head>

<body>
    <jsp:include page="Header.jsp"/>
	<jsp:include page="Footer.jsp"/>
    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
     	url="jdbc:mysql://localhost:3306/user_info"
     	user="root"  password=""/>

	<sql:query var="products" dataSource="${db}">
    	SELECT * FROM product_table;
	</sql:query>
	
    <div class="container_product">
        <div class="row">
            <c:forEach var="product" items="${products.rows}">
                <form action="../AddToCart" method="post" id="add-to-cart-form-${product.product_id}">
                    <input type="hidden" name="productId" value="${product.product_id}">
                    <div class="product-box">
                        <img src="<c:out value='../image/${product.product_id}.jpeg'/>" alt="<c:out value='${product.product_name}'/>" class="product-image">
            			<h3 class="product-title"><c:out value='${product.product_name}'/></h3>
                        <p class="product-description"><c:out value="${product.product_description}"/></p>
                        <p class="product-price">Product ID: <c:out value="${product.product_id}"/></p>
                        <p class="product-price">Price: $<c:out value="${product.price}"/></p>
                        <button type="button" class="add-to-cart-button" onclick="handleAddToCart(event, ${product.product_id})">
                            Add to Cart
                        </button>
                    </div>
                </form>
            </c:forEach>
        </div>
    </div>

    <footer class="fo"#">Instagram</a></li>
                </ul>
            </div>
            <div class="contact-info">
                <h3>Contact Us</h3>
                <p>Email: info@example.com</p>
                <p>Phone: +1 234 567 890</p>
            </div>
       		 </div>
    </footer>

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
</body>
</html>
