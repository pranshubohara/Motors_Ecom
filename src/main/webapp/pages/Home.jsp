<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="../stylesheets/Style.css">
    <title>Home</title>
</head>
<body>
     <jsp:include page="Header.jsp"/>
     <jsp:include page="Footer.jsp"/>
    <section>
        <div class="slider-container">
            <video id="video-slider" autoplay muted loop>
              <source src="../image/video1.mp4" type="video/mp4">
              <source src="../image/video2.mp4" type="video/mp4">
              <source src="../image/video3.mp4" type="video/mp4">
            </video>
          </div>
    </section>
    <section>
        <div class="image-container">
            <h1 class="about_bike">Best Bike In Town.</h1>
             <img src="../image/4.jpeg" alt="Description of the image" class="image">
           
        </div>
    </section>
    <section>
        <div class="image-container2">
            <h1 class="about_bike">Feel the power.</h1>
             <img src="../image/1.jpeg" alt="Description of the image" class="image">
            
        </div>
    </section>
    <section>
        <div class="image-container3">
            <h1 class="about_bike">Save Planet.</h1>
             <img src="../image/2.jpeg" alt="Description of the image" class="image">
             
        </div>
    </section>
    
    
    <script src="../JS/NewHome.js"></script>
</body>
</html>
