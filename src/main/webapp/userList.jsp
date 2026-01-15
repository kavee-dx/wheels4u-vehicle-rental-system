<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="userManagement.UserModel" %>
<%
    UserModel currentUser = (UserModel) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    
    List<UserModel> users = (List<UserModel>) request.getAttribute("users");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List - Vehicle Rental System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .user-list-container {
            max-width: 1000px;
            margin: 50px auto;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="user-list-container">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>User List</h2>
                <div>
                    <a href="${pageContext.request.contextPath}/dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
                    <a href="${pageContext.request.contextPath}/user/logout" class="btn btn-link">Logout</a>
                
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Full Name</th>
                            <th>Contact Number</th>
                            <th>Email</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (UserModel user : users) { %>
                            <tr>
                                <td><%= user.getId() %></td>
                                <td><%= user.getFullName() %></td>
                                <td><%= user.getContactNumber() %></td>
                                <td><%= user.getEmail() %></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/user/view?id=<%= user.getId() %>" class="btn btn-sm btn-info">View</a>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 