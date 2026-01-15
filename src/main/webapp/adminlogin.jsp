<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login - Vehicle Rental System</title>

<style>
/* Reset & Base Styles */
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: 'Poppins', Arial, sans-serif;
    min-height: 100vh;
    background: linear-gradient(to right, #e0f2ff, #cfe8ff);
    display: flex;
    flex-direction: column;
}

/* Center the login form */
.login-form {
    margin: 60px auto;
    background: linear-gradient(145deg, #1e3a8a, #3b5ac6); /* Dark Blue Gradient */
    padding: 40px 35px;
    border-radius: 20px;
    width: 100%;
    max-width: 400px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.3);
    color: #ffffff;
}

/* Form Header */
.login-form h2 {
    text-align: center;
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 30px;
    color: #e0f2ff;
}

/* Form Fields */
.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
    font-size: 16px;
    color: #cce0ff; /* Lighter blue for contrast */
}

.form-group input {
    width: 100%;
    padding: 12px 15px;
    font-size: 16px;
    border-radius: 10px;
    border: 1px solid #90caf9;
    outline: none;
    transition: all 0.3s ease;
}

.form-group input:focus {
    border-color: #64b5f6;
    box-shadow: 0 0 8px rgba(100, 181, 246, 0.4);
}

/* Error Message */
.error-message {
    color: #f8d7da;
    background-color: rgba(220, 53, 69, 0.2);
    border: 1px solid #f5c6cb;
    padding: 12px;
    border-radius: 8px;
    margin-bottom: 20px;
    font-weight: 600;
}

/* Submit Button */
.submit-btn {
    width: 100%;
    padding: 14px;
    background: linear-gradient(135deg, #06b6d4, #0ea5e9); /* Bright Blue Gradient */
    color: #ffffff;
    border: none;
    border-radius: 12px;
    font-size: 18px;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.3s ease;
}

.submit-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 20px rgba(14, 165, 233, 0.4);
}

.submit-btn:active {
    transform: translateY(0);
}

/* Responsive */
@media (max-width: 480px) {
    .login-form {
        padding: 30px 20px;
        margin: 40px 15px;
    }
    .login-form h2 {
        font-size: 24px;
    }
    .submit-btn {
        font-size: 16px;
    }
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

<div class="login-form">
    <h2>Admin Login</h2>

    <% if (request.getAttribute("error") != null) { %>
        <div class="error-message">
            <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <form action="adminloginServlet" method="post">
        <div class="form-group">
            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
        </div>

        <button type="submit" class="submit-btn">Login</button>
    </form>
</div>

<jsp:include page="vehicleFooter.jsp"/>
</body>
</html>
