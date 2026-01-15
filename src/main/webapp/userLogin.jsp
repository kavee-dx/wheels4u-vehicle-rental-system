<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | Wheels4U</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
/* ================= PAGE BACKGROUND ================= */
body {
    background: linear-gradient(135deg, #e9f5f5, #f7fbfb);
}

/* ================= LOGIN FORM WRAPPER ================= */
.login-wrapper {
    min-height: calc(100vh - 200px);
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 50px 15px;
}

/* ================= LOGIN CARD ================= */
.login-card {
    width: 100%;
    max-width: 420px;
    background: #ffffff;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    animation: fadeInUp 0.6s ease;
}

/* Header section of form */
.login-card-header {
    background: linear-gradient(135deg, #1E90FF, #187bcd);
    padding: 25px;
    text-align: center;
    color: #fff;
}

.login-card-header h2 {
    margin: 0;
    font-weight: 700;
}

/* Form body */
.login-card-body {
    padding: 35px 30px;
}

/* Inputs */
.form-label {
    font-weight: 600;
    color: #555;
}

.form-control {
    border-radius: 10px;
    padding: 12px;
    border: 1px solid #ccc;
}

.form-control:focus {
    border-color: #1E90FF;
    box-shadow: 0 0 0 0.2rem rgba(30,144,255,0.25);
}

/* Login button */
.login-btn {
    background: linear-gradient(135deg, #1E90FF, #187bcd);
    border: none;
    border-radius: 10px;
    padding: 12px;
    font-size: 16px;
    font-weight: 600;
    transition: all 0.3s ease;
}

.login-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(30,144,255,0.4);
}

/* Footer text */
.login-footer {
    text-align: center;
    margin-top: 20px;
}

.login-footer a {
    color: #1E90FF;
    font-weight: 600;
    text-decoration: none;
}

.login-footer a:hover {
    text-decoration: underline;
}

/* Animation */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(25px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Alerts */
.alert {
    border-radius: 10px;
    font-size: 14px;
    padding: 10px 15px;
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

<!-- HEADER -->
<jsp:include page="header.jsp"/>

<!-- LOGIN FORM -->
<div class="login-wrapper">
    <div class="login-card">

        <div class="login-card-header">
            <h2>User Login</h2>
            <p class="mb-0">Welcome back to Wheels4U</p>
        </div>

        <div class="login-card-body">

            <!-- ERROR MESSAGE -->
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger text-center">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form action="userLoginServlet" method="post">
                <div class="mb-3">
                    <label class="form-label">Email Address</label>
                    <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
                </div>

                <button type="submit" class="btn login-btn w-100">Login</button>
            </form>

            <div class="login-footer">
                <p class="mt-3">
                    Don’t have an account?
                    <a href="register.jsp">Register here</a>
                </p>
            </div>

        </div>
    </div>
</div>

<!-- FOOTER -->
<jsp:include page="vehicleFooter.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
