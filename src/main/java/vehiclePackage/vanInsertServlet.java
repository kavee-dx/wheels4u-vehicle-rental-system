package vehiclePackage;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/vanInsertServlet")
@MultipartConfig
public class vanInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Get uploaded image
		Part filePart = request.getPart("vanimg");
		String fileName = filePart.getSubmittedFileName();
		
		//save uploaded file to /vehiclepics folder
		String uploadPath = getServletContext().getRealPath("") + "vehiclepics";
		filePart.write(uploadPath + "/" + fileName); //save image
		
		
		//Other form fields
		String vanName = request.getParameter("vanName");
		String brand = request.getParameter("brand");
		String type = request.getParameter("type");
		String model = request.getParameter("model");
		String color = request.getParameter("color");
		String plateNumber = request.getParameter("plateNumber");
		int year = Integer.parseInt(request.getParameter("year"));
		BigDecimal mileage = new BigDecimal(request.getParameter("mileage"));  
		BigDecimal price = new BigDecimal(request.getParameter("price"));
		String status = request.getParameter("status");
		
		boolean isTrue;
		
		isTrue = vanController.insertdata(fileName, vanName, brand, type, model, color, plateNumber, year, mileage, price, status);
		
		if(isTrue == true) {
			String alertMessage = "Data Insert Successfull";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href = 'vanGetallServlet' </script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request,  response);
		}
	

	}

}
