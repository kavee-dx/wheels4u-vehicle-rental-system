package Vehical.Rent.servlet;

import Vehical.Rent.model.ContactMessage;
import Vehical.Rent.service.ContactMessageService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/contact")
public class ContactMessageServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ContactMessageService contactMessageService;

    @Override
    public void init() throws ServletException {
        super.init();
        contactMessageService = new ContactMessageService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
        	
            List<ContactMessage> messages = contactMessageService.getAllContactMessages();
            request.setAttribute("messages", messages);
            request.getRequestDispatcher("ManageContactIndex.jsp").forward(request, response);
            
        } else if ("edit".equals(action)) {
        	
            int id = Integer.parseInt(request.getParameter("id"));
            ContactMessage message = contactMessageService.getContactMessage(id);
            request.setAttribute("message", message);
            request.getRequestDispatcher("ManageContactEdit.jsp").forward(request, response);
            
        } else if ("delete".equals(action)) {
        	
            int id = Integer.parseInt(request.getParameter("id"));
            contactMessageService.deleteContactMessage(id);
            response.sendRedirect("contact");
            
        } else if ("create".equals(action)) {
        	
            request.getRequestDispatcher("contact/ManageContactCreate.jsp").forward(request, response);
            
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            ContactMessage message = new ContactMessage();
            message.setFirstname(request.getParameter("firstname"));
            message.setLastname(request.getParameter("lastname"));
            message.setEmail(request.getParameter("email"));
            message.setPhone(request.getParameter("phone"));
            message.setMessage(request.getParameter("message"));

            if (contactMessageService.createContactMessage(message)) {
                response.sendRedirect("contact");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else if ("update".equals(action)) {
            ContactMessage message = new ContactMessage();
            message.setId(Integer.parseInt(request.getParameter("id")));
            message.setFirstname(request.getParameter("firstname"));
            message.setLastname(request.getParameter("lastname"));
            message.setEmail(request.getParameter("email"));
            message.setPhone(request.getParameter("phone"));
            message.setMessage(request.getParameter("message"));

            if (contactMessageService.updateContactMessage(message)) {
                response.sendRedirect("contact");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid or missing action.");
        }
    }
}
