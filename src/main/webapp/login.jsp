<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Vehicle Rental System</title>
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
        
       

        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 5px;
        }

        .login-form {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 400px;
        }

        .login-form h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }

        .form-group input:focus {
            outline: none;
            border-color: #1E90FF;
            box-shadow: 0 0 5px rgba(30,144,255,0.3);
        }

        .error-message {
            color: #dc3545;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 20px;
            display: none;
        }

        .error-message.show {
            display: block;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #1E90FF;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #187bcd;
        }

        .signup-link {
            text-align: center;
            margin-top: 20px;
        }

        .signup-link a {
            color: #1E90FF;
            text-decoration: none;
        }

        .signup-link a:hover {
            text-decoration: underline;
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
       
        /* Password field container */
        .password-container {
            position: relative;
            width: 100%;
        }

        .password-container input {
            padding-right: 40px; /* Make room for the eye icon */
        }

        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            background: none;
            border: none;
            padding: 0;
            width: 24px;
            height: 24px;
        }

        .toggle-password img {
            width: 24px;
            height: 24px;
            opacity: 0.6;
        }

        .toggle-password:hover img {
            opacity: 1;
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

    <div class="container">
        <div class="login-container">
            <h2 class="text-center mb-4">Login</h2>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <form action="${pageContext.request.contextPath}/user/login" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
            
            <div class="text-center mt-3">
                <p>Don't have an account? <a href="${pageContext.request.contextPath}/register.jsp">Register here</a></p>
            </div>
        </div>
    </div>
    
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 