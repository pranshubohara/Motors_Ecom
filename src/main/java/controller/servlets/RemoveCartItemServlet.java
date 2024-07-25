package controller.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;

@WebServlet("/RemoveCartItemServlet")
public class RemoveCartItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cartId = request.getParameter("cartId");
        String username = (String) request.getSession().getAttribute("username"); // Get username from session

        if (cartId != null && username != null) {
            try (Connection conn = new DatabaseController().getConnection();
                 PreparedStatement stmt = conn.prepareStatement("DELETE FROM cart_table WHERE CART_ID = ? AND username = ?")) {
                stmt.setInt(1, Integer.parseInt(cartId));
                stmt.setString(2, username);
                int result = stmt.executeUpdate();

                if (result > 0) {
                    // Redirect back to the cart page after successful deletion
                    response.sendRedirect("pages/Cart.jsp");
                } else {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Failed to delete item.");
                }
            } catch (SQLException | ClassNotFoundException ex) {
                ex.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + ex.getMessage());
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid cart ID or user session.");
        }
    }
}
