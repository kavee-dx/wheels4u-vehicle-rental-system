package vehiclePackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/busDeleteServlet")
public class busDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String busId = request.getParameter("busId");
		
		boolean isTrue;
		isTrue = busController.deletedata(busId);
		
		if(isTrue == true) {
			String alertMessage = "Bus Delete Successfull";
			response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='busGetallServlet';</script>");
		}
		else {
			List<busModel> busDetails = busController.getById(busId);
			request.setAttribute("busDetails", busDetails);
			
			RequestDispatcher dispacher = request.getRequestDispatcher("wrong.jsp");
			dispacher.forward(request, response);
		}
	}

}
