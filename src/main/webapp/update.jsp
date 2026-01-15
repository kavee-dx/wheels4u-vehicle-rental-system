<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Driver</title>
    <style>
        label { display: block; margin-top: 10px; }
        input, textarea { width: 100%; padding: 5px; margin-top: 5px; }
        .error { color: red; }
        img { max-width: 150px; display: block; margin-top: 10px; }
    </style>
</head>
<body>

<%
    String id = request.getParameter("id");
    String fullName = request.getParameter("fullName");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String licenseNumber = request.getParameter("licenseNumber");
    String vehicleAssigned = request.getParameter("vehicleAssigned");
    String address = request.getParameter("address");
    String password = request.getParameter("password");
    String licenseExpiryDate = request.getParameter("licenseExpiryDate");

    // Assuming you have a servlet like: ProfilePictureServlet?id=...
    String profilePictureURL = "ProfilePictureServlet?id=" + id;
%>

<form action="UpdateServlet" method="post" enctype="multipart/form-data">
    <label for="id">ID:</label>
    <input type="text" id="id" name="id" value="<%= id %>" readonly>

    <label for="fullName">Full Name:</label>
    <input type="text" id="fullName" name="fullName" value="<%= fullName %>" required>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="<%= email %>" required>

    <label for="phone">Phone:</label>
    <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" value="<%= phone %>" required>

    <label for="licenseNumber">License Number:</label>
    <input type="text" id="licenseNumber" name="licenseNumber" value="<%= licenseNumber %>" required>

    <label for="licenseExpiryDate">License Expiry Date:</label>
    <input type="date" id="licenseExpiryDate" name="licenseExpiryDate" value="<%= licenseExpiryDate %>" 
           min="<%= java.time.LocalDate.now() %>" required>

    <label for="vehicleAssigned">Vehicle Assigned:</label>
    <input type="text" id="vehicleAssigned" name="vehicleAssigned" value="<%= vehicleAssigned %>">

    <label for="address">Address:</label>
    <textarea id="address" name="address" rows="4"><%= address %></textarea>

    <label for="profilePicture">Current Profile Picture:</label>
    <img src="img/driverImage.webp" alt="Profile Picture" />

    <label for="profilePicture">Upload New Picture:</label>
    <input type="file" id="profilePicture" name="profilePicture" accept="image/*">

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" value="<%= password %>" required>

    <input type="submit" value="Update">
</form>

</body>
</html>
