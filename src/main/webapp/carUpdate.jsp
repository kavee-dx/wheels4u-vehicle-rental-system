<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="java.math.BigDecimal" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src = "js/vehiclescript.js"> </script>
<link rel ="stylesheet" type="text/css" href = "css/style.css">
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


<style>
/* Back button wrapper inside form */
.backBtnWrapper {
    width: 100%;
    display: flex;
    justify-content: flex-end;  /* right side */
    margin-top: 20px;
}

/* Back button style */
.backBtn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;

    background-color: #6c757d;
    color: #ffffff;

    padding: 10px 0;
    font-size: 14px;
    font-weight: 600;

    width: 80%;              /* 👈 smaller than RESET */
    max-width: 240px;        /* 👈 optional limit */

    border-radius: 6px;
    text-decoration: none;

    transition: all 0.3s ease;
}

.backBtnWrapper {
    width: 100%;
    display: flex;
    justify-content: center;
    margin-top: 8px;   /* closer to RESET */
     transform: translateX(-80px); /* 👈 move left */
}


/* Hover effect */
.backBtn:hover {
    background-color: #495057;
    transform: translateY(-2px);
}

/* Icon size */
.backBtn i {
    font-size: 14px;
}

/* Click effect */
.backBtn:active {
    transform: scale(0.96);
}


</style>

</head>
<jsp:include page="vehicleHeader.jsp"/>
<body>

<%
		//Retrieve parameters from the request
		
   		String carId = request.getParameter("carId");
		String carimg = request.getParameter("carimg");
    	String carName = request.getParameter("carName");
    	String brand = request.getParameter("brand");
    	String type = request.getParameter("type");
    	String model = request.getParameter("model");
    	String color = request.getParameter("color");
    	String plateNumber = request.getParameter("plateNumber");
    	int year = Integer.parseInt(request.getParameter("year"));
      	BigDecimal mileage = new BigDecimal(request.getParameter("mileage"));  
      	BigDecimal price = new BigDecimal(request.getParameter("price"));
      	String status = request.getParameter("status");

	%>


	<!--Update vehicle form-->
<div class="vehicleContainer">

    <form class="updatevehicleForm" action="carUpdateServlet" method="POST" enctype = "multipart/form-data">

    <h1 class="topic1"> Update Car Information </h1>
    
    	
    	Car ID: 
    	<input type="text" name="carId" value="<%=carId%>" readonly>
    	
    	<br>
    	
    	<!-- Show current car image -->
    	Current Car Image:<br>
    	<img src="vehiclepics/<%=carimg%>" alt="Car Image" width="150" height="100" style="object-fit: cover; border: 1px solid #ccc;"><br><br>

    	<!-- File input to upload new image -->
    	<label>Change Car Image:</label>
    	<input type="file" name="newcarimg" accept="image/*"><br><br>

    	<!-- Hidden input to keep old image if no new image uploaded -->
    	<input type="hidden" name="oldcarimg" value="<%=carimg%>">
    	

    	<!-- other form fields... -->
    	
    	<br>

		Car Name: 
        <input type="text" name="carName" value="<%=carName%>" placeholder="Enter car name..." required maxlength = "100">

        <br>

 		Car Brand:
        <input type="text" name="brand" value="<%=brand%>" placeholder="Enter car brand..." required maxlength = "50">

        <br>

        Car Type: 
        <input type="text" name="type" value="<%=type%>" placeholder="Enter car type..." required maxlength = "50">

        <br>

        Car Model: 
        <input type="text" name="model" value="<%=model%>" placeholder="Enter car model..." required maxlength = "50">

        <br>

        Color:
        <input type="text" name="color" value="<%=color%>" placeholder="Enter car color" required maxlength = "50">

        <br>

        License Plate Number: 
        <input type="text" name="plateNumber" value="<%=plateNumber%>" placeholder="e.g., ABC-1234" required maxlength = "50" pattern = "[A-Z0-9-]+" title = "Only capital letters, numbers, and dashes allowed (e.g., ABC-1234)" oninput = "this.value = this.value.toUpperCase();">

        <br>
        <br>

        Manufactured Year:
        <input type="number" name="year" value="<%=year%>" placeholder="e.g., 2020" min ="1900" max = "2025" required pattern = "^\d{4}$" maxlength = "4" title = "Enter a 4-digit year (e.g., 2020). No letters or decimals allowed.">

        <br>
        <br>

        Mileage:
        <input type="text" name="mileage" value="<%=mileage%>" placeholder="e.g., 4500.75" required pattern = "^\d{1,6}(\.\d{1,2})?$" maxlength = "9" title = "Enter the mileage with up to 6 digits before the decimal and up to 2 after. (e.g., 123456.78)." >

        <br>
        
        Price per Day (LKR):
        <input type="text" name="price" value="<%=price%>" placeholder="e.g., 12500.00." required pattern = "^\d{1,10}(\.\d{1,2})?$" maxlength = "13" title ="Enter the rental price with up to 10 digits before the decimal and up to 2 after. (e.g., 12500.00)">

        <br>

        Status:
            <select name="status" required>
    			<option value="Available" <%= "Available".equals(status) ? "selected" : "" %>>Available</option>
    			<option value="Booked" <%= "Booked".equals(status) ? "selected" : "" %>>Booked</option>
			</select>

        <br>

        <input type="submit" id="submitbtn" name = "upbtn" value="UPDATE VEHICLE">

    </form>
    <div class="backBtnWrapper">
    <a href="carGetallServlet" class="backBtn">
        <i class="fa-solid fa-arrow-left"></i>
        Back
    </a>
</div>
    

</div>
	
<jsp:include page="vehicleFooter.jsp"/>


</body>
</html>