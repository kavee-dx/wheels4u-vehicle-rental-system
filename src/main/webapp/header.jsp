<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/vehiclescript.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css">

<style>

    .auth-button-inputs{
        display: flex;
        gap: 10px;
    }

    .auth-button-input{
        background-color: #000;
        color: #fff;
        font-size: 16px;
        padding: 8px 16px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .auth-button-input:hover{
        background-color: #333;
    }

    /* Active page styling */
    nav ul li a.active {
        background-color: #d1e0e0;
        font-weight: bold;
    }

    /* ================= MODAL ================= */
    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
        z-index: 1000;
    }

    .modal-content {
        background-color: white;
        padding: 25px;
        border-radius: 8px;
        text-align: center;
        width: 320px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        position: relative;
    }

    /* 🔵 LOGIN/ SIGNUP AS TITLE */
    .modal-content h2 {
        margin-top: 0;
        font-size: 26px;
        font-weight: 700;
        color: #0e1a40; /* dark blue */
        position: relative;
        margin-bottom: 25px;
    }

    .modal-content h2::after {
        content: "";
        width: 60px;
        height: 3px;
        background-color: #4b71ff;
        display: block;
        margin: 8px auto 0;
        border-radius: 5px;
    }

    /* ================= ROLE BUTTONS ================= */
    .role-btn {
        margin: 10px auto;
        padding: 12px 20px;
        font-size: 16px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        width: 85%;
        transition: all 0.3s ease;
        font-weight: 600;
    }

    /* 🟦 USER */
    .user-btn { 
        background: linear-gradient(135deg, #1e88e5, #1565c0);
        color: white; 
    }

    /* 🟨 DRIVER */
    .driver-btn { 
        background: linear-gradient(135deg, #ffca28, #ffb300);
        color: #222; 
    }

    /* 🟥 ADMIN */
    .admin-btn { 
        background: linear-gradient(135deg, #e53935, #c62828);
        color: white; 
    }

    .role-btn:hover { 
        transform: translateY(-3px);
        box-shadow: 0 6px 14px rgba(0,0,0,0.2);
        opacity: 0.95;
    }

    .close-btn {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 22px;
        cursor: pointer;
        background: none;
        border: none;
    }

    /* ================= LOGGED-IN USER MENU ================= */
    /* User menu buttons */
    .user-menu a {
        text-decoration: none;
        padding: 8px 12px;
        border-radius: 5px;
        color: #fff;
        font-weight: 600;
        transition: background-color 0.3s ease;
    }

    .user-menu a[href='userSetting.jsp'] {
        background-color: #28a745;
    }

    .user-menu a[href='userSetting.jsp']:hover {
        background-color: #218838;
    }

    .user-menu a[href='logoutServlet'] {
        background-color: #dc3545;
    }

    .user-menu a[href='logoutServlet']:hover {
        background-color: #c82333;
    }
    
    .user-menu .settings-btn {
    background-color: #28a745;
}

.user-menu .settings-btn:hover {
    background-color: #218838;
}
    
</style>
</head>

<body>

<header>
    <div class="container" style="display: flex; align-items: center; justify-content: space-between; position: relative;">
        <!-- Logo -->
        <div class="logo">
            <a href="#"><img src="vehiclepics/logo.png" alt="Logo"></a>
        </div>

        <!-- Navigation (centered absolutely) -->
        <nav style="position: absolute; left: 50%; transform: translateX(-50%);">
            <ul style="display: inline-flex; list-style: none; gap: 20px; padding: 0; margin: 0;">
                <li><a href="Home.jsp" id="home-link">Home</a></li>
                <li><a href="about.jsp" id="about-link">About</a></li>
                <li><a href="reservation.jsp" id="vehicles-link">Vehicles</a></li>
                <li><a href="vRequest.jsp" id="reserve-link">Reserve</a></li> 
                <li><a href="ManageContactCreate.jsp" id="contact-link">Contact Us</a></li>
            </ul>
        </nav>

        <!-- Auth / User Menu (far right) -->
        <div style="display: flex; align-items: center; gap: 10px; margin-left: auto; transform: translateX(30%);">
            <% 
                String userName = (String) session.getAttribute("userName");
                if (userName != null) { 
            %>
                <div class="user-menu" style="display: flex; align-items: center; gap: 10px;">
                    <span>Hi, <%= userName %></span>
                   
                    <a href="<%=request.getContextPath()%>/userSettings" class="settings-btn">Settings</a>

                    
                    <a href="logoutServlet">Logout</a>
                </div>
            <% } else { %>
                <div class="auth-button-inputs">
                    <button onclick="showSignupModal()" class="auth-button-input">Sign Up</button>
                    <button onclick="showRoleModal()" class="auth-button-input">Log In</button>
                </div>
            <% } %>
        </div>
    </div>
</header>

<!-- ================= LOGIN ROLE MODAL ================= -->
<div id="roleModal" class="modal">
    <div class="modal-content">
        <button class="close-btn" onclick="closeModal()">&times;</button>
        <h2>Login As</h2>

        <button class="role-btn user-btn" onclick="selectRole('User')">
            User / Customer
        </button>

        <button class="role-btn driver-btn" onclick="selectRole('Driver')">
            Driver
        </button>

        <button class="role-btn admin-btn" onclick="selectRole('Admin')">
            Administrator
        </button>
    </div>
</div>

<!-- ================= SIGNUP ROLE MODAL ================= -->
<div id="signupModal" class="modal">
    <div class="modal-content">
        <button class="close-btn" onclick="closeSignupModal()">&times;</button>
        <h2>Sign Up As</h2>

        <button class="role-btn user-btn" onclick="window.location.href='register.jsp'">
            User / Customer
        </button>

        <button class="role-btn driver-btn" onclick="window.location.href='driverInsert.jsp'">
            Driver
        </button>
    </div>
</div>

<script>
    // Login Modal
    function showRoleModal() {
        document.getElementById('roleModal').style.display = 'flex';
    }

    function closeModal() {
        document.getElementById('roleModal').style.display = 'none';
    }

    function selectRole(role) {
        closeModal();
        switch(role) {
            case 'User':
                window.location.href = 'userLogin.jsp';
                break;
            case 'Driver':
                window.location.href = 'login.jsp';
                break;
            case 'Admin':
                window.location.href = 'adminlogin.jsp';
                break;
        }
    }

    // Signup Modal
    function showSignupModal() {
        document.getElementById('signupModal').style.display = 'flex';
    }

    function closeSignupModal() {
        document.getElementById('signupModal').style.display = 'none';
    }

    // Close modals when clicking outside
    window.onclick = function(event) {
        const roleModal = document.getElementById('roleModal');
        const signupModal = document.getElementById('signupModal');
        if (event.target === roleModal) roleModal.style.display = 'none';
        if (event.target === signupModal) signupModal.style.display = 'none';
    }

    // Set active navigation link
    document.addEventListener('DOMContentLoaded', function() {
        const currentPage = window.location.pathname.split('/').pop();
        const links = {
            'Home.jsp': 'home-link',
            'about.jsp': 'about-link',
            'reservation.jsp': 'vehicles-link',
            'vRequest.jsp': 'reserve-link',
            'ManageContactCreate.jsp': 'contact-link'
        };
        if (links[currentPage]) {
            document.getElementById(links[currentPage]).classList.add('active');
        }
    });
</script>

</body>
</html>
