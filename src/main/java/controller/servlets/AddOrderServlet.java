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

@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // SQL Insert statement
    private static final String INSERT_SQL = "INSERT INTO order_table (ORDER_ID, ORDER_STATUS, TOTAL_AMOUNT, username) VALUES (?, ?, ?, ?)";
    private static final String DELETE_CART_ITEMS_SQL = "DELETE FROM cart_table WHERE username = ?";
    
    // Database Controller instance
    private final DatabaseController dbController = new DatabaseController();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        String totalAmountStr = request.getParameter("totalAmount");

        

        try {
            int totalAmount = Integer.parseInt(totalAmountStr);

            // Obtain a database connection and get the next Order ID
            try (Connection conn = dbController.getConnection()) {
                
            	conn.setAutoCommit(false);
            	
            	int nextOrderId = dbController.getNextOrderID(conn);

                // Prepare the SQL statement
            	
            	try (PreparedStatement insertStmt = conn.prepareStatement(INSERT_SQL, PreparedStatement.RETURN_GENERATED_KEYS)) {
            		insertStmt.setInt(1, nextOrderId);
                	insertStmt.setString(2, "Pending"); // Initial status
                	insertStmt.setInt(3, totalAmount);
                	insertStmt.setString(4, username);
                    int affectedRows = insertStmt.executeUpdate();
                    
                    if (affectedRows == 0) {
                        throw new SQLException("Creating order failed, no rows affected.");
                    }
                    
                 // Delete user's cart items
                    try (PreparedStatement deleteStmt = conn.prepareStatement(DELETE_CART_ITEMS_SQL)) {
                        deleteStmt.setString(1, username);
                        deleteStmt.executeUpdate();
                    }
                 
                    // Commit transaction
                    conn.commit();
                    response.sendRedirect("pages/Product.jsp");
                } catch (SQLException ex) {
                    conn.rollback();
                    throw ex;
                }
            } catch (SQLException | ClassNotFoundException ex) {
                ex.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + ex.getMessage());
            }
        } catch (NumberFormatException ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid total amount value.");
        }
    }
}