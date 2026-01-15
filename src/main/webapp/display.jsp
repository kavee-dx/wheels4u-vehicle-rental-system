<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        body {
            background-color: #d3d3d3; /* Ash-like light gray */
            font-family: Arial, sans-serif;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }

        th, td {
            border: 1px solid #888;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #555;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        button {
            padding: 6px 12px;
            margin: 2px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        form {
            display: inline;
        }
    </style>
 </head>
 <body>
 <h2>Product table</h2>
 <table>
       <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>License Number</th>
            <th>License_Expiry_Date</th>
            <th>Vehicle Assigned</th>
            <th>Address</th>
            <th>Profile Picture</th>
            <th>Password</th>
             <th>Action</th>
        </tr>
       
     <c:forEach var="vehicle" items="${allvehicles}">
      <tr>
                <td>${vehicle.id}</td>
                <td>${vehicle.fullName}</td>
                <td>${vehicle.email}</td>
                <td>${vehicle.phone}</td>
                <td>${vehicle.licenseNumber}</td>
                <td>${vehicle.licenseExpiryDate}</td>
                <td>${vehicle.vehicleAssigned}</td>
                <td>${vehicle.address}</td>
                <td><img src="${pageContext.request.contextPath}/ProfilePictureServlet?id=${vehicle.id}" alt="Profile Picture" style="width: 50px; height: 50px; object-fit: cover;"></td>
                <td>${vehicle.password}</td>
                
                <td>
               <form action="DeleteServlet" method="post">
               <input type="hidden" name ="id" value ="${vehicle.id}"/>
                 <button>Delete</button>
               </form>
                </td>
         </tr>
      </c:forEach>
 </table>
 
 </body>
 </html >
