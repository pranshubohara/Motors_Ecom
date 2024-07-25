<%@ page import="controller.DatabaseController" %>
<%@ page import="model.UserModel, model.OrderModel" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.http.Cookie" %>

<%
    Cookie[] cookies = request.getCookies();
    String username = null;
    for (Cookie cookie : cookies) {
        if ("user".equals(cookie.getName())) {
            username = cookie.getValue();
            break;
        }
    }

    DatabaseController dbController = new DatabaseController();
    List<UserModel> userList = dbController.getUserByUsername(username);
    UserModel user = null;
    List<OrderModel> orderHistory = null;

    if (!userList.isEmpty()) {
        user = userList.get(0);
        orderHistory = dbController.getOrdersByUsername(user.getUsername());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" type="text/css" href="../stylesheets/Style.css">
</head>
<style>
.user-info-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 1000px; /* Set the height of the container to 100% of the viewport height */
}

.user-info-box {
    background-color: #f9f9f9;
    padding: 200px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 400px; /* Set a fixed width for the user information box */

}

.user-info-box h2 {
    text-align: center;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}


/* Styles for the readonly box */
.readonly-box {
    border: 1px solid #ccc; /* Border style */
    border-radius: 5px; /* Rounded corners */
    padding: 8px; /* Padding */
    background-color: #f9f9f9; /* Background color */
    box-sizing: border-box; /* Include padding and border in the box's total width and height */
    width: 100%; /* Set width to 100% */
}

/* Styles for the form-group label */
.form-group label {
    display: block; /* Make the label a block element */
    margin-bottom: 15px; /* Add margin bottom */
    font-weight: bold; /* Make the label text bold */
}

.form-group input {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}


/*popup*/
/* Styles for the pop-up container */
.popup {
    display: none; /* Hide the pop-up by default */
    position: fixed; /* Position the pop-up relative to the viewport */
    top: 0; /* Align the pop-up to the top of the viewport */
    left: 0; /* Align the pop-up to the left of the viewport */
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
    z-index: 9999; /* Ensure the pop-up is on top of other content */
}

/* Styles for the pop-up content */
.popup-content {
    position: absolute; /* Position the content relative to the pop-up container */
    top: 50%; /* Align the content vertically in the middle */
    left: 50%; /* Align the content horizontally in the middle */
    transform: translate(-50%, -50%); /* Center the content */
    background-color: #fff; /* White background */
    padding: 120px; /* Add padding around the content */
    border-radius: 5px; /* Rounded corners */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Drop shadow effect */
}

/* Styles for the close button */
.close {
    position: absolute; /* Position the close button relative to the pop-up content */
    top: 10px; /* Align the close button to the top */
    right: 10px; /* Align the close button to the right */
    cursor: pointer; /* Change cursor to pointer on hover */
}
/* Styles for the history button */
/* Styles for all buttons */
.button {
    background-color: #ff5722; /* Default button color */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    transition-duration: 0.4s; /* Smooth transition */
    cursor: pointer;
    border-radius: 8px; /* Rounded corners */
}

/* Hover effect for all buttons */
.button:hover {
    background-color: #e64a19; /* Button color on hover */
}

/* Additional styling for the buttons container */
.button-container {
    text-align: center; /* Center the buttons */
    margin-top: 20px; /* Add some space above the buttons */
}
/* Styles for the pop-up container */
.popup {
    display: none; /* Hide the pop-up by default */
    position: fixed; /* Position the pop-up relative to the viewport */
    top: 0; /* Align the pop-up to the top of the viewport */
    left: 0; /* Align the pop-up to the left of the viewport */
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
    z-index: 9999; /* Ensure the pop-up is on top of other content */
}

/* Styles for the pop-up content */
.popup-content {
    position: absolute; /* Position the content relative to the pop-up container */
    top: 50%; /* Align the content vertically in the middle */
    left: 50%; /* Align the content horizontally in the middle */
    transform: translate(-50%, -50%); /* Center the content */
    background-color: #fff; /* White background */
    padding: 250px; /* Add padding around the content */
    border-radius: 5px; /* Rounded corners */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Drop shadow effect */
    
}

/* Styles for the close button */
.close {
    position: absolute; /* Position the close button relative to the pop-up content */
    top: 10px; /* Align the close button to the top */
    right: 10px; /* Align the close button to the right */
    cursor: pointer; /* Change cursor to pointer on hover */
}

/* Additional styling for the history popup */

#historyPopup {
    display: none; /* Hide the history popup by default */
}

/* Additional styling for the history popup content */
#historyPopup .popup-content {
    width: 800px; /* Set width for the history popup content */
    max-height: 80%; /* Set maximum height for the history popup content */
    overflow-y: auto; /* Enable vertical scrolling if content exceeds max height */
}
/* Style for the table */
    table {
        width: 100%;
        border-collapse: collapse;
    }

    /* Style for table header */
    th {
        background-color: #f2f2f2;
        text-align: left;
        padding: 8px;
    }

    /* Style for table rows */
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    /* Style for table data */
    td {
        padding: 8px;
        border-bottom: 1px solid #ddd;
    }

    /* Style for close button */
    .close {
        float: right;
        font-size: 20px;
        font-weight: bold;
        color: #000;
    }

    /* Style for popup content */
    .popup-content {
        padding: 20px;
    }

</style>
<body>
    <jsp:include page="Header.jsp"/>
	<jsp:include page="Footer.jsp"/>
    <h1>User Profile</h1>
    <div class="user-info-container">
        <div class="user-info-box">
            <h2>User Information</h2>
            
            <form id="user-info-form">
                <% if (user != null) { %>
	            <div id =_Profile-details></div>
	                <div class="form-group">
	                    <label for="name">Username:</label>
	                    <div class="readonly-box"><%= user.getUsername() %></div>
	                </div>
	                <div class="form-group">
	                    <label for="number">Phone Number:</label>
	                    <div class="readonly-box"><%= user.getPhone_number() %></div>
	                </div>
	                <div class="form-group">
	                    <label for="email">Email:</label>
	                    <div class="readonly-box"><%= user.getEmail() %></div>
	                </div>
	                <div class="form-group">
	                    <label for="address">Address:</label>
	                    <div class="readonly-box"><%= user.getAddress() %></div>
	                </div>
	                
						<button id="edit-profile-button" type="button" class="button" onclick="navigateToEditPage()">Edit</button>
						<button id="history-button" onclick="showHistoryPopup()" type="button" class="button">View History</button>
	                </div>
	            </div>
	                   <div id="editPopup" class="popup">
			        <div class="popup-content">
			            <
			            
			            
			           
			        </div>
			    </div>
	                <div class="form-group">
	                    <% } else { %>
	                        <p>Not Logged in.</p>
	                    <% } %>
	                </div>
          
            
            <br>
         <div id="historyPopup" class="popup">
		    <div class="popup-content">
		        <span class="close" onclick="closeHistoryPopup()">&times;</span>
		        <h2>Order History</h2>
		        <% if (orderHistory != null && !orderHistory.isEmpty()) { %>
		            <table>
		                <tr>
		                    <th>Order ID</th>
		                    <th>Status</th>
		                    <th>Total Amount</th>
		                  
		                </tr>
		                <% for (OrderModel order : orderHistory) { %>
		                <tr>
		                    <td><%= order.getOrderId() %></td>
		                    <td><%= order.getOrderStatus() %></td>
		                    <td><%= order.getTotalAmount() %></td>
		                    
		                </tr>
		                <% } %>
		            </table>
		        <% } else { %>
		            <p>No order history found.</p>
		        <% } %>
		    </div>
		</div>


         
    <script>

	

   
    document.addEventListener("DOMContentLoaded", function() {
        var editButton = document.getElementById("edit-profile-button");
        editButton.addEventListener("click", function(event) {
            // Prevent the default form submission behavior
            event.preventDefault();
            // Display edit popup
            showEditPopup();
        });
    });
 // Function to display history popup
    function showHistoryPopup() {
        var popup = document.getElementById("historyPopup");
        popup.style.display = "block";
    }

    // Function to close history popup
    function closeHistoryPopup() {
        var popup = document.getElementById("historyPopup");
        popup.style.display = "none";
    }

    function navigateToEditPage() {
        window.location.href = "userEdit.jsp";
    }


    </script>
  
</body>
</html>