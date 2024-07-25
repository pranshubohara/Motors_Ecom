package controller.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import controller.DatabaseController;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get product details from request parameters
        String productId = request.getParameter("ProductID");
        String productName = request.getParameter("ProductName");
        String description = request.getParameter("Description");
        String availability = request.getParameter("Availability");
        String stock = request.getParameter("Stock");
        String price = request.getParameter("Price");

        try {
            // Establish database connection
            Connection conn = new DatabaseController().getConnection();
            String sql = "UPDATE product_table SET PRODUCT_NAME = ?, PRODUCT_DESCRIPTION = ?, AVAILABILITY_STATUS = ?, STOCK_LEVEL = ?, PRICE = ? WHERE PRODUCT_ID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            // Set parameters for the prepared statement
            pstmt.setString(1, productName);
            pstmt.setString(2, description);
            pstmt.setString(3, availability);
            pstmt.setString(4, stock);
            pstmt.setDouble(5, Double.parseDouble(price));
            pstmt.setString(6, productId);

            // Execute the update query
            int updated = pstmt.executeUpdate();
            if (updated > 0) {
                // Redirect to the admin page after successful update
                response.sendRedirect("pages/Admin.jsp");
            } else {
                // If no changes were made, forward with an error message
                request.setAttribute("errorMessage", "No changes were made to the product.");
                request.getRequestDispatcher("pages/EditProduct.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Handle any exceptions and forward with an error message
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred.");
            request.getRequestDispatcher("pages/EditProduct.jsp").forward(request, response);
        }
    }
}