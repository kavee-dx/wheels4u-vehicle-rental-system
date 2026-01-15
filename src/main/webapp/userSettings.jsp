<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String userName = (String) session.getAttribute("userName");
    String userContact = (String) session.getAttribute("userContact");
    String userEmail = (String) session.getAttribute("userEmail");

    if (userEmail == null) {
        response.sendRedirect("userLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Settings | Wheels4U</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    font-family: "Poppins", Arial, sans-serif;
    background: #f4f7fb;
}

.settings-card {
    max-width: 850px;
    margin: auto;
    background: #fff;
    border-radius: 18px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.12);
    overflow: hidden;
}

.settings-header {
    background: linear-gradient(135deg, #1E90FF, #187bcd);
    color: #fff;
    padding: 30px;
}

.settings-body {
    padding: 30px;
}

.section-title {
    font-weight: 700;
    color: #1e3c72;
    margin-bottom: 15px;
}

.form-control {
    border-radius: 10px;
    padding: 12px;
}

input[readonly] {
    background-color: #f1f3f5;
}

.save-btn {
    background: linear-gradient(135deg, #1E90FF, #187bcd);
    color: #fff;
    font-weight: 600;
    border-radius: 12px;
    padding: 12px 30px;
}

.alert {
    border-radius: 10px;
}

/* Password & field validation */
.validation-msg {
    font-size: 13px;
    margin-top: 4px;
}

.validation-msg.success {
    color: #28a745;
}

.validation-msg.error {
    color: #dc3545;
}

.form-control.valid {
    border: 2px solid #28a745;
}

.form-control.invalid {
    border: 2px solid #dc3545;
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

<div class="container my-5">
    <div class="settings-card">

        <div class="settings-header">
            <h2>Account Settings</h2>
            <p class="mb-0">Manage your profile & security</p>
        </div>

        <div class="settings-body">

            <!-- ALERT MESSAGES -->
            <% if ("1".equals(request.getParameter("success"))) { %>
                <div id="successMsg" class="alert alert-success">
                    Profile updated successfully!
                </div>
            <% } %>

            <% if ("required".equals(request.getParameter("error"))) { %>
                <div id="errorMsg" class="alert alert-danger">
                    Name and contact number are required!
                </div>
            <% } %>

            <% if ("password".equals(request.getParameter("error"))) { %>
                <div id="errorMsg" class="alert alert-danger">
                    Passwords do not match!
                </div>
            <% } %>

            <form id="settingsForm" action="<%=request.getContextPath()%>/userUpdateServlet" method="post" novalidate>

                <h4 class="section-title">👤 Personal Information</h4>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="fullName" name="fullName"
                               value="<%= userName != null ? userName : "" %>" required>
                        <div class="validation-msg" id="nameMsg"></div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Contact Number</label>
                        <input type="text" class="form-control" id="contactNumber" name="contactNumber"
                               value="<%= userContact != null ? userContact : "" %>" required>
                        <div class="validation-msg" id="contactMsg"></div>
                    </div>

                    <div class="col-md-12 mb-4">
                        <label class="form-label">Email Address</label>
                        <input type="email" class="form-control"
                               value="<%= userEmail %>" readonly>
                    </div>
                </div>

                <hr>

                <h4 class="section-title">🔐 Change Password</h4>
                <p class="text-muted">Leave blank if you don’t want to change password</p>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <input type="password" class="form-control" id="newPassword" name="newPassword"
                               placeholder="New password">
                        <div class="validation-msg" id="passwordMsg"></div>
                    </div>
                    <div class="col-md-6 mb-4">
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
                               placeholder="Confirm password">
                        <div class="validation-msg" id="confirmMsg"></div>
                    </div>
                </div>

                <div class="text-end">
                    <button type="submit" class="btn save-btn">
                        Save Changes
                    </button>
                </div>
            </form>

        </div>
    </div>
</div>

<jsp:include page="vehicleFooter.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
// ==================== AUTO DISAPPEAR ALERTS ====================
setTimeout(() => {
    const success = document.getElementById("successMsg");
    if(success) success.style.display = "none";

    const error = document.getElementById("errorMsg");
    if(error) error.style.display = "none";
}, 5000);

// ==================== FIELD VALIDATIONS ====================
const fullName = document.getElementById("fullName");
const contactNumber = document.getElementById("contactNumber");
const password = document.getElementById("newPassword");
const confirm = document.getElementById("confirmPassword");

const nameMsg = document.getElementById("nameMsg");
const contactMsg = document.getElementById("contactMsg");
const passwordMsg = document.getElementById("passwordMsg");
const confirmMsg = document.getElementById("confirmMsg");

function setStatus(input, msgEl, message, isValid){
    msgEl.textContent = message;
    msgEl.className = "validation-msg " + (isValid ? "success" : "error");
    input.classList.toggle("valid", isValid);
    input.classList.toggle("invalid", !isValid);
}

// Full Name Validation
fullName.addEventListener("input", ()=>{
    if(fullName.value.trim().length < 3){
        setStatus(fullName, nameMsg, "Name must be at least 3 characters", false);
    } else {
        setStatus(fullName, nameMsg, "Looks good!", true);
    }
});

// Contact Number Validation (Sri Lanka)
contactNumber.addEventListener("input", ()=>{
    const pattern = /^(07\d{8})$/;
    if(!pattern.test(contactNumber.value)){
        setStatus(contactNumber, contactMsg, "Enter valid Sri Lankan number (07XXXXXXXX)", false);
    } else {
        setStatus(contactNumber, contactMsg, "Valid contact number", true);
    }
});

// Password Validation
password.addEventListener("input", ()=>{
    const pattern = /^(?=.*\d).{8,}$/;
    if(password.value.length === 0){
        passwordMsg.textContent = "";
        password.classList.remove("valid","invalid");
    } else if(!pattern.test(password.value)){
        setStatus(password, passwordMsg, "At least 8 characters & 1 number", false);
    } else {
        setStatus(password, passwordMsg, "Valid password", true);
    }

    // Confirm password real-time match
    if(confirm.value.length > 0){
        if(confirm.value !== password.value){
            setStatus(confirm, confirmMsg, "Passwords do not match", false);
        } else {
            setStatus(confirm, confirmMsg, "Passwords match", true);
        }
    }
});

// Confirm Password Validation
confirm.addEventListener("input", ()=>{
    if(confirm.value !== password.value){
        setStatus(confirm, confirmMsg, "Passwords do not match", false);
    } else {
        setStatus(confirm, confirmMsg, "Passwords match", true);
    }
});

// Prevent form submit if invalid
document.getElementById("settingsForm").addEventListener("submit", e=>{
    if(document.querySelectorAll(".invalid").length > 0){
        e.preventDefault();
        alert("Please fix all errors before submitting.");
    }
});
</script>

</body>
</html>
