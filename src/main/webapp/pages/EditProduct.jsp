<%@page import="controller.DatabaseController"%>
<%@page import="model.ProductModel"%>
<%
    String productId = request.getParameter("productId");
    DatabaseController dbController = new DatabaseController();
    ProductModel product = dbController.getProductById(productId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .form-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            width: 60%;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        form input[type="text"],
        form textarea {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        form input:focus,
        form textarea:focus {
            border-color: #666;
        }

        button[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="form-wrapper">
    <form action="${pageContext.request.contextPath}/UpdateProductServlet" method="post">
        <div class="form-group">
            <label for="ProductName">Product Name:</label>
            <input type="text" name="ProductName" id="ProductName" value="<%= product.getPRODUCT_NAME() %>" required>
        </div>
        <div class="form-group">
            <label for="Description">Description:</label>
            <textarea name="Description" id="Description"><%= product.getPRODUCT_DESCRIPTION() %></textarea>
        </div>
        <div class="form-group">
            <label for="Availability">Availability:</label>
            <input type="text" name="Availability" id="Availability" value="<%= product.getAVAILABILITY_STATUS() %>" required>
        </div>
        <div class="form-group">
            <label for="Stock">Stock:</label>
            <input type="text" name="Stock" id="Stock" value="<%= product.getSTOCK_LEVEL() %>" required>
        </div>
        <div class="form-group">
            <label for="Price">Price:</label>
            <input type="text" name="Price" id="Price" value="<%= product.getPRICE() %>" required>
        </div>
        <input type="hidden" name="ProductID" value="<%= product.getPRODUCT_ID() %>" readonly>
        <button type="submit">Save</button>
    </form>
</div>
</body>
</html>