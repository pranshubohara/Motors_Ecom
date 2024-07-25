package util;

public class StringUtils {

	public static final String INSERT_USER = "INSERT INTO user_table"
			+ "(username,email,password,phone_number,address)" + "VALUES (?,?,?,?,?)";

	public static final String GET_LOGIN_USER_INFO = "SELECT * FROM user_table WHERE username = ?";
	
	public static final String GET_ALL_USER_INFO = "SELECT * FROM user_table";

	// Start: Validation Messages
	// Register Page Messages
	public static final String MESSAGE_SUCCESS_REGISTER = "Successfully Registered!";
	public static final String MESSAGE_ERROR_REGISTER = "Please correct the form data.";
	public static final String MESSAGE_ERROR_USERNAME = "Username is already registered.";
	public static final String MESSAGE_ERROR_EMAIL = "Email is already registered.";
	public static final String MESSAGE_ERROR_PHONE_NUMBER = "Phone number is already registered.";
	public static final String MESSAGE_ERROR_PASSWORD_UNMATCHED = "Password is not matched.";
	public static final String ERROR_MESSAGE = "errorMessage";

	// Login Page Messages
	public static final String MESSAGE_SUCCESS_LOGIN = "Successfully LoggedIn!";
	public static final String MESSAGE_ERROR_LOGIN = "Password is not correct!";
	public static final String MESSAGE_ERROR_CREATE_ACCOUNT = "Account for this username is not registered! Please create a new account.";
		
	// Other Messages
	public static final String MESSAGE_ERROR_SERVER = "An unexpected server error occurred.";
	public static final String MESSAGE_SUCCESS_DELETE = "Successfully Deleted!";
	public static final String MESSAGE_ERROR_DELETE = "Cannot delete the user!";
		
	public static final String MESSAGE_SUCCESS = "successMessage";
	public static final String MESSAGE_ERROR = "errorMessage";
	// End: Validation Messages

	//URLS
	public static final String LOGIN_URL = "/pages/Login.jsp";
	public static final String ADMIN_URL = "/pages/Admin.jsp";
	public static final String HOME_URL = "/pages/Home.jsp";
	
	public static final String USERNAME = "username";
	
	// Start: Servlet Route
		public static final String SERVLET_URL_LOGIN = "/Login.jsp";
		public static final String SERVLET_URL_REGISTER = "/registerstudent";
		public static final String SERVLET_URL_LOGOUT = "/LogoutServlet";
		// End: Servlet Route
		
		public static final String LOGIN = "Login";
		public static final String LOGOUT = "Logout";
}
