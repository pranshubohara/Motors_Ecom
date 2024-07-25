<%@ page import="controller.DatabaseController" %>
<%@ page import="model.UserModel" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.Cookie" %>  
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>

</head>

<body>
    <%
        Cookie[] cookies = request.getCookies();
        String username = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user")) {
                    username = cookie.getValue();
                    break;
                }
            }
        }

        DatabaseController dbController = new DatabaseController();
        List<UserModel> userList = dbController.getUserByUsername(username);
        UserModel user = null;
        if (!userList.isEmpty()) {
            user = userList.get(0);
        }
    %>

    <form action="../EditProfileServlet" method="post" class="form">
        <h2>Update Details</h2>
        <div class="form-group">
            <label for="name">Username:</label>
            <div class="readonly-box"><%= user != null ? user.getUsername() : "" %></div>
        </div>
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
        <button type="submit" class="button">Save</button>
    </form>
</body>
</html>
