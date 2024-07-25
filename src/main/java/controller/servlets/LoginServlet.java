package controller.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.DatabaseController;
import model.LoginModel;
import util.StringUtils;

@WebServlet(urlPatterns = "/LoginServlet", asyncSupported = true)
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private final DatabaseController dbController;
   
    public LoginServlet() {
        this.dbController = new DatabaseController();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		LoginModel loginModel = new LoginModel(username, password);
		
		int loginResult = dbController.getUserLoginInfo(loginModel);
		
		
		
		//Successful login
		if (loginResult == 1) {
            // Login successful
            HttpSession userSession = request.getSession();
            userSession.setAttribute("username", username);
            userSession.setMaxInactiveInterval(1*60);
            
            Cookie userCookie = new Cookie("user", username);
            userCookie.setMaxAge(1*60);
            response.addCookie(userCookie);

            if (username.equals("admin")) {
                response.sendRedirect(request.getContextPath() + "/pages/Admin.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/pages/Home.jsp");
            }
            
        } else if (loginResult == 0) {
            // Username or password mismatch
            request.setAttribute(StringUtils.MESSAGE_ERROR, StringUtils.MESSAGE_ERROR_LOGIN);
            request.getRequestDispatcher("/pages/Login.jsp").forward(request, response);
        } else if (loginResult == -1) {
            // Username not found
            request.setAttribute(StringUtils.MESSAGE_ERROR, StringUtils.MESSAGE_ERROR_CREATE_ACCOUNT);
            request.getRequestDispatcher("/pages/Login.jsp").forward(request, response);
        } else {
            // Internal server error
            request.setAttribute(StringUtils.MESSAGE_ERROR, StringUtils.MESSAGE_ERROR_SERVER);
            request.getRequestDispatcher("/pages/Login.jsp").forward(request, response);
        }

		
	}

	

}
