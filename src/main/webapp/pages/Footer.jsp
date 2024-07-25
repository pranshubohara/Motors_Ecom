<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>

<style>

  .content {
    flex: 1;
  }

  .footer {
    min-height: 100px;
    position: fixed;
    bottom:0; 
    width: 100%;
    background-color: rgba(35, 35, 35, 0.97);
    color: #fff;
    padding: 20px;
    text-align: center;
    z-index: 10000;
    left:0px;
}

  .container {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
  }

  .intro,
  .social-links,
  .contact-info {
    flex: 1;
    margin-right: 20px;
  }

  .social-links ul {
    list-style: none;
    padding: 0;
  }

  .social-links ul li {
    margin-bottom: 10px;
  }

  .social-links ul li a {
    color: #fff;
    text-decoration: none;
  }

  .contact-info p {
    margin: 5px 0;
  }
  .contact{
      color:white;
  }

</style>
<body>
<footer class="footer">
        <div class="container">
            <div class="intro">
                <h2>Motor.</h2>
                <p>"Welcome to  Motor., where 
                    innovation meets excitement! As passionate pioneers
                     in the electric bike industry, 
                     we pride ourselves on offering 
                     cutting-edge e-bikes that redefine urban mobility. 
                    "
                     </p>
            </div>

            <div class="social-links">
                <h3>Follow Us</h3>
                <ul>
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">Instagram</a></li>
                    <!-- Add more social media links as needed -->
                </ul>
            </div>
            <div class="contact-info">
                <h3>Contact Us</h3>
                <p>Email: <a href="mailto:motor.@example.com" class="contact">motor.@example.com</a></p>
                <p>Phone: <a href="tel: 9860896280" class="contact" >9860896280</a></p>
            </div>
        </div>
    </footer>
</body>
</html>