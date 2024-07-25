package controller.servlets;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.DatabaseController;
import model.UserModel;
import util.StringUtils;

@WebServlet (asyncSupported = true, urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
    
	DatabaseController dbController = new DatabaseController();
    
    
    public RegisterServlet() {
       
    	super();
    	
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone_number = request.getParameter("phone_number");
        String address = request.getParameter("address");

        UserModel user = new UserModel(username, email, password, phone_number, address);
        int result = dbController.addUser(user);
        
        
        switch (result) {
            case 1:
                // Registration successful, redirect to login page
                response.sendRedirect(request.getContextPath() + StringUtils.LOGIN_URL);
                break;

            case 0:
                // Insertion failed
                request.setAttribute("errorMessage", "Please correct the form data.");
                request.getRequestDispatcher("pages/Register.jsp").forward(request, response);
                break;

            case -2:
                // Username already exists
                request.setAttribute("errorMessage", "Username is already taken. Please choose another one.");
                request.getRequestDispatcher("pages/Register.jsp").forward(request, response);
                break;

            case -3:
                // Email already exists
                request.setAttribute("errorMessage", "Email is already in use. Please use another email.");
                request.getRequestDispatcher("pages/Register.jsp").forward(request, response);
                break;

            default:
                // Unexpected server error
                request.setAttribute("errorMessage", "An unexpected server error occurred.");
                request.getRequestDispatcher("pages/Register.jsp").forward(request, response);
                break;
        }
    }

}



