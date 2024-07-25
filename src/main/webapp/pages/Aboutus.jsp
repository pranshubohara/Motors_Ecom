<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About Us</title> 
    <!-- Include header and footer -->
    <jsp:include page="Header.jsp"/>
    <jsp:include page="Footer.jsp"/>
   
 <link rel="stylesheet" type="text/css" href="../stylesheets/Aboutus.css">
 
</head>
<body>
	 <jsp:include page="Header.jsp"/>
    <section>
        <div class="container1">
            <div class="text">
                <!-- Introduction text -->
                <h1 style="margin: 30px; font-size: 35px; color:white">
                    "Embrace the ride revolution: Whether on two wheels or zipping through the streets, our electric vehicles redefine urban mobility!"
                </h1>
                <!-- Subtitle -->
                <h2 style="padding: 5px; font-size: 20px; color:white">
                    <br> Meet the talented individuals behind our projects
                </h2>
            </div>
        </div>
    </section>
    <!-- Member cards container -->
    <div class="container1">
        <div class="row">
            <div class="members-container">
                <!-- Member 1 -->
                <div class="member-card">
                    <div class="card-front">
                        <img src="../image/khage.jpeg" alt="Member 1">
                        <h3 class="name">Khagendra Mahaseth</h3>
                    </div>
                    <div class="card-back">
                        <!-- Member 1 details -->
                        <p>Meet our team member, Khagendra, who possesses a strong foundation in HTML, CSS, and JavaScript. With their expertise in these three fundamental web technologies, they contribute to the development and design of our web projects.</p>
                        <br><br>
                        <p>Islington College</p>
                        <!-- Contact information -->
                        <p>Email:<a href="mailto:khagendra1@gmail.com" class="contact"> khagendra1@gmail.com</a></p>
                        <p>Phone:<a href="tel: 9827712270" class="contact" >9827712270</a> </p>
                    </div>
                </div>
                <!-- Member 2 -->
                <div class="member-card">
                    <div class="card-front">
                        <img src="../image/roman.jpeg" alt="Member 2">
                        <h3 class="name">Roman Maharjan</h3>
                    </div>
                    <div class="card-back">
                        <!-- Member 2 details -->
                        <p>Allow me to introduce Roman, a talented team member who possesses a solid foundation in HTML, JavaScript, and CSS. Alex is a valuable contributor to our website, ensuring its effective design and functionality.</p>
                        <br><br>
                        <p>Islington College</p>
                        <!-- Contact information -->
                        <p>Email: <a href="roman.maharjan999@gmail.com" class="contact"> roman.maharjan999@gmail.com</a> </p>
                        <p>Phone:<a href="tel: 9861337549" class="contact" > 9861337549</a> </p>
                    </div>
                </div>
                <!-- Member 3 -->
                <div class="member-card">
                    <div class="card-front">
                        <img src="../image/pranshu.jpeg" alt="Member 3">
                        <h3 class="name">Pranshu Prakash Bohara</h3>
                    </div>
                    <div class="card-back">
                        <!-- Member 3 details -->
                        <p>With their combined skills in HTML, CSS, and JavaScript, Pranshu is an invaluable asset to our team. They contribute to the development of engaging and user-friendly websites, delivering exceptional results that meet our clients' needs.</p>
                        <br><br>
                        <p>Islington College</p>
                        <!-- Contact information -->
                        <p>Email:<a href="mailto:pranshubohara@gmail.com" class="contact"> pranshubohara@gmail.com </a></p>
                        <p>Phone:<a href="tel: 9808740140" class="contact" >9808740140</a> </p>
                    </div>
                </div>
                <!-- Member 4 -->
                <div class="member-card">
                    <div class="card-front">
                        <img src="../image/ajit.jpeg" alt="Member 4">
                        <h3 class="name">Ajit Manandhar</h3>
                    </div>
                    <div class="card-back">
                        <!-- Member 4 details -->
                        <p>Ajit is a talented member of our team who brings a strong skill set in JavaScript, HTML, and CSS. With a passion for web development</p>
                        <br><br>
                        <p>Islington College</p>
                        <!-- Contact information -->
                        <p>Email:<a href="mailto:motor.@example.com" class="contact"> ajitmdr25@gmail.com</a></p>
                        <p>Phone:<a href="tel: 9860896280" class="contact" >9860896280</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Include footer -->
    <jsp:include page="Footer.jsp"/>
</body>
</html>
