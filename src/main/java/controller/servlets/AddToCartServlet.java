package controller.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.DatabaseController;

@WebServlet("/AddToCart")
public class AddToCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/user_info";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    // SQL Insert statement
    private static final String INSERT_SQL = "INSERT INTO cart_table (CART_ID, username, PRODUCT_ID) VALUES (?, ?, ?)";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get product_id from request
        String productId = request.getParameter("productId");
        String username = (String) request.getSession().getAttribute("username");;
        
        
        
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Get the next cart ID
        	int cartId = new DatabaseController().getNextCartId(conn);

            // Insert data into the cart_table
            try (PreparedStatement stmt = conn.prepareStatement(INSERT_SQL)) {
                stmt.setInt(1, cartId);
                stmt.setString(2, username);
                stmt.setInt(3, Integer.parseInt(productId));
                stmt.executeUpdate();
            }

            // Redirect to the cart page or show a success message
            response.sendRedirect("pages/Product.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

