<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Registration Form</title>
    <style>
        /* Reset */
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
            max-width: 100%;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        body {
            flex: 1;
        }

        .img {
            position: fixed;
            right: 0;
            bottom: -5px;
            min-width: 100%;
            min-height: 100%;
            width: 100%;
            z-index: -1;
            object-fit: contain;
            opacity: 70%;
        }

        /* Form Container */
        .form-container {
            width: 600px; /* Exact width as requested */
            backdrop-filter: blur(30px);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 40px auto; /* Center the form with margin */
        }

        form {
            max-width: 100%; /* Ensure form fits within container */
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="date"],
        input[type="password"],
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #a0a0a0;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100px;
        }

        input[type="submit"]:hover {
            background-color: black;
        }

        .error {
            color: red;
            margin-bottom: 15px;
            display: none;
            font-size: 14px;
        }

        .server-error {
            color: red;
            margin-bottom: 15px;
            font-size: 14px;
        }

        a {
            color: white;
            text-decoration: none;
        }

        a:hover {
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
                <a href="signup.html">Sign Up</a>
                <a href="login.jsp">Log In</a>
            </div>
        </div>
    </header>

    <div class="img">
        <img src="img/new2.jpeg" alt="Background Image">
    </div>

    <!-- Register Form -->
    <div class="form-container">
        <h2>Driver Registration Form</h2>
        <% if (request.getAttribute("error") != null) { %>
            <div class="server-error"><%= request.getAttribute("error") %></div>
        <% } %>
        <form action="insertServlet" method="post" enctype="multipart/form-data" id="driverForm">
            <div id="formError" class="error"></div>
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>
            <div id="fullNameError" class="error"></div>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <div id="emailError" class="error"></div>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" placeholder="1234567890" required>
            <div id="phoneError" class="error"></div>

            <label for="licenseNumber">License Number:</label>
            <input type="text" id="licenseNumber" name="licenseNumber" required>
            <div id="licenseNumberError" class="error"></div>

            <label for="licenseExpiryDate">License Expiry Date:</label>
            <input type="date" id="licenseExpiryDate" name="licenseExpiryDate" required>
            <div id="dateError" class="error"></div>

            <label for="vehicleAssigned">Vehicle Assigned:</label>
            <input type="text" id="vehicleAssigned" name="vehicleAssigned">
            <div id="vehicleAssignedError" class="error"></div>

            <label for="address">Address:</label>
            <textarea id="address" name="address" rows="4"></textarea>
            <div id="addressError" class="error"></div>

            <label for="profilePicture">Profile Picture:</label>
            <input type="file" id="profilePicture" name="profilePicture" accept="image/jpeg,image/png,image/gif">
            <div id="profilePictureError" class="error"></div>
            
            <label for="password">Password:</label>
            <div class="password-container">
                <input type="password" id="password" name="password" required>
                <button type="button" class="toggle-password">
                    <img src="img/eye.svg" alt="Toggle Password Visibility">
                </button>
            </div>
            <div id="passwordError" class="error"></div>

            <input type="submit" value="Submit">
        </form>
        <p><a href="changePasswordForm.html">Change Password</a></p>
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
    
    <script>
        // Helper function to show error messages
        function showError(elementId, message) {
            const errorElement = document.getElementById(elementId);
            errorElement.textContent = message;
            errorElement.style.display = 'block';
            return false;
        }

        function clearError(elementId) {
            const errorElement = document.getElementById(elementId);
            errorElement.style.display = 'none';
            return true;
        }

        // Email validation
        function validateEmail() {
            const email = document.getElementById('email').value;
            const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailRegex.test(email)) {
                return showError('emailError', 'Please enter a valid email address');
            }
            return clearError('emailError');
        }

        // Phone validation
        function validatePhone() {
            const phone = document.getElementById('phone').value;
            const phoneRegex = /^[0-9]{10}$/;
            if (!phoneRegex.test(phone)) {
                return showError('phoneError', 'Please enter a valid 10-digit phone number');
            }
            return clearError('phoneError');
        }

        // Profile picture validation
        function validateProfilePicture() {
            const fileInput = document.getElementById('profilePicture');
            const file = fileInput.files[0];
            const maxSize = 5 * 1024 * 1024; // 5MB
            const allowedTypes = ['image/jpeg', 'image/png', 'image/gif'];

            if (file) {
                if (!allowedTypes.includes(file.type)) {
                    fileInput.value = '';
                    return showError('profilePictureError', 'Only JPG, PNG, or GIF files are allowed');
                }
                if (file.size > maxSize) {
                    fileInput.value = '';
                    return showError('profilePictureError', 'File size exceeds 5MB limit');
                }
            }
            return clearError('profilePictureError');
        }

        // Password validation
        function validatePassword() {
            const password = document.getElementById('password').value;
            const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            if (!passwordRegex.test(password)) {
                return showError('passwordError', 'Password must be at least 8 characters, with 1 uppercase, 1 lowercase, 1 number, and 1 special character');
            }
            return clearError('passwordError');
        }
        
        // License expiry date validation
        function validateLicenseExpiryDate() {
            const dateInput = document.getElementById('licenseExpiryDate');
            const selectedDate = new Date(dateInput.value);
            const today = new Date();
            const oneMonthLater = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());

            // Clear previous error
            clearError('dateError');

            if (!dateInput.value) {
                return showError('dateError', 'License expiry date is required');
            }

            if (selectedDate <= oneMonthLater) {
                dateInput.value = '';
                return showError('dateError', 'License expiry date must be at least one month in the future');
            }

            return true;
        }

        // Real-time validation on input change
        document.getElementById('email').addEventListener('input', validateEmail);
        document.getElementById('phone').addEventListener('input', validatePhone);
        document.getElementById('profilePicture').addEventListener('change', validateProfilePicture);
        document.getElementById('password').addEventListener('input', validatePassword);
        document.getElementById('licenseExpiryDate').addEventListener('change', validateLicenseExpiryDate);

        // Form submission validation
        document.getElementById('driverForm').addEventListener('submit', function(e) {
            const isEmailValid = validateEmail();
            const isPhoneValid = validatePhone();
            const isProfilePictureValid = validateProfilePicture();
            const isPasswordValid = validatePassword();
            const isDateValid = validateLicenseExpiryDate();

            if (!isEmailValid || !isPhoneValid || !isProfilePictureValid || !isPasswordValid || !isDateValid) {
                e.preventDefault();
                showError('formError', 'Please fix all errors before submitting');
            }
        });

        // Password visibility toggle
        const passwordInput = document.getElementById('password');
        const togglePassword = document.querySelector('.toggle-password');

        togglePassword.addEventListener('click', function(e) {
            e.preventDefault();
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            this.querySelector('img').src = type === 'password' ? 'img/eye.svg' : 'img/eye-slash.svg';
        });
    </script>
</body>
</html>
