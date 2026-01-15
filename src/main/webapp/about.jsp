<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Wheels4U - About Us</title>

<!-- Include Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/style.css">

<style>

/* ------------------------------
   GLOBAL STYLES
--------------------------------*/
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    background-color: #ffffff !important; /* white background for about page */
    background-image: none !important;
    color: #222;
    font-family: "Poppins", Arial, sans-serif;
}

/* ------------------------------
   ABOUT SECTION
--------------------------------*/
.about-section {
    padding: 60px 20px;
    max-width: 1200px;
    margin: auto;
}

.about-title {
    text-align: center;
    font-size: 56px;              /* bigger font */
    font-weight: 700;
    color:  #1E90FF;               /* dark blue */
    margin-bottom: 10px;
    position: relative;
    letter-spacing: 2px;
}

/* Gradient effect on the title */
.about-title.gradient-text {
    background: linear-gradient(90deg, #4b71ff, #0054d1);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* Decorative underline */
.about-title::after {
    content: "";
    width: 80px;
    height: 4px;
    background:#002b7f;
    display: block;
    margin: 15px auto 0 auto;
    border-radius: 2px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.2);
}

/* Subtitle under About Us title */

.about-title {
    text-align: center;
    font-weight: 700px;
    font-size: 42px;
    margin-bottom: 40px;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: #002b7f; /* dark blue like Home page headings */
}

/* First block (Your Trusted Vehicle Rental Partner) */
.about-block {
    display: flex;
    align-items: center;
    gap: 40px;
    margin-bottom: 70px;
    padding: 30px;
    border-radius: 20px;
    background: #ffffff;
    box-shadow: 0 4px 18px rgba(0,0,0,0.1);
}

.about-block:nth-child(even) {
    flex-direction: row-reverse;
}

.about-text {
    width: 50%;
}

.about-text h2 {
    font-size: 26px;
    color: #0054d1; /* blue headings */
    margin-bottom: 20px;
}

.about-text p {
    line-height: 1.7;
    font-size: 16px;
    color: #333;
}

.about-image img {
    width: 100%;
    max-width: 450px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.15);
    transition: transform 0.3s;
}

.about-image img:hover {
    transform: scale(1.03);
}

/* ------------------------------
   Paragraph-style About Info
--------------------------------*/
.about-paragraphs {
    max-width: 1500px;       /* same width as the about-block */
    margin: 50px 10px;      /* center the block with spacing above/below */
    line-height: 1.8;
    font-size: 18px;
    color: #333;
    text-align: justify;
}

.about-paragraphs p {
    margin-bottom: 20px;
}

/* ------------------------------
   WHY WE STAND OUT SECTION (Blue Theme)
--------------------------------*/
.standout-section {
    background-color: #dce7ff; /* light blue background like Home page features */
    padding: 60px 20px;
    border-radius: 25px;
    margin-bottom: 20px;
    text-align: center;
}

.standout-section h2 {
    font-size: 36px;
    color: #002b7f; /* dark blue heading */
    margin-bottom: 30px;
}

.standout-image img {
    width: 100%;
    max-width: 600px;
    border-radius: 15px;
    margin-bottom: 40px;
    box-shadow: 0 4px 18px rgba(0,0,0,0.1);
}

/* Cards below image */
.standout-cards {
    display: flex;
    flex-wrap: wrap;
    gap: 30px;
    justify-content: center;
}

.card {
    background-color: #ffffff;
    border-radius: 20px;
    padding: 25px;
    width: 250px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.1);
    transition: transform 0.3s, box-shadow 0.3s, border-top 0.3s;
    text-align: center;
    border-top: 5px solid #4b71ff; /* top border blue like Home page */
}

.card:hover {
    transform: translateY(-8px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
    border-top-color: #002b9f; /* darker blue on hover */
}

.card i {
    font-size: 40px;
    color: #4b71ff; /* blue icons */
    margin-bottom: 20px;
}

.card h3 {
    font-size: 20px;
    color: #002b7f; /* dark blue */
    margin-bottom: 12px;
}

.card p {
    font-size: 15px;
    color: #333;
    line-height: 1.6;
}

/* ------------------------------
   FOOTER
--------------------------------*/
footer {
    background-color: #1e1e1e;
    color: #fff;
    padding: 40px 20px;
    margin-top: 50px;
}

.footer-container {
    max-width: 1200px;
    margin: auto;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.footer-section {
    width: 45%;
    min-width: 300px;
    padding: 15px;
}

.footer-section h3 {
    font-size: 22px;
    margin-bottom: 15px;
}

.footer-section p {
    line-height: 1.6;
    color: #ccc;
}

.footer-section a {
    color: #4b91ff;
    text-decoration: none;
}

.footer-section a:hover {
    text-decoration: underline;
}

.social-media img {
    width: 32px;
    margin-right: 10px;
    cursor: pointer;
    transition: 0.3s;
}

.social-media img:hover {
    transform: scale(1.15);
}

.footer-bottom {
    text-align: center;
    margin-top: 25px;
    padding-top: 15px;
    border-top: 1px solid #444;
    color: #aaa;
}

/* ------------------------------
   RESPONSIVE DESIGN
--------------------------------*/
@media(max-width: 850px) {

    .about-block {
        flex-direction: column !important;
        text-align: center;
    }

    .about-text, 
    .about-image {
        width: 100%;
    }

    nav ul {
        flex-wrap: wrap;
        justify-content: center;
    }

    .auth-buttons {
        margin-top: 10px;
    }

    .standout-cards {
        flex-direction: column;
        align-items: center;
    }

    .card {
        width: 90%;
    }
}

</style>
</head>

<body>

<jsp:include page="header.jsp"/>

<!-- ABOUT SECTION -->
<section class="about-section">

   <h1 class="about-title">About Us</h1>

    <!-- BLOCK 1 -->
    <div class="about-block" style="background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%); border: 1px solid #90caf9;">
        <div class="about-text">
            <h2>Your Trusted Vehicle Rental Partner</h2>
            <p>
                At <b>Wheels4U</b>, we provide a premium and reliable vehicle rental
                experience for customers across Sri Lanka. Whether it's a family
                trip, business meeting, airport transfer, or long journey, we offer
                a wide selection of safe, clean, and well-maintained vehicles.
            </p>
            <p>
                Our mission is simple — to make your travel smooth, affordable, and comfortable. 
                With years of experience and a passionate team, we ensure a seamless rental process.
            </p>
        </div>

        <div class="about-image">
            <img src="img/pv1.png" alt="Vehicles Image">
        </div>
    </div>

    <!-- Wheels4U History & Services (Paragraph Style) -->
    <div class="about-paragraphs">

        <p>
            <strong>Wheels4U</strong> offers a wide variety of vehicles, from budget cars to luxury coaches, to meet all your transport needs within Sri Lanka. We ensure our customers receive high-quality service along with the vehicle, with fair treatment and clear, easy-to-understand rental agreements explained from A to Z.
        </p>

        <p>
            Our extremely competitive rates help you plan your journey and enjoy the beauty of Sri Lanka without worrying about costs. Wheels4U is located in Kalubowila, Anderson Road, just 800m ahead on Kadawatha Road, Colombo South.
       

        
            Providing vehicles for over 19 years, Wheels4U has been delivering excellent service to both local and foreign customers. Our dedicated team is trained to always prioritize the customer, believing that the customer is king. We value respect and teamwork, ensuring that both our employees and our customers are happy.
        </p>

        <p>
            At Wheels4U, our main goal is to make your travel smooth, comfortable, and worry-free. We strive to maintain a professional and friendly service experience, so every journey you take with us is memorable and enjoyable.
        </p>

    </div>

    <!-- BLOCK 2: WHY WE STAND OUT (Blue Theme) -->
    <section class="standout-section">
        <h2>Why We Stand Out</h2>
        
        <!-- PV2 Image -->
        <div class="standout-image">
            <img src="img/pv2.png" alt="Fleet Image">
        </div>

        <div class="standout-cards">

            <div class="card">
                <i class="fas fa-car-side"></i>
                <h3>Wide Fleet Variety</h3>
                <p>Choose from compact cars, sedans, SUVs, and vans to suit every travel need.</p>
            </div>

            <div class="card">
                <i class="fas fa-dollar-sign"></i>
                <h3>Competitive Pricing</h3>
                <p>Get the best value for your money with flexible rental plans and transparent pricing.</p>
            </div>

            <div class="card">
                <i class="fas fa-headset"></i>
                <h3>24/7 Customer Support</h3>
                <p>Our dedicated support team is available around the clock to assist you anytime.</p>
            </div>

            <div class="card">
                <i class="fas fa-shield-alt"></i>
                <h3>Safe & Reliable</h3>
                <p>All vehicles undergo rigorous maintenance to ensure a safe, clean, and dependable ride.</p>
            </div>

        </div>
    </section>

</section>

<jsp:include page="vehicleFooter.jsp"/>

</body>
</html>
