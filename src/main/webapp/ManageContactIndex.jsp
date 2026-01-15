<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Contact Messages</title>
  
  <style>
  
  body {
  margin: 0;
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
}

.container {
  max-width: 1000px;
  margin: 50px auto;
  padding: 20px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

h2 {
  text-align: center;
  color: #333;
}

.back-btn {
  background-color: #777;
  color: white;
  padding: 10px 18px;
  border: none;
  border-radius: 4px;
  margin-bottom: 20px;
  cursor: pointer;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 10px;
}

th {
  background-color: #0088e8;
  color: white;
  padding: 12px;
  text-align: left;
}

td {
  padding: 12px;
  border-bottom: 1px solid #ccc;
}

.edit-btn {
  background-color: #2196f3;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 4px;
  margin-right: 5px;
  cursor: pointer;
}

.delete-btn {
  background-color: #f44336;
  color: white;
  border: none;
  padding: 6px 12px;
  border-radius: 4px;
  cursor: pointer;
}

.edit-btn:hover {
  background-color: #1976d2;
}

.delete-btn:hover {
  background-color: #d32f2f;
}
  
  
  
  
  </style>
  
</head>
<jsp:include page="header.jsp"/>
<body>

  <div class="container">
    <h2>Contact Messages</h2>

    <button class="back-btn" onclick="window.location.href='${pageContext.request.contextPath}/contact/ManageContactCreate.jsp'">Back to Dashboard</button>

    <table>
    
      <thead>
        <tr>
          <th>ID</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Email</th> 
          <th>Phone</th>
          <th>Message</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="message" items="${messages}">
          <tr>
            <td>${message.id}</td>
            <td>${message.firstname}</td>
            <td>${message.lastname}</td>
            <td>${message.email}</td> 
            <td>${message.phone}</td>
            <td>${message.message}</td>
            <td>
              <button class="edit-btn" onclick="window.location.href='contact?action=edit&id=${message.id}'">Edit</button>
              <button class="delete-btn" onclick="confirmAndRedirect('contact?action=delete&id=${message.id}')">Delete</button>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <script>
    function confirmAndRedirect(url) {
      if (confirm("Are you sure you want to delete?")) {
        window.location.href = url;
      }
    }
  </script>

<jsp:include page="vehicleFooter.jsp"/>
</body>
</html>
