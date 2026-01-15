package Vehical.Rent.servlet;

import Vehical.Rent.model.ContactMessage;
import Vehical.Rent.service.ContactMessageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.RequestDispatcher;

@WebServlet("/contact/submitContact")
public class ManageContactCreateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ContactMessageService messageService = new ContactMessageService();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect GET access to the create form page
        response.sendRedirect(request.getContextPath() + "ManageContactCreate.jsp");
    }

    
    // Handle POST form submissions
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        // Create model object and populate data
        ContactMessage contactMessage = new ContactMessage();
        contactMessage.setFirstname(firstname);
        contactMessage.setLastname(lastname);
        contactMessage.setEmail(email);
        contactMessage.setPhone(phone);
        contactMessage.setMessage(message);

        // Save to database using service class
        boolean isSuccess = messageService.createContactMessage(contactMessage);

        if (isSuccess) {
        	
        	String alertMessage = "Data Insert Successful";
        	response.setContentType("text/html");
        	response.getWriter().println("<script>alert('" + alertMessage + "'); window.location.href='" + request.getContextPath() + "/contact';</script>");
        } else {
        	RequestDispatcher dis2 = request.getRequestDispatcher("/contact/ManageContactCreate.jsp");
			dis2.forward(request, response);
        }

       
    }
}
