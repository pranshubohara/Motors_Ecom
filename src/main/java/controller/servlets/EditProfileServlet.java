package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String username = (String) session.getAttribute("username");
        String phoneNumber = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_info", "root", "");

            String sql = "UPDATE user_table SET phone_number = ?, email = ?, address = ? WHERE username = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, phoneNumber);
            pstmt.setString(2, email);
            pstmt.setString(3, address);
            pstmt.setString(4, username); // Set the username in the prepared statement

            int updated = pstmt.executeUpdate();

            if (updated > 0) {
                response.sendRedirect("pages/UserProfile.jsp?success=Profile updated successfully");
            } else {
                response.sendRedirect("pages/UserProfile.jsp?error=No changes made");
            }
        } catch (Exception e) {
            try {
                if (conn != null) conn.rollback(); // Rollback on error
            } catch (SQLException se) {
                se.printStackTrace();
            }
            e.printStackTrace();
            response.sendRedirect("pages/UserProfile.jsp?error=Error updating profile");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
