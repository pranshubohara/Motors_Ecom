package controller.servlets;

import javax.servlet.*;
import javax.servlet.http.*;

import controller.DatabaseController;

import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/DeleteProductServlet"})
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        
        try (Connection conn = new DatabaseController().getConnection()) {
            String sql = "DELETE FROM product_table WHERE PRODUCT_ID = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, productId);
                int result = pstmt.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("pages/Admin.jsp"); // Redirect or display success
                } else {
                    request.setAttribute("error", "No product found with ID: " + productId);
                    request.getRequestDispatcher("pages/Admin.jsp").forward(request, response); // Forward to an error page
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            throw new ServletException("Database connection error", ex);
        }
    }
}
