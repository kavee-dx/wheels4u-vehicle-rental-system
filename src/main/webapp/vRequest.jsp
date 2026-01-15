<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Make a Vehicle Request - Wheels4U</title>
<link rel="stylesheet" type="text/css" href="css/style.css">

<style>
/* Reset and Base Styles */
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: 'Poppins', Arial, sans-serif;
    background: linear-gradient(to right, #e0f2ff, #f5f9ff);
    color: #1e3a8a;
    min-height: 100vh;
}

/* Main Container */
.vehiclerequestContainer {
    margin: 50px auto;
    width: 85%;
    max-width: 900px;
    background: linear-gradient(145deg, #1e3a8a, #3b5ac6);
    border-radius: 20px;
    padding: 40px 50px;
    box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
    color: #ffffff;
}

/* Page Title */
.topic1 {
    font-size: 36px;
    text-align: center;
    padding-bottom: 20px;
    margin-bottom: 35px;
    border-bottom: 2px solid rgba(255,255,255,0.3);
    font-weight: 600;
}

/* Form Styling */
.addrequestForm {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

/* Form Labels */
.form-group {
    margin-bottom: 20px;
}

.form-label {
    display: block;
    font-size: 18px;       /* Bigger font */
    font-weight: 700;      /* Bold */
    color: #e0f2ff;        /* Light color for contrast */
    margin-bottom: 8px;
    letter-spacing: 0.5px;
}


/* Form Inputs */
input[type=text], input[type=tel], input[type=date], input[type=time], input[type=number], select {
    width: 100%;
    padding: 14px 20px;
    border: 2px solid #90caf9;
    border-radius: 10px;
    font-size: 16px;
    background-color: #ffffff;
    color: #1e3a8a;
    transition: all 0.3s ease;
}

input[type=text]:focus, input[type=tel]:focus, input[type=date]:focus, input[type=time]:focus, input[type=number]:focus, select:focus {
    border-color: #64b5f6;
    box-shadow: 0 0 0 4px rgba(100, 181, 246, 0.25);
    outline: none;
}

/* Vehicle Selection */
.vehicle-selection label.form-label {
    color: #e0f2ff;
    font-weight: 600;
}

/* Vehicle Cards */
.vehicle-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    margin-top: 15px;
    justify-content: center;
}

.vehicle-card {
    border-radius: 12px;
    overflow: hidden;
    width: 220px;
    background: linear-gradient(135deg, #e3f2fd, #bbdefb);
    padding: 15px;
    text-align: center;
    transition: transform 0.3s, box-shadow 0.3s;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

.vehicle-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

.vehicle-card img {
    width: 100%;
    height: 130px;
    object-fit: cover;
    border-radius: 8px;
    margin-bottom: 10px;
}

.vehicle-card p {
    margin: 8px 0;
    font-size: 14px;
    color: #1e3a8a;
}

.vehicle-card strong {
    color: #0d47a1;
}

.vehicle-card input[type=radio] {
    margin-top: 10px;
}

/* Submit & Reset Buttons */
input[type=submit], input[type=reset] {
    width: 48%;
    padding: 15px 0;
    font-size: 18px;
    font-weight: 600;
    border-radius: 10px;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease;
}

input[type=submit] {
    background: linear-gradient(135deg, #06b6d4, #0ea5e9);
    color: #ffffff;
}

input[type=submit]:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 20px rgba(14, 165, 233, 0.4);
}

input[type=reset] {
    background-color: #f0f0f0;
    color: #333;
    border: 2px solid #ddd;
}

input[type=reset]:hover {
    background-color: #e0e0e0;
}

/* Button Container */
.form-buttons {
    text-align: center;
    margin-top: 20px;
}

/* Responsive */
@media (max-width: 768px) {
    .vehiclerequestContainer {
        width: 95%;
        padding: 30px 25px;
    }
    
    .topic1 {
        font-size: 28px;
    }
    
    .vehicle-card {
        width: 100%;
        max-width: 280px;
    }
    
    input[type=submit], input[type=reset] {
        width: 90%;
        margin: 10px 0;
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

<!-- Make a request form -->
<div class="vehiclerequestContainer">

    <form class="addrequestForm" action="SubmitVehicleRequest" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">

    <h1 class="topic1">Make a Vehicle Request</h1>

    <div class="form-group">
        <label class="form-label">First Name:</label>
        <input type="text" name="firstName" placeholder="Enter your first name..." required maxlength="100">
    </div>

    <div class="form-group">
        <label class="form-label">Last Name:</label>
        <input type="text" name="lastName" placeholder="Enter your last name..." required maxlength="100">
    </div>

    <div class="form-group">
        <label class="form-label">Phone Number:</label>
        <input type="tel" name="phone" id="phone" required pattern="0[0-9]{9}" title="Enter a valid 10-digit Sri Lankan phone number starting with 0">
    </div>

    <div class="vehicle-selection">
        <label class="form-label" for="vehicleType">Select Vehicle Type:</label>
        <select id="vehicleType" name="vehicleType" onchange="fetchVehicles()" required>
            <option value="">-- Select Type --</option>
            <option value="car">Car</option>
            <option value="bus">Bus</option>
            <option value="van">Van</option>
            <option value="motorbike">Motor Bike</option>
        </select>

        <div id="vehicleContainer" class="vehicle-container">
            <!-- Vehicle cards will appear here dynamically -->
        </div>
    </div>

    <div class="form-group">
        <label class="form-label">Pick-Up Date:</label>
        <input type="date" name="pickupDate" id="pickupDate" required>
    </div>

    <div class="form-group">
        <label class="form-label">Pick-Up Time:</label>
        <input type="time" name="pickupTime" id="pickupTime" required>
    </div>

    <div class="form-group">
        <label class="form-label">For how many days do you need?:</label>
        <input type="number" name="numDays" id="days" min="1" max="30" required>
    </div>

    <div class="form-buttons">
        <input type="submit" value="SUBMIT REQUEST">
        <input type="reset" value="RESET">
    </div>

    </form>
</div>

<script>
function fetchVehicles() {
  const type = document.getElementById("vehicleType").value;
  fetch("GetVehiclesByType?type=" + type)
    .then(response => response.json())
    .then(data => {
      const container = document.getElementById("vehicleContainer");
      container.innerHTML = "";

      if (data.length === 0) {
        container.innerHTML = "<p>No vehicles available.</p>";
        return;
      }

      data.forEach(vehicle => {
        const card = document.createElement("div");
        card.className = "vehicle-card";
        card.innerHTML = 
          '<img src="' + vehicle.imageUrl + '" alt="' + vehicle.name + '">' +
          '<p><strong>ID:</strong> ' + vehicle.vehicleId + '</p>' +
          '<p><strong>Name:</strong> ' + vehicle.name + '</p>' +
          '<p><strong>Model:</strong> ' + vehicle.model + '</p>' +
          '<p><strong>Price/Day:</strong> $' + vehicle.pricePerDay + '</p>' +
          '<label>' +
            '<input type="radio" name="selectedVehicleId" value="' + vehicle.vehicleId + '" required>' +
            'Select' +
          '</label>';
        container.appendChild(card);
      });
    })
    .catch(error => console.error("Error fetching vehicles:", error));
}

function validateForm() {
    const pickupDate = new Date(document.getElementById("pickupDate").value);
    const today = new Date();
    today.setHours(0,0,0,0);

    if (pickupDate < today) {
      alert("Pickup date cannot be in the past.");
      return false;
    }
    return true;
}
</script>

<jsp:include page="vehicleFooter.jsp"/>
</body>
</html>
