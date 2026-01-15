package vehiclePackage;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/bikeUpdateServlet")
@MultipartConfig
public class bikeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//To handle multipart/for-data
		request.setCharacterEncoding("UTF-8");
		
		Part filePart =request.getPart("newbikeimg");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		String finalBikeImg;
		
		if (fileName != null && !fileName.isEmpty()) {
	        // Save new image
	        String uploadPath = getServletContext().getRealPath("") + File.separator + "vehiclepics";
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) uploadDir.mkdir();

	        filePart.write(uploadPath + File.separator + fileName);
	        finalBikeImg = fileName;
	    } else {
	        // Keep old image
	        finalBikeImg = request.getParameter("oldbikeimg");
	    }
		
		
		String bikeId = request.getParameter("bikeId");
		
		String bikeName = request.getParameter("bikeName");
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
		
		isTrue = bikeController.updatedata(bikeId, finalBikeImg, bikeName, brand, type, model, color, plateNumber, year, mileage, price, status);
				
		if(isTrue == true) {
			List<bikeModel> bikedetails = bikeController.getById(bikeId);
			request.setAttribute("bikedetails", bikedetails);
			
			String alertMessage = "Data Update Successfull";
			response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href = 'bikeGetallServlet' </script>");
		}
		else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request,  response);
		}
	}

}
