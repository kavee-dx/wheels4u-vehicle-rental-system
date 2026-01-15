<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src = "js/vehiclescript.js"></script>
<link rel ="stylesheet" type="text/css" href = "css/style.css">

<style>

 /*search bar design*/
   
   .search-container {
  		text-align: left;
  		margin-top: -15px;
  		margin-bottom: 25px;
  		margin-left: 20px;
	}

#searchInput {
  width: 450px;
  padding: 10px 15px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 25px;
  outline: none;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  transition: all 0.3s ease;
}

#searchInput:focus {
  border-color: #007BFF;
  box-shadow: 0 0 8px rgba(0,123,255,0.2);
}
  
</style>


</head>

<jsp:include page="vehicleHeader.jsp"/>
<body>

<br>
<div class = "buttonback">
<a href="vehiclesButton.jsp" id="back-button"> Back to Manage Vehicles</a>
</div>

<br>
<div class = "buttonaddnew">
<button type="button" id="addnewbtn" onclick = "addnewbikeconfirm()"> ADD NEW BIKE </button>
</div>
<br><br>

	<script>
	//Confirm add a new bike or not
	function addnewbikeconfirm()
	{
    	var nbresult = confirm("Do you want to add a new bike?");

    	if (nbresult) 
    	{
        	window.location.href = "bikeInsert.jsp";
    	}

    	else
    	{
        	window.location.href = "bikeGetallServlet";
    	}
	}
	</script>


<!-- Search Bar -->
<div class="search-container">
  <input type="text" id="searchInput" placeholder="Search for bikes..." />
</div>



<div class = "datatable">
    <table>
        <tr>
            <th class="col1"> Bike ID </th>
            <th class="col1"> Image </th>
            <th class="col1"> Bike Name </th>
            <th class="col1"> Brand </th>
            <th class="col1"> Type </th>
            <th class="col1"> Model </th>
            <th class="col1"> Color </th>
            <th class="col1"> Plate Number </th>
            <th class="col1"> Year </th>
            <th class="col1"> Mileage </th>
            <th class="col1"> Price/per day </th>
            <th class="col1"> Status </th>
            <th colspan="2" class="col1"> Action </th>
        </tr>
        
        <c:forEach var = "bike" items = "${allBikes}">
        <tr>
        	<td>${bike.bikeId}</td>
        	<td><img src = "vehiclepics/${bike.bikeimg}" alt = "Bike Image" class = "bike-img"></td>
        	<td>${bike.bikeName}</td>
        	<td>${bike.brand}</td>
        	<td>${bike.type}</td>
        	<td>${bike.model}</td>
        	<td>${bike.color}</td>
        	<td>${bike.plateNumber}</td>
        	<td>${bike.year}</td>
        	<td>${bike.mileage}</td>
        	<td>${bike.price}</td>
        	<td>${bike.status}</td>
        	
        	<td>
        		<a href="bikeUpdate.jsp?bikeId=${bike.bikeId}&bikeimg=${bike.bikeimg}&bikeName=${bike.bikeName}&brand=${bike.brand}&type=${bike.type}&model=${bike.model}&color=${bike.color}&plateNumber=${bike.plateNumber}&year=${bike.year}&mileage=${bike.mileage}&price=${bike.price}&status=${bike.status}">
        		<button id="updatebtn"> UPDATE </button>
        		</a>
        	</td>
        	
        	<td>
        		<form action = "bikeDeleteServlet" method = "POST" onsubmit="return deletebikeconfirm();">
        		<input type = "hidden" name = "bikeId" value = "${bike.bikeId}" />
        		<button id="deletebtn" type="submit">DELETE</button>
        		</form>
        	</td>
        	
        </tr>
        </c:forEach>
        
      </table>
</div>


	<script>
	//Confirm delete the bike or not
	function deletebikeconfirm()
	{
    	var dbresult = confirm("Do you want to delete this bike?");

    	if (dbresult) 
    	{
        	return true;
        
    	}

    	else
    	{
       		alert("Deletion Cancelled !");
       	 	window.location.href = "bikeGetallServlet";
			return false;
    	}
	}
	
	</script>

<script>

function filterTable() {
	  var input = document.getElementById("searchInput");
	  var filter = input.value.toUpperCase();
	  var table = document.querySelector("table");
	  var tr = table.getElementsByTagName("tr");

	  for (var i = 1; i < tr.length; i++) { // Skip header
	    var td = tr[i].getElementsByTagName("td");
	    var rowMatch = false;
	    for (var j = 0; j < td.length; j++) {
	      if (td[j]) {
	        var txtValue = td[j].textContent || td[j].innerText;
	        if (txtValue.toUpperCase().indexOf(filter) > -1) {
	          rowMatch = true;
	          break;
	        }
	      }
	    }
	    tr[i].style.display = rowMatch ? "" : "none";
	  }
	}

	document.getElementById("searchInput").addEventListener("input", filterTable);

</script>

<jsp:include page="vehicleFooter.jsp"/>

</body>
</html>