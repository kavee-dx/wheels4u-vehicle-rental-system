package vehiclePackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/adminloginServlet")
public class adminloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 private static final String ADMIN_EMAIL = "admin@123";
	  private static final String ADMIN_PASSWORD = "admin123";
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.sendRedirect("adminlogin.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String email = request.getParameter("email");
	        String password = request.getParameter("password");

	        if (!ADMIN_EMAIL.equals(email)) {
	            request.setAttribute("error", "Email is incorrect");
	            RequestDispatcher dispatcher = request.getRequestDispatcher("adminlogin.jsp");
	            dispatcher.forward(request, response);
	        } else if (!ADMIN_PASSWORD.equals(password)) {
	            request.setAttribute("error", "Please enter the correct password");
	            RequestDispatcher dispatcher = request.getRequestDispatcher("adminlogin.jsp");
	            dispatcher.forward(request, response);
	        } else {
	            // Login successful, redirect to admin page
	            HttpSession session = request.getSession();
	            session.setAttribute("adminEmail", ADMIN_EMAIL);
	            response.sendRedirect("vehiclesButton.jsp");
	        }
	}

}
