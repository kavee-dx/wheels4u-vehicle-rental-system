<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        .get-started-btn {
            padding: 15px 30px;
            font-size: 18px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .get-started-btn:hover {
            background-color: #45a049;
        }
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
        }
        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
            width: 300px;
        }
        .modal-content h2 {
            margin-top: 0;
        }
        .role-btn {
            margin: 10px;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 80%;
        }
        .user-btn { background-color: #2196F3; color: white; }
        .driver-btn { background-color: #FFC107; color: black; }
        .admin-btn { background-color: #F44336; color: white; }
        .role-btn:hover { opacity: 0.9; }
    </style>
</head>
<body>
    <button class="get-started-btn" onclick="showRoleModal()">Get Started</button>

    <div id="roleModal" class="modal">
        <div class="modal-content">
            <h2>Are you?</h2>
            <button class="role-btn user-btn" onclick="selectRole('User')">User</button>
            <button class="role-btn driver-btn" onclick="selectRole('Driver')">Driver</button>
            <button class="role-btn admin-btn" onclick="selectRole('Admin')">Admin</button>
        </div>
    </div>

    <script>
        function showRoleModal() {
            document.getElementById('roleModal').style.display = 'flex';
        }

        function selectRole(role) {
            alert('Selected role: ' + role);
            document.getElementById('roleModal').style.display = 'none';
            // Add logic to redirect or perform actions based on role
            // For example:
            // if (role === 'User') window.location.href = 'userDashboard.jsp';
            // if (role === 'Driver') window.location.href = 'driverDashboard.jsp';
            // if (role === 'Admin') window.location.href = 'adminDashboard.jsp';
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('roleModal');
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        }
    </script>


</body>
</html>