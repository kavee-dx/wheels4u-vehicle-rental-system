package vehiclePackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/bikeDeleteServlet")
public class bikeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bikeId = request.getParameter("bikeId");
		
		boolean isTrue;
		isTrue = bikeController.deletedata(bikeId);
		
		if(isTrue == true) {
			String alertMessage = "Bike Delete Successfull";
			response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='bikeGetallServlet';</script>");
		}
		else {
			List<bikeModel> bikeDetails = bikeController.getById(bikeId);
			request.setAttribute("bikeDetails", bikeDetails);
			
			RequestDispatcher dispacher = request.getRequestDispatcher("wrong.jsp");
			dispacher.forward(request, response);
		}
		
	}

}
