<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="userManagement.UserModel" %>
<%
    UserModel user = (UserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Profile - Vehicle Rental System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    
   /* Header Section */
        * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
    }

    header {
        background-color: #A0BABA;
        padding: 15px 30px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
    }

    .logo img {
        width: 120px;
    }
        
    nav ul {
        list-style: none;
        display: flex;
        gap: 30px;
    }

    nav ul li a {
        font-family: "Lucida Console", "Courier New", monospace;
        text-decoration: none;
        color: #000;
        font-size: 18px;
        padding: 8px 12px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    nav ul li a:hover {
        background-color: #d1e0e0;
    }

    .auth-buttons {
        display: flex;
        gap: 10px;
    }

    .auth-buttons a {
        text-decoration: none;
        background-color: #000;
        color: #fff;
        font-size: 16px;
        padding: 8px 16px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .auth-buttons a:hover {
        background-color: #333;
    }
        
    @media (max-width: 768px) {
        .container {
            flex-direction: column;
            align-items: flex-start;
        }

        nav ul {
            flex-direction: column;
            gap: 10px;
            margin-top: 10px;
        }

        .auth-buttons {
            margin-top: 10px;
        }
    }

    

        /* Body and Layout */
        html, body {
            font-family: Arial, sans-serif;
            width: 100%;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        body {
            flex: 1;
            background-color: #e6e6e6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 0;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            width: 100%;
            box-sizing: border-box;
        }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    th, td {
        border: 1px solid #ccc;
        padding: 10px 12px;
        text-align: left;
        font-size: 14px;
    }

    th {
        background-color: #2f4f4f;
        color: #ffffff;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    button {
        padding: 6px 12px;
        margin: 2px 0;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 13px;
    }

    button:hover {
        background-color: #45a049;
    }

    a button {
        margin-right: 5px;
    }

    form {
        display: inline;
    }
    
    .profileimage{
    	height: 100px;
    	width: 100px;
    	border-radius: 50%;
    }

    @media screen and (max-width: 768px) {
        table, thead, tbody, th, td, tr {
            display: block;
        }

        tr {
            margin-bottom: 15px;
            border-bottom: 2px solid #ccc;
        }

        th, td {
            text-align: right;
            padding-left: 50%;
            position: relative;
        }

        th::before, td::before {
            content: attr(data-label);
            position: absolute;
            left: 10px;
            width: 45%;
            padding-left: 10px;
            font-weight: bold;
            text-align: left;
        }

        th {
            background-color: #2f4f4f;
            color: white;
        }
    }
         /*display csss*/
		    .card-container {
		    display: flex;
		    flex-wrap: wrap;
		    gap: 20px;
		    justify-content: center;
		    padding: 20px;
		}
		
		.card {
		    background-color: #fff;
		    border-radius: 10px;
		    width: 300px;
		    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
		    overflow: hidden;
		    text-align: center;
		    padding: 20px;
		    transition: transform 0.3s ease;
		}
		
		.card:hover {
		    transform: translateY(-5px);
		}
		
		.profile-img {
		    width: 120px;
		    height: 120px;
		    object-fit: cover;
		    border-radius: 50%;
		    margin-bottom: 15px;
		    border: 3px solid #2f4f4f;
		}
		
		.card-details p {
		    margin: 8px 0;
		    font-size: 14px;
		    color: #333;
		    text-align: left;
		}
		
		.actions {
		    margin-top: 15px;
		}
		
		.actions button {
		    margin: 5px;
		    padding: 8px 14px;
		    font-size: 13px;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		}
		
		.actions a button {
		    background-color: #1E90FF;
		    color: white;
		}
		
		.actions form button {
		    background-color: #FF4C4C;
		    color: white;
		}
		    
       /* Footer */
       

       * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            flex-direction: column;
        }

        .main-content {
            flex: 1;
        }

        footer {
            background-color: #222;
            color: #fff;
            padding: 40px 20px;
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: flex-start;
        }

        .footer-logo {
            width: 100%;
            text-align: center;
            margin-bottom: 30px;
        }

        .footer-logo img {
            max-width: 160px;
            height: auto;
        }

        .footer-section {
            flex: 1;
            min-width: 280px;
            margin: 10px 0;
            padding: 0 15px;
        }
        
        .contact-section {
        	padding-left: 200px;
        }

        .footer-section h3 {
            font-size: 22px;
            margin-bottom: 15px;
            color: #f0f0f0;
        }

        .footer-section p {
            font-size: 15px;
            line-height: 1.6;
            color: #ccc;
        }

        .footer-section a {
            color: #4CAF50;
            text-decoration: none;
        }

        .footer-section a:hover {
            text-decoration: underline;
        }

        .social-media {
            margin-top: 20px;
        }

        .social-media img {
            width: 32px;
            height: 32px;
            margin-right: 10px;
            vertical-align: middle;
            transition: transform 0.2s;
        }

        .social-media a:hover img {
            transform: scale(1.1);
        }

        .footer-bottom {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #444;
        }

        .footer-bottom p {
            font-size: 14px;
            color: #888;
        }

        @media (max-width: 768px) {
            .footer-container {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .footer-section {
                padding: 10px 0;
            }

            .social-media {
                justify-content: center;
            }
        }
    </style>
 </head>
 <body>
 
 <header>
        <div class="container">
            <!-- Logo -->
            <div class="logo">
                <a href="#"><img src="img/logo.png" alt="Logo"></a>
            </div>

            <!-- Navigation -->
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="About_Us.jsp">About</a></li>
                    <li><a href="insert.jsp">Reserve</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                </ul>
            </nav>

            <!-- Auth Buttons -->
            <div class="auth-buttons">
                <a href="Home.jsp">Sign Up</a>
                <a href="login.jsp">Log In</a>
            </div>
        </div>
    </header>
    
    <div class="main-content">
      <h2>Driver Details </h2>
      <div class="card-container">
        <c:forEach var="vehicle" items="${oneVehicle}">
          <div class="card">
            <img src="img/driverImage.webp" class="profileimage">
            <div class="card-details">
              <p><strong>Full Name:</strong> ${vehicle.fullName}</p>
              <p><strong>Email:</strong> ${vehicle.email}</p>
              <p><strong>Phone:</strong> ${vehicle.phone}</p>
              <p><strong>License Number:</strong> ${vehicle.licenseNumber}</p>
              <p><strong>Expiry Date:</strong> ${vehicle.licenseExpiryDate}</p>
              <p><strong>Vehicle Assigned:</strong> ${vehicle.vehicleAssigned}</p>
              <p><strong>Address:</strong> ${vehicle.address}</p>
              <p><strong>Password:</strong> ${vehicle.password}</p>
              <div class="actions">
                <c:url var="updateUrl" value="update.jsp">
                  <c:param name="id" value="${vehicle.id}" />
                  <c:param name="fullName" value="${vehicle.fullName}" />
                  <c:param name="email" value="${vehicle.email}" />
                  <c:param name="phone" value="${vehicle.phone}" />
                  <c:param name="licenseNumber" value="${vehicle.licenseNumber}" />
                  <c:param name="licenseExpiryDate" value="${vehicle.licenseExpiryDate}" />
                  <c:param name="vehicleAssigned" value="${vehicle.vehicleAssigned}" />
                  <c:param name="address" value="${vehicle.address}" />
                  <c:param name="password" value="${vehicle.password}" />
                </c:url>
                <a href="${updateUrl}"><button>Update</button></a>
                <form action="DeleteServlet" method="post" style="display:inline;">
                  <input type="hidden" name="id" value="${vehicle.id}" />
                  <button>Delete</button>
                </form>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>

    <!-- Footer -->
    <footer>
       
        <div class="footer-container">
            <div class="footer-section">
                <h3>About Us</h3>
                <p>We are a premium vehicle rental service dedicated to providing our customers with the best vehicles and exceptional service. With a wide range of vehicles and flexible rental options, we make your journey comfortable and hassle-free.</p>
            </div>
            <div class="footer-section contact-section">
                <h3>Contact Us</h3>
                <p>
                    <strong>Address:</strong> 123 Kaduwela Road, Malabe, Sri Lanka<br>
                    <strong>Phone:</strong> +94-771230123<br>
                    <strong>Email:</strong> info@wheels4u.lk<br>
                    <strong>Website:</strong> <a href="https://www.rentngo.lk" target="_blank">www.wheels4u.lk</a>
                </p>

                <div class="social-media">
                    <a href="https://www.facebook.com/" target="_blank">
          			<img src="img/pic4.jpg" alt="Facebook">
                    </a>
                    
                    <a href="https://www.instagram.com/" target="_blank">
                    <img src="img/pic6.jpg" alt="Instagram">
                    </a>
                    
                    <a href="https://www.twitter.com/" target="_blank">
                    <img src="img/pic5.jpg" alt="Twitter">
                    </a>
                    
                    <a href="https://www.pinterest.com/" target="_blank">
                    <img src="img/pinterest.png" alt="Pinterest">
                    </a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 Wheels4u. All rights reserved.</p>
        </div>
    </footer>
 
 </body>
 </html >
