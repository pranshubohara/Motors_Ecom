<%@page import="util.StringUtils"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%
    HttpSession userSession = request.getSession();
    String currentUser = (String) userSession.getAttribute(StringUtils.USERNAME);
    String contextPath = request.getContextPath();
%>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #252525;
}

.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: rgba(35, 35, 35, .97);
    color: #f9f9f9;
    height: 70px;
    padding: 10px 20px;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
}

.navbar .brand {
    font-size: 1.5rem;
}
.navbar .search-bar {
    display: flex; /* Use flexbox */
    flex: 0.5; /* Adjust the width as needed */
    margin: 0 20px;
}

.navbar .search-bar input[type="text"] {
    flex: 1; /* Take remaining space */
    padding: 8px;
    border: none;
    border-radius: 5px 0 0 5px; /* Rounded corners on the left */
}

.navbar .search-bar button {
    padding: 8px 15px;
    background-color: #555;
    color: #fff;
    border: none;
    border-radius: 0 5px 5px 0; /* Rounded corners on the right */
    cursor: pointer;
}

.nav-links {
    display: flex;
    align-items: center;  
    gap:20px;

}

.navbar .nav-links a {
    
    color: #fff;
    text-decoration: none;
    margin-left: 10px;
}
.navbar .nav-links a:hover {
    color: #e29229d8;
    text-decoration: none;
    margin-left: 10px;
}
.navbar .nav-links img {
    width: 30px;
    height: auto;
}

.profile-picture {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background-color: #ddd; /* Placeholder background color */
    margin-left: 10px; 
}
.brand a {
  color: #fff;
  text-decoration: none;
  margin-left: 10px;
}
.brand a:hover {
  color: #a5a2a2b8;

}

</style>
<div id="header">
    <header class="header">
        <div class="navbar" id="navbar">
            <div class="brand">Motor.</div>
            
            <div class="nav-links">
                <p>ADMIN PANEL</p>
                <form action="<%
                    // Conditionally set the action URL based on user session
                    if (currentUser != null) {
                        out.print(contextPath + "/pages/Login.jsp");
                    } else {
                        out.print(contextPath + StringUtils.LOGIN_URL);
                    }
                %>" method="post">
                    <input type="submit" value="<%
                        // Conditionally set the button label based on user session
                        if (currentUser != null) {
                            out.print("Logout");
                        } else {
                            out.print("Login");
                        }
                    %>"/>
                </form>
            </div>
        </div>
    </header>
</div>
