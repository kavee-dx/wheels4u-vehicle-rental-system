package driverEdit;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		boolean isTrue ;
		isTrue = VehicleControl.deletedata(id);
			if (isTrue) {
			String alertMessage = "Data Insert Successful";
			response.getWriter().println("<script>alert('" + alertMessage + "');"+"window.location.href='Home.jsp'</script>"); //going to the display file
			} 
			else {
				List<vehicleModel> vehicleDetails = VehicleControl.getById(id);
				request.setAttribute("vehiclDetails",vehicleDetails);
				
				RequestDispatcher dispacher = request.getRequestDispatcher("wrong.jsp");
				dispacher.forward(request,response);
			}
	}

}
