<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Vehicles</title>

<script src = "js/vehiclescript.js"> </script>


<style>
/* Specific to vehicle box in vehicle manage page*/

.maincontent_box {
			flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
          
      	
}

.vehicle-box {
	width: 700px;
	height: 420px;
    background: #040720;
    padding: 30px 40px;
    border-radius: 15px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
    text-align: center;
    color: white;
}

.vehicle-box h2 {
    margin-bottom: 20px;
    font-size: 30px;
    color: white;
}

.vehicle-button {
    display: block;
    width: 350px;
    margin: 25px auto;
    padding: 15px 20px;
    background-color: #004494;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 18px;
    cursor: pointer;
    transition: background-color 0.3s;
    text-decoration: none;
}

.vehicle-button:hover {
    background-color: #3090c7;
}


</style>


</head>


<body>
<jsp:include page="vehicleHeader.jsp"/>

<img src = "vehiclepics/R2.jpeg" style="background-repeat: no-repeat; position: absolute; width: 100%; height: 100%; object-fit: cover; z-index:-1;" alt="background image" >

<div class="maincontent_box">
<div class="vehicle-box">
        <h2>Manage Vehicles</h2>
        <button onclick="location.href='carGetallServlet'" class="vehicle-button">Manage Cars</button>
        <button onclick="location.href='bikeGetallServlet'" class="vehicle-button">Manage Motor Bikes</button>
        <button onclick="location.href='vanGetallServlet'" class="vehicle-button">Manage Vans</button>
        <button onclick="location.href='busGetallServlet'" class="vehicle-button">Manage Buses</button>
      
      
    </div>
 </div>

<jsp:include page="vehicleFooter.jsp" />

</body>
</html>