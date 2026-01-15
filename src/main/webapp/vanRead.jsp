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
<button type="button" id="addnewbtn" onclick = "addnewvanconfirm()"> ADD NEW VAN </button>
</div>
<br><br>

	<script>
	//Confirm add a new van or not
	function addnewvanconfirm()
	{
    	var nvresult = confirm("Do you want to add a new van?");

    	if (nvresult) 
    	{
        	window.location.href = "vanInsert.jsp";
    	}

    	else
    	{
        	window.location.href = "vanGetallServlet";
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
            <th class="col1"> Van ID </th>
            <th class="col1"> Image </th>
            <th class="col1"> Van Name </th>
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
        
        <c:forEach var = "van" items = "${allVans}">
        <tr>
        	<td>${van.vanId}</td>
        	<td><img src = "vehiclepics/${van.vanimg}" alt = "Van Image" class = "van-img"></td>
        	<td>${van.vanName}</td>
        	<td>${van.brand}</td>
        	<td>${van.type}</td>
        	<td>${van.model}</td>
        	<td>${van.color}</td>
        	<td>${van.plateNumber}</td>
        	<td>${van.year}</td>
        	<td>${van.mileage}</td>
        	<td>${van.price}</td>
        	<td>${van.status}</td>
        	
        	<td>
        		<a href="vanUpdate.jsp?vanId=${van.vanId}&vanimg=${van.vanimg}&vanName=${van.vanName}&brand=${van.brand}&type=${van.type}&model=${van.model}&color=${van.color}&plateNumber=${van.plateNumber}&year=${van.year}&mileage=${van.mileage}&price=${van.price}&status=${van.status}">
        		<button id="updatebtn"> UPDATE </button>
        		</a>
        	</td>
        	
        	<td>
        		<form action = "vanDeleteServlet" method = "POST" onsubmit="return deletevanconfirm();">
        		<input type = "hidden" name = "vanId" value = "${van.vanId}" />
        		<button id="deletebtn" type="submit">DELETE</button>
        		</form>
        	</td>
        	
        </tr>
        </c:forEach>
        
      </table>
</div>


	<script>
	//Confirm delete the bike or not
	function deletevanconfirm()
	{
    	var dvresult = confirm("Do you want to delete this van?");

    	if (dvresult) 
    	{
        	return true;
        
    	}

    	else
    	{
       		alert("Deletion Cancelled !");
       	 	window.location.href = "vanGetallServlet";
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