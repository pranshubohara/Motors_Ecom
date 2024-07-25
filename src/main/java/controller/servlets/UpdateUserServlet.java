package controller.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.DriverManager;


@WebServlet(name = "UpdateUserServlet", urlPatterns = {"/UpdateUserServlet"})
public class UpdateUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");  // Ensure this attribute is correctly set when the user logs in

        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String address = request.getParameter("address");

        if (username != null) {
            try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_info", "root", "");
                 PreparedStatement pstmt = conn.prepareStatement(
                    "UPDATE user_table SET email = ?, phone_number = ?, address = ? WHERE username = ?")) {

                pstmt.setString(1, email);
                pstmt.setString(2, phoneNumber);
                pstmt.setString(3, address);
                pstmt.setString(4, username);

                int updated = pstmt.executeUpdate();
                if (updated > 0) {
                    response.sendRedirect("pages/UserProfile.jsp"); // Redirect to user profile page
                } else {
                    request.setAttribute("errorMessage", "No updates made to the profile.");
                    request.getRequestDispatcher("pages/EditProfile.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                throw new ServletException("Database connection problem.", e);
            }
        } else {
            request.setAttribute("errorMessage", "User is not logged in.");
            request.getRequestDispatcher("pages/Login.jsp").forward(request, response);
        }
    }
}
