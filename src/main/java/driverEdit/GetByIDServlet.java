package driverEdit;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetByIDServlet")
public class GetByIDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	        // Get the ID from request parameter
	        String idStr = request.getParameter("id");
	        
	        if (idStr == null || idStr.trim().isEmpty()) {
	            throw new ServletException("ID parameter is missing");
	        }
	        
	        // Get the vehicle/driver by ID
	        List<vehicleModel> oneVehicle = VehicleControl.getById(idStr);
	        request.setAttribute("oneVehicle", oneVehicle);
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
	        dispatcher.forward(request, response);
	    } catch (Exception e) {
	        // Handle errors appropriately
	        request.setAttribute("error", "Error retrieving data: " + e.getMessage());
	        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
