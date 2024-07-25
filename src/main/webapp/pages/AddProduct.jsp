<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .form-container {
            width: 60%;
         	max-width: 400px;
         	color: grey;
        }

        .form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .form-group {
            margin-bottom: 20px;
            
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group textarea,
        .form-group .file-input {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .form-group input:focus,
        .form-group textarea:focus,
        .form-group .file-input:focus {
            border-color: #666;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="form-container">
	<form id="addItemForm" action="../AddProductServlet" method="post" >
        <h2>Add Item</h2>

        <div class="form-group">
            <label for="product_id">Product ID:</label>
            <input type="text" name="product_id" id="product_id" required />
        </div>

        <div class="form-group">
            <label for="product_name">Product Name:</label>
            <input type="text" name="product_name" id="product_name" required />
        </div>

        <div class="form-group">
            <label for="product_description">Description:</label>
            <textarea name="product_description" id="product_description" required></textarea>
        </div>

        <div class="form-group">
            <label for="availability_status">Availability:</label>
            <input type="text" name="availability_status" id="availability_status" required />
        </div>

        <div class="form-group">
            <label for="stock_level">Stock:</label>
            <input type="text" name="stock_level" id="stock_level" required />
        </div>
		
		<div class="form-group">
            <label for="category_id">Category ID:</label>
            <input type="text" name="category_id" id="category_id" required />
        </div>
        
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="text" name="price" id="price" required />
        </div>

        

        <div class="button-container">
            <button type="submit">Save</button>
            <button type="button"><a href ="Admin.jsp" style="text-decoration: none; color: white;">Back</a></button>
        </div>
    </form>
</div>
</body>
</html>