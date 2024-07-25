package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.LoginModel;
import model.OrderModel;
import model.UserModel;
import model.ProductModel;
import util.StringUtils;

public class DatabaseController {

    // Method to establish a connection to the database
    public Connection getConnection() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/user_info";
        String user = "root";
        String pass = "";
        return DriverManager.getConnection(url, user, pass);
    }
    
    // Method to add a user to the database
    public int addUser(UserModel usermodel) {
        // SQL queries to check if a username or email already exists
        String checkUsernameSQL = "SELECT COUNT(*) FROM user_table WHERE username = ?";
        String checkEmailSQL = "SELECT COUNT(*) FROM user_table WHERE email = ?";
        String insertSQL = "INSERT INTO user_table (username, email, password, phone_number, address) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = getConnection()) {
            // Check if the username already exists
            try (PreparedStatement checkUsernameStmt = con.prepareStatement(checkUsernameSQL)) {
                checkUsernameStmt.setString(1, usermodel.getUsername());
                ResultSet rs = checkUsernameStmt.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    // Username already exists
                    return -2;
                }
            }

            // Check if the email already exists
            try (PreparedStatement checkEmailStmt = con.prepareStatement(checkEmailSQL)) {
                checkEmailStmt.setString(1, usermodel.getEmail());
                ResultSet rs = checkEmailStmt.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    // Email already exists
                    return -3;
                }
            }

            // Insert the new user if no duplicates found
            try (PreparedStatement stt = con.prepareStatement(insertSQL)) {
                stt.setString(1, usermodel.getUsername());
                stt.setString(2, usermodel.getEmail());
                stt.setString(3, usermodel.getPassword());
                stt.setString(4, usermodel.getPhone_number());
                stt.setString(5, usermodel.getAddress());

                int result = stt.executeUpdate();

                if (result > 0) {
                    return 1; // Successful insertion
                } else {
                    return 0; // Insertion failed
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the error for debugging purposes
            return -1; // Unexpected error occurred
        }
    }


	
	public int getUserLoginInfo(LoginModel user) {
	    try (Connection con = getConnection()) {  // Establishes a connection to the database
	        PreparedStatement st = con.prepareStatement(StringUtils.GET_LOGIN_USER_INFO);  // Prepares a statement to retrieve login information from the database
	        st.setString(1,user.getUsername());  // Sets the username parameter in the SQL query

	        ResultSet result = st.executeQuery();  // Executes the SQL query and stores the result set

	        if (result.next()) {  // If a record is found in the result set
	            String usernameDb = result.getString("username");  // Retrieves the username from the result set
	            String passwordDb = result.getString("password");  // Retrieves the password from the result set

	            if (usernameDb.equals(user.getUsername()) && passwordDb.equals(user.getPassword())) {
	                // If the provided username and password match the database record
	                // Successful Login
	                return 1;
	            } else {
	                // If the provided username or password does not match the database record
	                // Username or Password Mismatch
	                return 0;                    
	            }
	        } else {
	            // If no record is found with the provided username in the database
	            // Username not found in the database
	            return -1;
	        }
	        
	    } catch (SQLException | ClassNotFoundException ex) {  // Catches any SQL exceptions or class not found exceptions
	        ex.printStackTrace();  // Logs the exception for debugging
	        return -2;
	    }
	}

	
	
	public ArrayList<UserModel> getUserByUsername(String username) {
	    ArrayList<UserModel> userList = new ArrayList<>();  // Initialize an ArrayList to store UserModel objects

	    try (Connection connection = getConnection()) {  // Establish a connection to the database
	        PreparedStatement statement = connection.prepareStatement("SELECT * FROM user_table WHERE username = ?");  // Prepare a statement to select users with the provided username
	        statement.setString(1, username);  // Set the parameter in the SQL query to the provided username

	        ResultSet resultSet = statement.executeQuery();  // Execute the SQL query and store the result set

	        // Process the result set
	        while (resultSet.next()) {
	            // Create a new UserModel object for each row in the result set
	            UserModel user = new UserModel(
	                resultSet.getString("username"),  // Retrieve the username from the result set
	                resultSet.getString("email"),  // Retrieve the email from the result set
	                resultSet.getString("password"),  // Retrieve the password from the result set
	                resultSet.getString("phone_number"),  // Retrieve the phone number from the result set
	                resultSet.getString("address")  // Retrieve the address from the result set
	            );
	            userList.add(user);  // Add the created UserModel object to the ArrayList
	        }
	    } catch (SQLException | ClassNotFoundException e) {  // Catch any SQL exceptions or class not found exceptions
	        e.printStackTrace();  // Handle or log the exception by printing the stack trace
	    }

	    return userList;  // Return the ArrayList containing UserModel objects
	}

	
	public ArrayList<ProductModel> getAllProducts() {
	    ArrayList<ProductModel> productList = new ArrayList<>();  // Initialize an ArrayList to store ProductModel objects

	    try (Connection connection = getConnection()) {  // Establish a connection to the database
	        PreparedStatement statement = connection.prepareStatement("SELECT * FROM product_table");  // Prepare a statement to select all products from the product_table

	        ResultSet resultSet = statement.executeQuery();  // Execute the SQL query and store the result set

	        // Process the result set
	        while (resultSet.next()) {
	            // Create a new ProductModel object for each row in the result set
	            ProductModel product = new ProductModel(
	                resultSet.getString("product_id"),
	                resultSet.getString("product_name"),
	                resultSet.getString("availability_status"),
	                resultSet.getString("stock_level"),
	                resultSet.getString("category_id"),
	                resultSet.getString("price"),
	                resultSet.getString("product_description")
	            );
	            productList.add(product);  // Add the created ProductModel object to the ArrayList
	        }
	    } catch (SQLException | ClassNotFoundException e) {  // Catch any SQL exceptions or class not found exceptions
	        e.printStackTrace();  // Handle or log the exception by printing the stack trace
	    }

	    return productList;  // Return the ArrayList containing ProductModel objects
	}

	public int getNextCartId(Connection conn) throws SQLException {
	    int cartId = 1;  // Initialize the cart ID to 1

	    try (PreparedStatement stmt = conn.prepareStatement("SELECT MAX(CART_ID) FROM cart_table");  // Prepare a statement to select the maximum cart ID from the cart_table
	         ResultSet rs = stmt.executeQuery()) {  // Execute the SQL query and store the result set
	        if (rs.next()) {
	            cartId = rs.getInt(1) + 1;  // Increment the maximum cart ID by 1 to get the next available cart ID
	        }
	    }

	    return cartId;  // Return the next available cart ID
	}

	public int getNextOrderID(Connection conn) throws SQLException {
	    int orderId = 1;  // Initialize the order ID to 1

	    try (PreparedStatement stmt = conn.prepareStatement("SELECT MAX(ORDER_ID) FROM order_table");  // Prepare a statement to select the maximum order ID from the order_table
	         ResultSet rs = stmt.executeQuery()) {  // Execute the SQL query and store the result set
	        if (rs.next()) {
	            orderId = rs.getInt(1) + 1;  // Increment the maximum order ID by 1 to get the next available order ID
	        }
	    }

	    return orderId;  // Return the next available order ID
	}

	public ArrayList<ProductModel> getProductsByNameAndPrice(String productName, Integer unitPrice) {
	    ArrayList<ProductModel> products = new ArrayList<>();  // Initialize an ArrayList to store ProductModel objects
	    StringBuilder sql = new StringBuilder("SELECT * FROM product_table WHERE 1=1");  // Construct the base SQL query
	    ArrayList<Object> params = new ArrayList<>();  // Initialize an ArrayList to store query parameters

	    // Add the product name filter if productName is not null or empty
	    if (productName != null && !productName.trim().isEmpty()) {
	        sql.append(" AND LOWER(product_name) LIKE ?");  // Append a filter condition to the SQL query
	        params.add("%" + productName.trim().toLowerCase() + "%");  // Add the parameter value to the params list
	    }

	    // Add the price filter if unitPrice is not null
	    if (unitPrice != null) {
	        sql.append(" AND price = ?");  // Append a filter condition to the SQL query
	        params.add(unitPrice);  // Add the parameter value to the params list
	    }

	    // Ensure at least one filter is applied
	    if (params.isEmpty()) {
	        return products; // Return an empty list if no filters are applied
	    }

	    // Try to establish a connection and execute the query
	    try (Connection con = getConnection();  // Establish a connection to the database
	         PreparedStatement st = con.prepareStatement(sql.toString())) {  // Prepare a statement for the SQL query

	        // Set all query parameters dynamically
	        for (int i = 0; i < params.size(); i++) {
	            st.setObject(i + 1, params.get(i));  // Set the parameter value for the prepared statement
	        }

	        // Execute the query
	        ResultSet res = st.executeQuery();  // Execute the SQL query and store the result set

	        // Process the result set
	        while (res.next()) {
	            // Create a new ProductModel object for each row in the result set
	            ProductModel product = new ProductModel(
	                res.getString("product_id"),
	                res.getString("product_name"),
	                res.getString("availability_status"),
	                res.getString("stock_level"),
	                res.getString("category_id"),
	                res.getString("price"),
	                res.getString("product_description")
	            );
	            products.add(product);  // Add the created ProductModel object to the ArrayList
	        }
	    } catch (SQLException | ClassNotFoundException ex) {  // Catch any SQL exceptions or class not found exceptions
	        ex.printStackTrace();  // Handle or log the exception by printing the stack trace
	    }

	    return products;  // Return the ArrayList containing ProductModel objects
	}

	

	
	public ArrayList<OrderModel> getOrdersByUsername(String username) {
	    ArrayList<OrderModel> orders = new ArrayList<>();  // Initialize an ArrayList to store OrderModel objects

	    // SQL query to select orders based on the provided username
	    String sql = "SELECT ORDER_ID, ORDER_STATUS, TOTAL_AMOUNT, username FROM order_table WHERE username = ?";

	    try (Connection con = getConnection();  // Establish a connection to the database
	         PreparedStatement st = con.prepareStatement(sql)) {  // Prepare a statement for the SQL query
	        st.setString(1, username);  // Set the parameter in the SQL query to the provided username

	        ResultSet rs = st.executeQuery();  // Execute the SQL query and store the result set

	        // Iterate through the result set and create OrderModel objects for each row
	        while (rs.next()) {
	            OrderModel order = new OrderModel(
	                rs.getString("ORDER_ID"),  // Retrieve the order ID from the result set
	                rs.getString("ORDER_STATUS"),  // Retrieve the order status from the result set
	                rs.getDouble("TOTAL_AMOUNT"),  // Retrieve the total amount from the result set
	                rs.getString("username")  // Retrieve the username from the result set
	            );
	            orders.add(order);  // Add the created OrderModel object to the ArrayList
	        }
	    } catch (SQLException | ClassNotFoundException e) {  // Catch any SQL exceptions or class not found exceptions
	        e.printStackTrace();  // Handle exceptions by printing the stack trace
	    }
	    
	    return orders;  // Return the ArrayList containing OrderModel objects
	}

	
	public ProductModel getProductById(String productId) throws SQLException, ClassNotFoundException {
	    ProductModel product = null;  // Initializing a ProductModel object as null

	    // SQL query to select a product based on its ID
	    String sql = "SELECT * FROM product_table WHERE PRODUCT_ID = ?";

	    try (Connection conn = getConnection();  // Establishing a connection to the database
	         PreparedStatement pstmt = conn.prepareStatement(sql)) {  // Preparing a statement for the SQL query
	        pstmt.setString(1, productId);  // Setting the parameter in the SQL query to the provided product ID
	        ResultSet rs = pstmt.executeQuery();  // Executing the SQL query and storing the result set

	        // If there is a matching product in the result set, create a new ProductModel object
	        if (rs.next()) {
	            product = new ProductModel(
	                rs.getString("PRODUCT_ID"),  // Retrieving the product ID from the result set
	                rs.getString("PRODUCT_NAME"),  // Retrieving the product name from the result set
	                rs.getString("AVAILABILITY_STATUS"),  // Retrieving the availability status from the result set
	                rs.getString("STOCK_LEVEL"),  // Retrieving the stock level from the result set
	                rs.getString("CATEGORY_ID"),  // Retrieving the category ID from the result set
	                rs.getString("PRICE"),  // Retrieving the price from the result set
	                rs.getString("PRODUCT_DESCRIPTION")  // Retrieving the product description from the result set
	            );
	        }
	    } 

	    // If there's a SQL exception or a class not found exception, it will be propagated to the caller
	    return product;  // Returning the ProductModel object (can be null if no matching product found)
	}

	
	
	public int addProduct(ProductModel product) {
	    try (Connection con = getConnection()) {  // Establishes a connection to the database
	        PreparedStatement stmt = con.prepareStatement("INSERT INTO product_table (PRODUCT_ID, PRODUCT_NAME, AVAILABILITY_STATUS, STOCK_LEVEL, CATEGORY_ID, PRICE, PRODUCT_DESCRIPTION) VALUES (?, ?, ?, ?, ?, ?, ?)");  // Prepares a SQL statement for inserting data into the product_table

	        // Sets values for the parameters in the SQL statement based on the attributes of the ProductModel object
	        stmt.setString(1, product.getPRODUCT_ID());  
	        stmt.setString(2, product.getPRODUCT_NAME());  
	        stmt.setString(3, product.getAVAILABILITY_STATUS()); 
	        stmt.setString(4, product.getSTOCK_LEVEL());  
	        stmt.setString(5, product.getCATEGORY_ID());  
	        stmt.setString(6, product.getPRICE()); 
	        stmt.setString(7, product.getPRODUCT_DESCRIPTION());  

	        int result = stmt.executeUpdate();  // Executes the SQL statement and returns the number of rows affected
	        return result > 0 ? 1 : 0;  // Returns 1 if the insertion is successful, 0 otherwise
	    } catch (SQLException | ClassNotFoundException ex) {  // Catches any SQL exceptions or class not found exceptions
	        ex.printStackTrace();  // Prints the stack trace of the exception
	        return -1;  // Returns -1 if there's an exception
	    }
	}
}
