<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<title>Vehicle Rental System</title>



<style>

/* ---------------- GLOBAL STYLES ---------------- */
body {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
    background-color: #f7f9fc;
}
.wrapper {
    width: 100%;
    margin: 0 auto;
}

/* ---------------- HERO VIDEO SECTION ---------------- */
.hero {
    position: relative;
    height: 88vh;
    overflow: hidden;
    display: flex;
    align-items: center;
    padding-left: 60px;

    /* NEW BACKGROUND IMAGE */
    background-image: url('img/m1.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}


.hero video {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: -2;
}

/* LIGHT overlay (video is clear) */
.hero-overlay {
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.20);
    top: 0;
    left: 0;
    z-index: -1;
}

.hero-content {
    position: relative;
    max-width: 600px;
    color: #fff;
}

.hero-content h1 {
    font-size: 65px;
    line-height: 1.1;
    margin: 0 0 20px;
    font-weight: 700;
}

.hero-content p {
    font-size: 20px;
    line-height: 1.5;
    margin-bottom: 35px;
    max-width: 480px;
}

.cta-buttons button {
    padding: 12px 25px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-right: 15px;
    transition: 0.3s;
}

.get-started { background-color: #0054d1; color: white; }
.get-started:hover { background-color: #003f9e; }

.learn-more { background-color: white; color: #0054d1; }
.learn-more:hover { background-color: #e8e8e8; }

/* ---------------- NEW HOW IT WORKS SECTION ---------------- */
.how-it-works {
    background: linear-gradient(135deg, #ffffff, #e8f0ff);
    padding: 30px 20px 70px 20px;
    text-align: center;
}

.how-it-works h2 {
    font-size: 42px;
    font-weight: 700;
    margin-bottom: 50px;
    color: #002b7f;
}

/* Timeline container */
.hiw-timeline {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    gap: 60px;
    flex-wrap: wrap;
    position: relative;
}

/* Vertical line */
.hiw-timeline::before {
    content: "";
    position: absolute;
    width: 6px;
    background: #4d7cff;
    height: 80%;
    left: 50%;
    transform: translateX(-50%);
    border-radius: 10px;
}

.hiw-item {
    width: 380px;
    background: white;
    padding: 25px;
    border-radius: 20px;
    border: 4px solid #4d7cff; /* 🔵 Added border in same color as number circle */
    box-shadow: 0px 8px 20px rgba(0,0,0,0.15);
    position: relative;
    text-align: left;
    transition: 0.3s;
}


.hiw-item:hover {
    transform: translateY(-8px);
    border-color: #002b9f; /* darker blue on hover */
    box-shadow: 0px 12px 26px rgba(0,0,0,0.22);
}


/* Circle step number */
.hiw-step-circle {
    width: 70px;
    height: 70px;
    border-radius: 50%;
    background: #4d7cff;
    color: white;
    font-size: 26px;
    font-weight: bold;
    display: flex;
    align-items: center;
    justify-content: center;
    position: absolute;
    left: -50px;
    top: 20px;
    box-shadow: 0px 4px 12px rgba(0,0,0,0.25);
}

.hiw-item h3 {
    font-size: 22px;
    margin-bottom: 10px;
    color: #002b7f;
}

.hiw-item p {
    font-size: 15px;
    color: #444;
}

/* ---------------- FEATURES SECTION ---------------- */
.features {
    padding: 70px 20px;
    background: linear-gradient(135deg, #dce7ff, #b9ccff);
    text-align: center;
}

.features h2 {
    font-size: 42px;
    font-weight: 700;
    margin-bottom: 40px;
    color: #0e1a40;
}

.feature-list {
    display: flex;
    justify-content: center;
    gap: 40px;
    flex-wrap: wrap;
}

.feature {
    width: 300px;
    background: white;
    padding: 25px;
    border-radius: 18px;
    box-shadow: 0px 8px 20px rgba(0,0,0,0.15);
    transition: 0.35s ease;
    border-top: 6px solid #4b71ff;
}

.feature:hover {
    transform: translateY(-10px);
    box-shadow: 0px 12px 30px rgba(0,0,0,0.22);
    border-top-color: #002b9f;
}

.feature img {
    width: 90px;
    margin-bottom: 15px;
    border-radius: 10px;
}
.feature i {
    font-size: 46px;
    color: #4b71ff;
    margin-bottom: 18px;
    display: inline-block;
}


.feature h3 {
    font-size: 22px;
    margin-bottom: 10px;
    color: #002b7f;
}

.feature p {
    font-size: 15px;
    color: #333;
}

/* ---------------- MODAL ---------------- */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
    justify-content: center;
    align-items: center;
    z-index: 999;
}

.modal-content {
    background: white;
    padding: 25px;
    width: 320px;
    border-radius: 10px;
    text-align: center;
    position: relative;
}

.close-btn {
    position: absolute;
    right: 10px;
    top: 10px;
    border: none;
    background: none;
    font-size: 22px;
    cursor: pointer;
}

.role-btn {
    width: 90%;
    margin: 10px auto;
    padding: 12px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 17px;
    transition: 0.3s;
}

.user-btn { background: #1e88e5; color: white; }
.driver-btn { background: #ffca28; color: black; }
.admin-btn { background: #e53935; color: white; }

.role-btn:hover {
    transform: translateY(-2px);
    opacity: 0.9;
}

/* ---------------- HERO ZOOM IN ANIMATION ---------------- */
@keyframes heroZoomIn {
    0% {
        transform: scale(1.08);
    }
    100% {
        transform: scale(1);
    }
}

/* Apply animation to hero background */
.hero {
    animation: heroZoomIn 1.6s ease-out forwards;
}

@keyframes heroFadeUp {
    0% {
        opacity: 0;
        transform: translateY(25px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

.hero-content {
    animation: heroFadeUp 1.2s ease-out forwards;
}

/* ================= TOURIST RENTAL CLEAN PREMIUM SECTION ================= */
.tourist-info {
    padding: 100px 60px;
    background: #f8fbff;
}

.tourist-container {
    max-width: 1200px;
    margin: auto;
    display: grid;
    grid-template-columns: 1.2fr 0.8fr;
    gap: 60px;
    align-items: center;
    
}

/* LEFT CONTENT CARD */
.tourist-text {
    background: #ffffff;
    padding: 50px;
    border-radius: 22px;
    box-shadow: 0px 15px 35px rgba(0,0,0,0.12);
}

.tourist-text h2 {
    font-size: 46px;
    font-weight: 800;
    color: #002b7f;
    margin-bottom: 10px;
}

.tourist-text h2 span {
    display: block;
    font-size: 32px;
    font-weight: 700;
    color: #0054d1;
}

.tourist-text p {
    font-size: 18px;
    line-height: 1.9;
    color: #444;
    margin-top: 22px;
}

/* CONTACT LINE */
.tourist-text .contact {
    margin-top: 28px;
    font-size: 18px;
    font-weight: 600;
    color: #002b7f;
}

/* FEATURES */
.tourist-features {
    margin-top: 35px;
}

.tourist-feature {
    display: flex;
    align-items: center;
    gap: 18px;
    padding: 14px 0;
}

.tourist-feature i {
    font-size: 26px;
    color: #4d7cff;
}

.tourist-feature span {
    font-size: 18px;
    color: #222;
    line-height: 1.6;
}

/* RIGHT SIDE VISUALS */
.tourist-visual {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 30px;
}

/* MAP */
.srilanka-map img {
    width: 260px;
    animation: mapPulse 3s infinite ease-in-out;
}

/* IMAGE */
.tourist-image img {
    width: 100%;
    max-width: 420px;
    border-radius: 20px;
    box-shadow: 0px 18px 40px rgba(0,0,0,0.25);
    animation: imageFloat 2s ease-out forwards;
}

/* ANIMATIONS */
@keyframes imageFloat {
    from {
        opacity: 0;
        transform: translateY(40px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes mapPulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
}

/* RESPONSIVE */
@media (max-width: 900px) {
    .tourist-container {
        grid-template-columns: 1fr;
        text-align: center;
    }

    .tourist-text {
        padding: 40px;
    }

    .tourist-feature {
        justify-content: center;
        text-align: left;
    }
}

/* ---------------- CUSTOMER REVIEWS ---------------- */
.reviews {
    padding: 70px 20px;
    background: linear-gradient(135deg, #f0f4ff, #d0deff);
    text-align: center;
}

.reviews h2 {
    font-size: 42px;
    font-weight: 700;
    margin-bottom: 50px;
    color: #002b7f;
}

.review-list {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 30px;
}

.review-card {
    width: 280px;
    background: white;
    padding: 30px 20px;
    border-radius: 18px;
    box-shadow: 0px 8px 25px rgba(0,0,0,0.15);
    transition: 0.35s ease;
    position: relative;
    text-align: left;
}

.review-card:hover {
    transform: translateY(-8px);
    box-shadow: 0px 14px 32px rgba(0,0,0,0.22);
}

.review-card p {
    font-size: 15px;
    color: #333;
    line-height: 1.6;
    margin-bottom: 20px;
}

.review-card h4 {
    font-size: 16px;
    color: #0054d1;
    font-weight: 600;
}

.quote-icon {
    font-size: 28px;
    color: #4b71ff;
    position: absolute;
    top: 15px;
    left: 20px;
}

.review-stars {
	margin-top:15px;
    margin-bottom: 15px;
}

.review-stars i {
    color: #FFD700; /* Gold/yellow color */
    margin-right: 3px;
    font-size: 18px;
}

.how-it-works-image {
    margin-top: 50px;
    text-align: center;
}

.how-it-works-image img {
    max-width: 60%;
    height: auto;
    border-radius: 18px;
    box-shadow: 0px 15px 40px rgba(0,0,0,0.2);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.how-it-works-image img:hover {
    transform: translateY(-6px) scale(1.02);
    box-shadow: 0px 20px 50px rgba(0,0,0,0.28);
}


</style>
</head>

<jsp:include page="header.jsp"/>

<body>

<% 
    String logoutMessage = (String) session.getAttribute("logoutMessage");
    if (logoutMessage != null) {
%>
    <div id="flashMessage" style="
        position: fixed;
        top: 80px; /* adjust below header */
        right: 20px;
        background-color: #28a745; /* green for success */
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        z-index: 1000;
        font-weight: 600;
    ">
        <%= logoutMessage %>
    </div>
<% 
        session.removeAttribute("logoutMessage"); // remove it so it shows only once
    } 
%>

<div class="wrapper">

    <!-- ---------------- HERO ---------------- -->
    <section class="hero">
        

        <div class="hero-overlay"></div>

        <div class="hero-content">
            <h1>Your Journey <br> Starts Here</h1>
            <p>
                Welcome to <b><i>Wheels4U</i></b>.  
                Find the perfect vehicle for your travel needs  
                with secure, affordable, and fast booking.
            </p>

            <div class="cta-buttons">
                <button class="get-started" onclick="showRoleModal()">Get Started</button>
                <a href="about.jsp"><button class="learn-more">Learn More</button></a>
            </div>
        </div>
    </section>

<!-- ================= TOURIST RENTAL PREMIUM SECTION ================= -->
<section class="tourist-info">
    <div class="tourist-container">

        <!-- LEFT TEXT -->
        <div class="tourist-text">
            <h2>
                Rent a Car for Tourists
                <span>in Sri Lanka</span>
            </h2>

            <p>
                Discover Sri Lanka with comfort, freedom, and confidence.
                <b>Wheels4U</b> offers reliable self-drive car and van rentals,
                specially designed for tourists exploring this beautiful island.
            </p>

            <p>
                Travel through beaches, hill country, and cultural cities at your
                own pace. Our vehicles are well-maintained, affordable, and
                perfect for both short trips and long journeys.
            </p>

            <p class="contact">
                📞 Book instantly via WhatsApp: <b>+94 11 111 1111</b>
            </p>

            <div class="tourist-features">
                <div class="tourist-feature">
                    <i class="fa-solid fa-route"></i>
                    <span><b>Freedom to Explore</b> — No fixed schedules or restrictions.</span>
                </div>

                <div class="tourist-feature">
                    <i class="fa-solid fa-car"></i>
                    <span><b>Easy & Convenient</b> — Skip public transport and taxis.</span>
                </div>

                <div class="tourist-feature">
                    <i class="fa-solid fa-shield-heart"></i>
                    <span><b>Safe & Comfortable</b> — Trusted vehicles for peace of mind.</span>
                </div>
            </div>
        </div>

        <!-- RIGHT VISUAL -->
        <div class="tourist-visual">
            <div class="srilanka-map">
                <img src="img/srilanka-map.jpg" alt="Sri Lanka Map">
            </div>

            <div class="tourist-image">
                <img src="img/one-way-drop-4.png" alt="One Way Car Drop Sri Lanka">
            </div>
        </div>

    </div>
</section>


    <!-- ---------------- NEW HOW IT WORKS ---------------- -->
    <section class="how-it-works">
        <h2>How It Works</h2>

        <div class="hiw-timeline">

            <div class="hiw-item">
                <div class="hiw-step-circle">1</div>
                <h3>Choose a Vehicle</h3>
                <p>Select the best vehicle that suits your needs from our wide collection.</p>
            </div>

            <div class="hiw-item">
                <div class="hiw-step-circle">2</div>
                <h3>Set Payment & Dates</h3>
                <p>Pick your booking dates and preferred payment method.</p>
            </div>

            <div class="hiw-item">
                <div class="hiw-step-circle">3</div>
                <h3>Confirm Booking</h3>
                <p>Finalize your reservation and begin your journey with confidence.</p>
            </div>

        </div>
        
          <!-- EASY IMAGE BELOW TIMELINE -->
    <div class="how-it-works-image">
        <img src="img/easy.webp" alt="Easy Booking & Use">
    </div>
    </section>
    
    
    

    <!-- ---------------- FEATURES ---------------- -->
   <section class="features">
    <h2>Why Choose Us?</h2>

    <div class="feature-list">

        <!-- 1 -->
        <div class="feature">
            <i class="fa-solid fa-road"></i>
            <h3>Convenient Self-Drive</h3>
            <p>
                Rent a car without a driver and explore Sri Lanka freely,
                at your own pace and on your own schedule.
            </p>
        </div>

        <!-- 2 -->
        <div class="feature">
            <i class="fa-solid fa-car-side"></i>
            <h3>Wide Vehicle Range</h3>
            <p>
                From compact cars to spacious SUVs and vans,
                we have vehicles for solo travelers, families, and groups.
            </p>
        </div>

        <!-- 3 -->
        <div class="feature">
            <i class="fa-solid fa-tags"></i>
            <h3>Affordable Rates</h3>
            <p>
                Enjoy competitive pricing specially designed for tourists,
                giving you the best value for your journey.
            </p>
        </div>

        <!-- 4 -->
        <div class="feature">
            <i class="fa-solid fa-file-invoice-dollar"></i>
            <h3>Transparent Pricing</h3>
            <p>
                No hidden fees or surprises.
                What you see is exactly what you pay.
            </p>
        </div>

        <!-- 5 -->
        <div class="feature">
            <i class="fa-solid fa-calendar-check"></i>
            <h3>Easy Booking</h3>
            <p>
                Book your vehicle quickly via WhatsApp
                with a simple and hassle-free process.
            </p>
        </div>

        <!-- 6 -->
        <div class="feature">
            <i class="fa-solid fa-headset"></i>
            <h3>Excellent Support</h3>
            <p>
                Our friendly customer support team is always
                ready to help before and during your trip.
            </p>
        </div>

        <!-- 7 -->
        <div class="feature">
            <i class="fa-solid fa-map-location-dot"></i>
            <h3>Local Expertise</h3>
            <p>
                Get insider tips, travel advice, and must-visit
                destinations from our local experts.
            </p>
        </div>

        <!-- 8 -->
        <div class="feature">
            <i class="fa-solid fa-shield-halved"></i>
            <h3>Safety First</h3>
            <p>
                All vehicles are well-maintained and safety-checked
                for a smooth and worry-free drive.
            </p>
        </div>

    </div>
</section>

<!-- ---------------- CUSTOMER REVIEWS ---------------- -->
<section class="reviews">
    <h2>What Our Customers Say</h2>

    <div class="review-list">
        <!-- Review 1 -->
        <div class="review-card">
            <i class="fa-solid fa-quote-left quote-icon"></i>
            <div class="review-stars">
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star-half-stroke"></i>
    </div>
            <p>
                "Wheels4U made our trip to Sri Lanka unforgettable! The car was spotless and the booking was super easy."
            </p>
            <h4>— Samantha R.</h4>
        </div>

        <!-- Review 2 -->
        <div class="review-card">
            <i class="fa-solid fa-quote-left quote-icon"></i>
            <div class="review-stars">
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star-half-stroke"></i>
    </div>
            <p>
                "Excellent service and very helpful support team. I felt completely safe driving on my own."
            </p>
            <h4>— Daniel K.</h4>
        </div>

        <!-- Review 3 -->
        <div class="review-card">
            <i class="fa-solid fa-quote-left quote-icon"></i>
            <div class="review-stars">
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
    </div>
            <p>
                "Wide range of vehicles and affordable pricing. I highly recommend Wheels4U for anyone visiting Sri Lanka."
            </p>
            <h4>— Priya S.</h4>
        </div>

        <!-- Review 4 -->
        <div class="review-card">
            <i class="fa-solid fa-quote-left quote-icon"></i>
            <div class="review-stars">
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star"></i>
        <i class="fa-solid fa-star-half-stroke"></i>
    </div>
            <p>
                "The local tips and support were amazing. Loved exploring Sri Lanka at my own pace!"
            </p>
            <h4>— Michael L.</h4>
        </div>
    </div>
</section>



</div>

<!-- ---------------- ROLE MODAL ---------------- -->
<div id="roleModal" class="modal">
    <div class="modal-content">
        <button class="close-btn" onclick="closeModal()">&times;</button>
        <h2>Select Your Role</h2>

        <button class="role-btn user-btn" onclick="selectRole('User')">User / Customer</button>
        <button class="role-btn driver-btn" onclick="selectRole('Driver')">Driver</button>
        <button class="role-btn admin-btn" onclick="selectRole('Admin')">Administrator</button>
    </div>
</div>

<script>
    window.addEventListener('DOMContentLoaded', (event) => {
        const flash = document.getElementById('flashMessage');
        if (flash) {
            setTimeout(() => {
                flash.style.transition = "opacity 0.5s ease";
                flash.style.opacity = "0";
                setTimeout(() => flash.remove(), 500); // remove from DOM after fade out
            }, 3000); // 3 seconds
        }
    });
</script>


<jsp:include page="vehicleFooter.jsp"/>


</body>
</html>
