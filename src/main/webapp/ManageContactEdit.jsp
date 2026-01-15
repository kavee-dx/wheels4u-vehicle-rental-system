<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Edit Contact Message</title>
  
   
   <style>
   
   body {
  margin: 0;
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
}

.edit-container {
  max-width: 600px;
  margin: 60px auto;
  padding: 30px;
  background: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

h2 {
  text-align: center;
  margin-bottom: 30px;
  color: #333;
}

.row {
  margin-bottom: 20px;
  display: flex;
  flex-direction: column;
}

label {
  margin-bottom: 6px;
  font-weight: bold;
}

input, textarea {
  padding: 12px;
  font-size: 16px;
  border-radius: 6px;
  border: 1px solid #ccc;
  width: 100%;
  box-sizing: border-box;
}

textarea {
  resize: vertical;
  min-height: 100px;
}

.buttons {
  display: flex;
  justify-content: space-between;
}

button {
  background-color: #2196f3;
  color: white;
  padding: 12px 24px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  font-size: 16px;
}

.cancel-btn {
  background-color: #f44336;
}

button:hover {
  opacity: 0.9;
}
   
   
   
   </style>
   
   
</head>
<jsp:include page="header.jsp"/>
<body>

  <div class="edit-container">
    <h2>Edit Contact Message</h2>

    
    <form id="edit-form" action="${pageContext.request.contextPath}/contact" method="post">

      <!-- Hidden Inputs for Action and ID -->
      
      <input type="hidden" name="action" value="update"/>
      <input type="hidden" name="id" value="${message.id}"/>

      <div class="row">
        <label for="firstname">First Name:</label>
        <input type="text" id="firstname" name="firstname" value="${message.firstname}" required />
      </div>

      <div class="row">
        <label for="lastname">Last Name:</label>
        <input type="text" id="lastname" name="lastname" value="${message.lastname}" required />
      </div>

      <div class="row">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${message.email}" required />
      </div>

      <div class="row">
        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" name="phone" value="${message.phone}" required />
      </div>

      <div class="row">
        <label for="message">Message:</label>
        <textarea id="message" name="message" required>${message.message}</textarea>
      </div>

      <div class="buttons">
        <button type="submit">Update</button>
        <button type="button" class="cancel-btn" onclick="window.location.href='${pageContext.request.contextPath}/contact'">Cancel</button>
      </div>
    </form>
  </div>
  <jsp:include page="vehicleFooter.jsp"/>

</body>
</html>



