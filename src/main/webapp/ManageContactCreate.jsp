<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Vehicle Rental System - Contact Us</title>

<style>
/* Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    line-height: 1.6;
    color: #333;
    background-color: #ffffff;
    min-height: 100vh;
}

.wrapper {
    min-height: 100vh;
    display: flex;
    align-items: center;
    padding: 20px 0;
}

/* Contact Section */
.contact {
    width: 100%;
    padding: 60px 0;
}

nav ul li a.active {
    background-color: #d1e0e0;
    font-weight: bold;
}

.contact-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 60px;
    align-items: start;
}

/* ================= LEFT CONTACT INFO (BLUE) ================= */
.contact-info {
    background: linear-gradient(135deg, #0f172a, #1e3a8a);
    padding: 40px;
    border-radius: 22px;
    box-shadow: 0 30px 60px rgba(30, 58, 138, 0.35);
    color: #ffffff;
}

.contact-info h2 {
    font-size: 2.4rem;
    margin-bottom: 20px;
    color: #ffffff;
}

.contact-info p {
    font-size: 1.05rem;
    color: #c7d2fe;
    margin-bottom: 30px;
    line-height: 1.8;
}

.contact-info ul {
    list-style: none;
}

.contact-info li {
    display: flex;
    align-items: center;
    padding: 16px 18px;
    border-radius: 12px;
    margin-bottom: 15px;
    background: rgba(255, 255, 255, 0.12);
    transition: all 0.3s ease;
}

.contact-info li:hover {
    background: rgba(255, 255, 255, 0.22);
    transform: translateX(6px);
}

.contact-info li b {
    color: #93c5fd;
    margin-right: 6px;
}

.contact-info li img {
    width: 24px;
    height: 24px;
    margin-right: 15px;
}

/* ================= RIGHT FORM (MATCHING BLUE) ================= */
.contact-form {
    background: linear-gradient(135deg, #1f3b6f, #2a4a99); /* dark blue gradient */
    border-radius: 22px;
    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
    border: none;
    color: #ffffff;
}


.contact-container1 {
    padding: 40px;
}

.form-group {
    margin-bottom: 25px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
    color: #ffffff;
    font-size: 1rem;
}

.form-group input,
.form-group textarea {
color: #333333;
    width: 100%;
    padding: 15px 20px;
    border: 2px solid #c7d2fe;
    border-radius: 12px;
    font-size: 1rem;
    background-color: #ffffff;
    transition: all 0.3s ease;
    font-family: inherit;
}

.form-group input::placeholder,
.form-group textarea::placeholder {
    color: #94a3b8;
    font-style: italic;
}

.form-group input:focus,
.form-group textarea:focus {
    outline: none;
    border-color: #2563eb;
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.2);
}

.form-group textarea {
    resize: vertical;
    min-height: 120px;
}

/* Submit Button */
.contact-button {
    width: 100%;
    padding: 18px;
    background: linear-gradient(135deg, #06b6d4, #0ea5e9); /* cyan gradient */
    color: #ffffff;
    border: none;
    border-radius: 50px;
    font-size: 1.1rem;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.3s ease;
    letter-spacing: 1px;
}

.contact-button:hover {
    transform: translateY(-3px);
    box-shadow: 0 18px 40px rgba(14, 165, 233, 0.45);
}

/* Responsive */
@media (max-width: 768px) {
    .contact-container {
        grid-template-columns: 1fr;
        gap: 40px;
    }
}

/* Space after header */
.wrapper {
    margin-top: 120px;
    margin-bottom: 120px;
}

/* Remove background images */
body,
.wrapper,
.contact {
    background-image: none !important;
    background-color: #ffffff !important;
}
</style>
</head>

<body>

<jsp:include page="header.jsp"/>

<div class="wrapper">
<section class="contact">
<div class="contact-container">

<div class="contact-info">
<h2>Contact Us</h2>
<p>
We're here to help! Whether you're looking for more information,
need help with a booking, or have any concerns during your rental
period, feel free to reach out to Wheels4U.
</p>

<ul>
<li>
<img src="img/pic1.jpg">
<b>Call us</b> : +94 11 754 4801
</li>
<li>
<img src="img/pic2.jpg">
<b>Mail</b> : info@wheels4U.com
</li>
<li>
<img src="img/pic3.jpg">
<b>Address</b> : 181, New Kandy Road, Malabe, Sri Lanka
</li>
</ul>
</div>

<div class="contact-form">
<div class="contact-container1">
<form action="${pageContext.request.contextPath}/contact/submitContact" method="post">

<div class="form-group">
<label>First Name</label>
<input type="text" name="firstname" placeholder="Enter your first name" required>
</div>

<div class="form-group">
<label>Last Name</label>
<input type="text" name="lastname" placeholder="Enter your last name" required>
</div>

<div class="form-group">
<label>Email</label>
<input type="email" name="email" placeholder="example@email.com" required>
</div>

<div class="form-group">
<label>Phone</label>
<input type="text" name="phone" placeholder="+94 77 123 4567" required>
</div>

<div class="form-group">
<label>Message</label>
<textarea name="message" placeholder="Type your message here..." required></textarea>
</div>

<button type="submit" class="contact-button">Submit</button>
</form>
</div>
</div>

</div>
</section>
</div>

<jsp:include page="vehicleFooter.jsp"/>

</body>
</html>
