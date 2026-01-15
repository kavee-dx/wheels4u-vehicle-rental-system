<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register | Wheels4U</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
/* =================== GLOBAL =================== */
body {
    font-family: "Poppins", Arial, sans-serif;
    background-color: #f7fafa;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* =================== REGISTER WRAPPER =================== */
.register-wrapper {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 50px 15px;
}

/* =================== CARD =================== */
.register-card {
    width: 100%;
    max-width: 500px;
    background: #ffffff;
    border-radius: 16px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.15);
    overflow: hidden;
}

/* =================== HEADER =================== */
.register-header {
    background: linear-gradient(135deg, #1E90FF, #187bcd);
    color: #fff;
    padding: 25px;
    text-align: center;
}

.register-header h2 {
    margin: 0;
    font-weight: 700;
    font-size: 26px;
}

.register-header p {
    margin: 5px 0 0 0;
    font-size: 14px;
    font-weight: 400;
}

/* =================== BODY =================== */
.register-body {
    padding: 30px;
}

/* =================== INPUTS =================== */
.form-control {
    border-radius: 10px;
    padding: 12px;
}

.form-control.valid {
    border: 2px solid #28a745;
}

.form-control.invalid {
    border: 2px solid #dc3545;
}

.validation-msg {
    font-size: 13px;
    margin-top: 4px;
}

.validation-msg.error {
    color: #dc3545;
}

.validation-msg.success {
    color: #28a745;
}

/* =================== BUTTON =================== */
.register-btn {
    background: linear-gradient(135deg, #1E90FF, #187bcd);
    border: none;
    border-radius: 10px;
    padding: 12px;
    font-size: 16px;
    font-weight: 600;
    transition: transform 0.2s, box-shadow 0.2s;
}

.register-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(30,144,255,0.4);
}

/* =================== FOOTER =================== */
.register-footer {
    text-align: center;
    margin-top: 20px;
    font-size: 14px;
}
.register-footer a {
    color: #1E90FF;
    font-weight: 600;
}
.register-footer a:hover {
    text-decoration: underline;
}

/* =================== ALERTS =================== */
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

<!-- REGISTER FORM -->
<div class="register-wrapper">
    <div class="register-card">

        <div class="register-header">
            <h2>Create Account</h2>
            <p>Join Wheels4U today</p>
        </div>

        <div class="register-body">

            <!-- SUCCESS MESSAGE -->
            <% if (request.getAttribute("success") != null) { %>
                <div class="alert alert-success text-center">
                    <%= request.getAttribute("success") %><br>
                    Redirecting to login page...
                </div>
                <script>
                    setTimeout(() => {
                        window.location.href = "userLogin.jsp";
                    }, 3000);
                </script>
            <% } %>

            <!-- ERROR MESSAGE -->
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger text-center">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

          <form id="registerForm" action="<%= request.getContextPath() %>/userInsertServlet" method="post" novalidate>



                <!-- Full Name -->
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter your full name">
                    <div class="validation-msg" id="nameMsg"></div>
                </div>

                <!-- Contact -->
                <div class="mb-3">
                    <label class="form-label">Contact Number</label>
                    <input type="text" class="form-control" id="contact" name="contactNumber" placeholder="07XXXXXXXX">
                    <div class="validation-msg" id="contactMsg"></div>
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label class="form-label">Email Address</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="example@mail.com">
                    <div class="validation-msg" id="emailMsg"></div>
                </div>

                <!-- Password -->
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="At least 8 characters & 1 number">
                    <div class="validation-msg" id="passwordMsg"></div>
                </div>

                <!-- Confirm Password -->
                <div class="mb-3">
                    <label class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Re-enter your password">
                    <div class="validation-msg" id="confirmMsg"></div>
                </div>

                <button type="submit" class="btn register-btn w-100">Register</button>
            </form>

            <div class="register-footer">
                Already have an account? <a href="userLogin.jsp">Login here</a>
            </div>

        </div>
    </div>
</div>

<!-- VALIDATION SCRIPT -->
<script>
const form = document.getElementById("registerForm");
const nameInput = document.getElementById("fullName");
const contactInput = document.getElementById("contact");
const emailInput = document.getElementById("email");
const passwordInput = document.getElementById("password");
const confirmInput = document.getElementById("confirmPassword");

function setStatus(input, msgEl, message, isValid) {
    msgEl.textContent = message;
    msgEl.className = "validation-msg " + (isValid ? "success" : "error");
    input.classList.toggle("valid", isValid);
    input.classList.toggle("invalid", !isValid);
}

/* Full Name Validation */
nameInput.addEventListener("input", () => {
    const msg = document.getElementById("nameMsg");
    if (nameInput.value.trim().length < 3) {
        setStatus(nameInput, msg, "Name must be at least 3 characters", false);
    } else {
        setStatus(nameInput, msg, "Looks good!", true);
    }
});

/* Contact Validation (Sri Lanka) */
contactInput.addEventListener("input", () => {
    const msg = document.getElementById("contactMsg");
    const pattern = /^(07\d{8})$/;
    if (!pattern.test(contactInput.value)) {
        setStatus(contactInput, msg, "Enter valid Sri Lankan number (07XXXXXXXX)", false);
    } else {
        setStatus(contactInput, msg, "Valid contact number", true);
    }
});

/* Email Validation */
emailInput.addEventListener("input", () => {
    const msg = document.getElementById("emailMsg");
    const pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!pattern.test(emailInput.value)) {
        setStatus(emailInput, msg, "Invalid email address", false);
    } else {
        setStatus(emailInput, msg, "Email looks good", true);
    }
});

/* Password Validation */
passwordInput.addEventListener("input", () => {
    const msg = document.getElementById("passwordMsg");
    const pattern = /^(?=.*\d).{8,}$/;
    if (!pattern.test(passwordInput.value)) {
        setStatus(passwordInput, msg, "Minimum 8 chars & 1 number", false);
    } else {
        setStatus(passwordInput, msg, "Strong password", true);
    }

    // Also check confirm password in real-time
    if (confirmInput.value.length > 0) {
        if (confirmInput.value !== passwordInput.value) {
            setStatus(confirmInput, document.getElementById("confirmMsg"), "Passwords do not match", false);
        } else {
            setStatus(confirmInput, document.getElementById("confirmMsg"), "Passwords match", true);
        }
    }
});

/* Confirm Password Validation */
confirmInput.addEventListener("input", () => {
    const msg = document.getElementById("confirmMsg");
    if (confirmInput.value !== passwordInput.value) {
        setStatus(confirmInput, msg, "Passwords do not match", false);
    } else {
        setStatus(confirmInput, msg, "Passwords match", true);
    }
});

/* Form submit check */
form.addEventListener("submit", e => {
    if (document.querySelectorAll(".invalid").length > 0) {
        e.preventDefault();
        alert("Please fix errors before submitting.");
    }
});
</script>

<!-- FOOTER -->
<jsp:include page="vehicleFooter.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
