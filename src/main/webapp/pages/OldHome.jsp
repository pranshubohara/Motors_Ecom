<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../stylesheets/Home.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<title>Home</title>
</head>
<body>
    

<header>
    <div class="nav_bar">
        <h1 class="logo">Ukula</h1>
    
        <ul class="nav_bar_word" >
            <li><a href="home.html">    Bike    </a></li>
            <li><a href="html/BODY.html">    Scooter    <i class="drop"></i></a></li>
            <li><a href="html/aboutus.html">    Energy    </a></li>
            <li><a href="html/aboutus.html">    Discover    </a></li>
            <li class="cart">
                <a href="#" class="cart-icon">
                    <i class="fas fa-shopping-cart"></i> <!-- Font Awesome shopping cart icon -->
                    <span class="item-count">0</span>
                </a>
            </li>
        </ul>
        <button class="toggle-btn" onclick="toggleDropdown()">=</button>
        <div class="profile"><a href="./Login.jsp">
            <img src="../image/profile.jpeg" alt="display pciture" class="picture" ></a>
        </div>
    </div>
    
</header>
<!--slider -->
<section>
    <div class="slider-container">
        <video id="video-slider" autoplay muted loop>
          <source src="../image/video1.mp4" type="video/mp4">
          <source src="../image/video2.mp4" type="video/mp4">
          <source src="../image/video3.mp4" type="video/mp4">
          <!-- Add additional source elements for other video formats if needed -->
        </video>
      </div>
</section>
<section>
    
    <div class="image-container">
        <h1 class="about_bike">Best Bike In Town.</h1>
         <img src="../image/image6.png" alt="Description of the image" class="image">
         <button class="order-btn2" >BOOK NOW</button>
    </div>
</section>
<section>
    
    <div class="image-container">
        <h1 class="about_bike">Popular.</h1>
        <img src="../image/imaage5.png" alt="Description of the image" class="image">
        <button class="order-btn2" >BOOK NOW</button>
    </div>
</section>
<section>
    <div class="image-container">
        <h1 class="about_bike">New Electric Scooter.</h1>
        <img src="../image/ather.webp" alt="Description of the image" class="image">
        <button class="order-btn2" >BOOK NOW</button>
    </div>
</section>
<!--slider -->
<!--footer-->
<footer>
    <div class="footer-content">
        <div class="intro">
            <h2>Introduction</h2>
            <p>Your introduction text goes here.</p>
        </div>
        <div class="social">
            <h2>Social</h2>
            <ul>
                <li><a href="#">Facebook</a></li>
                <li><a href="#">Twitter</a></li>
                <li><a href="#">Instagram</a></li>
            </ul>
        </div>
        <div class="help">
            <h2>Help</h2>
            <p>Contact us for assistance.</p>
        </div>
    </div>
</footer>
<!--footer-->
<script src="../JS/Index.js"></script>
</body>
</html>