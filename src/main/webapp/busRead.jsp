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
<button type="button" id="addnewbtn" onclick = "addnewbusconfirm()"> ADD NEW BUS </button>
</div>
<br><br>

	<script>
	//Confirm add a new bus or not
	function addnewbusconfirm()
	{
    	var nsresult = confirm("Do you want to add a new bus?");

    	if (nsresult) 
    	{
        	window.location.href = "busInsert.jsp";
    	}

    	else
    	{
        	window.location.href = "busGetallServlet";
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
            <th class="col1"> Bus ID </th>
            <th class="col1"> Image </th>
            <th class="col1"> Bus Name </th>
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
        
        <c:forEach var = "bus" items = "${allBuses}">
        <tr>
        	<td>${bus.busId}</td>
        	<td><img src = "vehiclepics/${bus.busimg}" alt = "Bus Image" class = "bus-img"></td>
        	<td>${bus.busName}</td>
        	<td>${bus.brand}</td>
        	<td>${bus.type}</td>
        	<td>${bus.model}</td>
        	<td>${bus.color}</td>
        	<td>${bus.plateNumber}</td>
        	<td>${bus.year}</td>
        	<td>${bus.mileage}</td>
        	<td>${bus.price}</td>
        	<td>${bus.status}</td>
        	
        	<td>
        		<a href="busUpdate.jsp?busId=${bus.busId}&busimg=${bus.busimg}&busName=${bus.busName}&brand=${bus.brand}&type=${bus.type}&model=${bus.model}&color=${bus.color}&plateNumber=${bus.plateNumber}&year=${bus.year}&mileage=${bus.mileage}&price=${bus.price}&status=${bus.status}">
        		<button id="updatebtn"> UPDATE </button>
        		</a>
        	</td>
        	
        	<td>
        		<form action = "busDeleteServlet" method = "POST" onsubmit="return deletebusconfirm();">
        		<input type = "hidden" name = "busId" value = "${bus.busId}" />
        		<button id="deletebtn" type="submit">DELETE</button>
        		</form>
        	</td>
        	
        </tr>
        </c:forEach>
        
      </table>
</div>


	<script>
	//Confirm delete the bus or not
	function deletebusconfirm()
	{
    	var dsresult = confirm("Do you want to delete this bus?");

    	if (dsresult) 
    	{
        	return true;
        
    	}

    	else
    	{
       		alert("Deletion Cancelled !");
       	 	window.location.href = "busGetallServlet";
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