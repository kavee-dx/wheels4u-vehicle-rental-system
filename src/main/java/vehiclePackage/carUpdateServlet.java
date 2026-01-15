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


@WebServlet("/carUpdateServlet")
@MultipartConfig
public class carUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//To handle multipart/for-data
				request.setCharacterEncoding("UTF-8");
				
				Part filePart =request.getPart("newcarimg");
				String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
				String finalCarImg;
				
				if (fileName != null && !fileName.isEmpty()) {
			        // Save new image
			        String uploadPath = getServletContext().getRealPath("") + File.separator + "vehiclepics";
			        File uploadDir = new File(uploadPath);
			        if (!uploadDir.exists()) uploadDir.mkdir();

			        filePart.write(uploadPath + File.separator + fileName);
			        finalCarImg = fileName;
			    } else {
			        // Keep old image
			        finalCarImg = request.getParameter("oldcarimg");
			    }
				
				
				String carId = request.getParameter("carId");
				
				String carName = request.getParameter("carName");
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
				
				isTrue = carController.updatedata(carId, finalCarImg, carName, brand, type, model, color, plateNumber, year, mileage, price, status);
						
				if(isTrue == true) {
					List<carModel> cardetails = carController.getById(carId);
					request.setAttribute("cardetails", cardetails);
					
					String alertMessage = "Data Update Successfull";
					response.getWriter().println("<script> alert('"+alertMessage+"'); window.location.href = 'carGetallServlet' </script>");
				}
				else {
					RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
					dis2.forward(request,  response);
				}
			}
	
}
