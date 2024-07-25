<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <link rel="stylesheet" href="../stylesheets/Style.css">
</head>
<style>
    /* Add your CSS styles here */
    .container_product {
        padding-top: 50px;
        padding-bottom: 20px;
        max-width: 100%;
        margin: 0 auto;
        padding-left: 20px;
        padding-right: 20px;
    }

    table {
    	background-color:white;
        width: 95%;
        border-collapse: collapse;
        margin: 0 auto;
        font-size:20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }
    .action-form {
    display: inline-block; /* Ensure buttons are displayed in the same line */
    margin-bottom: 10px; /* Add some space between the forms */
	}
	
	.action-form {
    display: inline-block;
    margin-bottom: 10px;
		}
		
		.btnEdt, .btnDlt {
		    width: 100px;
		    height: 30px;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s;
		}
		
		.btnEdt {
		    background-color: #4CAF50;
		}
		
		.btnDlt {
		    background-color: #f44336; /* Red color for delete button */
		}

		.btnEdt:hover, .btnDlt:hover {
		    background-color: #45a049; /* Lighter color on hover */
		}
			
		    
 /* CSS for the add-product container */
    .add-product-container {
   		
        max-width: 90%;
        margin: 0 auto;
        padding: 10px;
        background-color: #f9f9f9;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    /* CSS for the form to add a new product */
    .add-product-form label {
        display: block;
        margin-bottom: 5px;
        font-size:20px;
    }

    .add-product-form input[type="text"],
    .add-product-form textarea,
    .add-product-form input[type="number"],
    .add-product-form input[type="file"] {
        width: 60%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        margin-bottom: 25px;
    }

    .add-product-form input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
    }

    .add-product-form input[type="submit"]:hover {
        background-color: #45a049;
    }
	.welcome{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            padding-top:20;
           
            padding: 80px;
            font-size: 50px;
            color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
		
		.button-container {
		    display: flex;
		    justify-content: center; /* Center the buttons horizontally */
		    margin-bottom: 20px;
		}
		
		.toggle-btn {
		    padding: 60px 125px; /* Adjust padding for better appearance */
		    margin: 0 10px; /* Add some margin between buttons */
		    background-color: #ff5722;
		    color: white;
		    font-size:30px;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: background-color 0.3s;
		}
		
		.toggle-btn:hover {
		    background-color: #e64a19;
		}
		
		.content {
		    display: none;
		}
		
		#view-all-products{
		padding: 20px;
        background-color: #f9f9f9;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}
		
		#add-item{
		padding: 20px;
        background-color: #f9f9f9;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    
		}
		
		
		#order-info {
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .order-table {
        width: 90%;
        border-collapse: collapse;
    }

    .order-table th, .order-table td {
        padding: 10px;
        border: 1px solid #ddd;
    }

    .order-table th {
        background-color: #f2f2f2;
    }
    
    .popup {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 999;
    background-color: rgba(0, 0, 0, 0.5);
    width: 80%;
    max-width: 600px;
    padding: 20px;
    border-radius: 10px;
}

.popup-content {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    position: relative;
}

.close {
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
    font-size: 20px;
}
	
	//edit form
	.edit-form {
    width: 100%;
}

.edit-form {
    width: 100%;
}

.edit-input,
.edit-textarea {
    width: calc(100% - 20px);
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 16px;
}

.edit-submit {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
}

.edit-submit:hover {
    background-color: #45a049;
}

/* Optional: Style the labels for better alignment */
label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}


.close {
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
    font-size: 24px;
    color: #aaa;
}

.close:hover {
    color: #000;
}
			
</style>

<body>
<jsp:include page="HeaderAdmin.jsp"/>
	<div class="welcome">
	<h1>WELCOME ADMIN</h1>
	</div>
    

    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/user_info"
        user="root"  password=""/>
    
    <sql:query var="products" dataSource="${db}">
        SELECT * FROM product_table;
    </sql:query>
    <sql:query var="orders" dataSource="${db}">
        SELECT * FROM order_table;
    </sql:query>
    
    <div class="button-container">
	    <button class="toggle-btn" data-target="view-all-products">View all Products</button>
	    <a href="AddProduct.jsp"><button class="toggle-btn" data-target="add-item">Add Item</button></a>
	    <button class="toggle-btn" data-target="order-info">Order Information</button>
	</div>

<div class="content-container">
    <div id="view-all-products" class="content" style="display:none;">
        <div class="container_product">
        <table>
            <thead>
                <tr>
                    <th>Product Image</th>
                    <th>Product Title</th>
                    <th>Description</th>
                    <th>Availability</th>
                    <th>Product ID</th>
                    <th>Stock</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products.rows}">
                    <tr>
			            <td>
					   		 <img src="<c:out value='../image/${product.product_id}.jpeg'/>" 
					         alt="<c:out value='${product.product_name}'/>" 
					         class="product-image" 
					         style="width: 100px; height: 100px;">
						</td>
		                <td><c:out value='${product.product_name}'/></td>
                        <td><c:out value="${product.product_description}"/></td>
                        <td><c:out value="${product.availability_status}"/></td>
                        <td><c:out value="${product.product_id}"/></td>
                        <td><c:out value="${product.stock_level}"/></td>
                        <td>$<c:out value="${product.price}"/></td>
                        <td>
                            <form method="post">
							    <input type="hidden" name="productId" value="${product.product_id}">
								<a href="EditProduct.jsp?productId=${product.product_id}">
    							<button type="button" class="btnEdt">Edit</button>
								</a>


							</form>

                            <br>                 
                            <form action="${pageContext.request.contextPath}/DeleteProductServlet" method="post">
							    <input type="hidden" name="productId" value="${product.product_id}">
							    <button type="submit" class="btnDlt">Delete</button>
							</form>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    </div>
    
  

</div>
    
    <div id="order-info" class="content" style="display:none;">
        
    <div class="container_product">
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Order Status</th>
                    <th>Total Amount</th>
                    <th>User Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders.rows}">
                    <tr>
                        <td><c:out value="${order.order_id}"/></td>
                        <td><c:out value="${order.order_status}"/></td>
                        <td><c:out value="${order.total_amount}"/></td>
                        <td><c:out value="${order.username}"/></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    </div>
    
    
<script>
document.addEventListener('DOMContentLoaded', function () {
    const toggleButtons = document.querySelectorAll('.toggle-btn');

    toggleButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            const targetId = button.getAttribute('data-target');
            const targetContent = document.getElementById(targetId);
            const allContents = document.querySelectorAll('.content');

            allContents.forEach(function (content) {
                content.style.display = 'none';
            });

            targetContent.style.display = 'block';
        });
    });
});

function showEditPopup() {
    // Show the popup
    document.getElementById('editPopup').style.display = 'block';
}

function closeEditPopup() {
    // Hide the popup
    document.getElementById('editPopup').style.display = 'none';
}
</script>






</body>
</html>