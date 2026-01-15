package vehiclePackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/vanDeleteServlet")
public class vanDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
String vanId = request.getParameter("vanId");
		
		boolean isTrue;
		isTrue = vanController.deletedata(vanId);
		
		if(isTrue == true) {
			String alertMessage = "Van Delete Successfull";
			response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='vanGetallServlet';</script>");
		}
		else {
			List<vanModel> vanDetails = vanController.getById(vanId);
			request.setAttribute("vanDetails", vanDetails);
			
			RequestDispatcher dispacher = request.getRequestDispatcher("wrong.jsp");
			dispacher.forward(request, response);
		}
	}

}
