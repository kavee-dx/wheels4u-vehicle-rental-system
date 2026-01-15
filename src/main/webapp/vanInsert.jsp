<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
     transform: translateX(-40px); /* 👈 move left */
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

<!--Add van form-->
<div class="vehicleContainer">

    <form class="addvehicleForm" action="vanInsertServlet" method="POST" enctype = "multipart/form-data">

    <h1 class="topic1"> Add New Van </h1>


		Van Image:
        <input type="file" name="vanimg" placeholder="Upload van image..." required>
        
        <br>

		Van Name: 
        <input type="text" name="vanName" placeholder="Enter van name..." required maxlength = "100">

        <br>


 		Van Brand:
        <input type="text" name="brand" placeholder="Enter van brand..." required maxlength = "50">

        <br>

        Van Type: 
        <input type="text" name="type" placeholder="Enter van type..." required maxlength = "50">

        <br>

        Van Model: 
        <input type="text" name="model" placeholder="Enter van model..." required maxlength = "50">

        <br>

        Color:
        <input type="text" name="color" placeholder="Enter van color" required maxlength = "50">

        <br>

        License Plate Number: 
        <input type="text" name="plateNumber" placeholder="e.g., ABC-1234" required maxlength = "50" pattern = "[A-Z0-9-]+" title = "Only capital letters, numbers, and dashes allowed (e.g., ABC-1234)" oninput = "this.value = this.value.toUpperCase();">

        <br>
        <br>

        Manufactured Year:
        <input type="number" name="year" placeholder="e.g., 2020" min ="1900" max = "2025" required pattern = "^\d{4}$" maxlength = "4" title = "Enter a 4-digit year (e.g., 2020). No letters or decimals allowed.">

        <br>
        <br>

        Mileage:
        <input type="text" name="mileage" placeholder="e.g., 4500.75" required pattern = "^\d{1,6}(\.\d{1,2})?$" maxlength = "9" title = "Enter the mileage with up to 6 digits before the decimal and up to 2 after. (e.g., 123456.78)." >

        <br>

        
        Price per Day (LKR):
        <input type="text" name="price" placeholder="e.g., 12500.00." required pattern = "^\d{1,10}(\.\d{1,2})?$" maxlength = "13" title ="Enter the rental price with up to 10 digits before the decimal and up to 2 after. (e.g., 12500.00)">

        <br>

        Status:
            <select name="status" required>
                <option value="Available" selected> Available </option>
                <option value = "Booked"> Booked </option>
            </select>

        <br>

        <input type="submit" value="ADD VEHICLE">
        <input type="reset" value="RESET">

    </form>
    
    <div class="backBtnWrapper">
    <a href="vanGetallServlet" class="backBtn">
        <i class="fa-solid fa-arrow-left"></i>
        Back
    </a>
</div>

</div>

<jsp:include page="vehicleFooter.jsp"/>

</body>
</html>