package controller.filters;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.StringUtils;

import java.io.IOException;

public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
       
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
    		throws IOException, ServletException {
        
    	HttpServletRequest req = (HttpServletRequest) request;
    	HttpServletResponse res = (HttpServletResponse) response;
    	
    	String uri = req.getRequestURI();
    	
    	boolean isLogin = uri.endsWith("pages/Login.jsp");
    	boolean isLoginServlet = uri.endsWith("LoginServlet");
    	boolean isLogoutServlet = uri.endsWith("LogoutServlet");
    	
    	boolean isRegisterPage = uri.endsWith("pages/Register.jsp");
    	boolean isRegisterServlet = uri.endsWith("RegisterServlet");
    	
	    HttpSession session = req.getSession(false); 
	    boolean isLoggedIn = session != null && session.getAttribute(StringUtils.USERNAME) != null;

	    // Redirect to login if user is not logged in and trying to access a protected resource
	    if (!isLoggedIn && !(isLogin || isLoginServlet || isRegisterPage || isRegisterServlet)) {
	        res.sendRedirect(req.getContextPath() + "pages/Login.jsp");
	    } else if (isLoggedIn && !(!isLogin || isLogoutServlet)) { // Redirect logged-in users to the index page if trying to access login page again
	        res.sendRedirect(req.getContextPath() + "pages/Home.jsp");
	    } else {	        
	        chain.doFilter(request, response);
	    }
	}

    
   

    @Override
    public void destroy() {
        
    }
}
