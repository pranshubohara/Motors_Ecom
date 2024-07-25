<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #212121;
        margin: 0;
        padding: 0;
        color: #fff;
    }

    .login-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 900px;
         
    }

    .form-container {
        width: 60%;
        
        transition: transform 0.3s; /* Apply transition for smooth hover effect */
        position: relative; /* Add position relative for absolute positioning */
    }

    .form {
        background-color: #333;
        padding: 30px;
        border-radius: 8px;
        height: 500px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        max-width: 400px;
        width: 100%;
        position: absolute; /* Position the form absolutely within the container */
        top: 50%; /* Move the form down by half its height */
        left: 50%; /* Move the form horizontally by half its width */
        transform: translate(-50%, -50%); /* Center the form */
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #fff;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group input {
        width: calc(100% - 20px);
        padding: 10px;
        border-radius: 4px;
        border: 1px solid #555;
        background-color: #444;
        color: #fff;
    }

    .form-group label {
        font-size: 14px;
        color: #fff;
    }

    .button-container {
        display: flex;
        justify-content: space-between;
    }

    .button {
        background-color: #ff5722;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        width: 48%;
        transition: background-color 0.3s ease;
    }

    .button:hover {
        background-color: #e64a19;
    }

    .back-button {
        background-color: #ff5722;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
        width: 48%;
        transition: background-color 0.3s ease;
    }

    .back-button:hover {
        background-color: #e64a19;
    }
    .back{
    color:white;
    }
    </style>
</head>
<body>
 	<jsp:include page="Header.jsp"/>
     <jsp:include page="Footer.jsp"/>
    <div class="login-wrapper">
        <div class="form-container">
            <form id="editForm" action="../UpdateUserServlet" method="post" class="form">
                <h2>Update Details</h2>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" required />
                </div>

                <div class="form-group">
                    <label for="phone_number">Phone Number</label>
                    <input type="tel" name="phone_number" id="phone_number" required />
                </div>
                
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" name="address" id="address" required />
                </div>
                
                <div class="button-container">
                    <button type="submit" class="button">Save</button>
                    <button type="button" class="back-button"><a href ="UserProfile.jsp" class="back">Back</a>
                </div></button>
            </form>
        </div>
    </div>

    <script>
    function goBack() {
        window.history.back();
    }
    </script>
</body>
</html>