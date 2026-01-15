package driverEdit;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet("/UpdateServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 5,    // 5 MB
    maxRequestSize = 1024 * 1024 * 10  // 10 MB
)
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String licenseNumber = request.getParameter("licenseNumber");
		String vehicleAssigned = request.getParameter("vehicleAssigned");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
	    
		// Convert date string to LocalDate
        String licenseExpiryDateStr = request.getParameter("licenseExpiryDate");
        LocalDate licenseExpiryDate = LocalDate.parse(licenseExpiryDateStr);

		
		// Handle file upload (profilePicture)
					byte[] profilePicture = null;
					Part filePart = request.getPart("profilePicture");
					if (filePart != null && filePart.getSize() > 0) {
						try (InputStream fileContent = filePart.getInputStream()) {
							profilePicture = fileContent.readAllBytes();
						}
					}
		
		boolean isTrue;
		isTrue = VehicleControl.updatedata(id, fullName, email, phone, licenseNumber, licenseExpiryDate, vehicleAssigned, address, profilePicture, password);
		
		if (isTrue) {
			List<vehicleModel> vehicle = VehicleControl.getById(id);
			request.setAttribute("vehicledetails", vehicle);
			
			String alertMessage = "Data Update Successful";
			response.getWriter().println("<script>alert('" + alertMessage + "');window.location.href='GetByIDServlet?id=" + id + "'</script>");
		} else {
			request.setAttribute("error", "Failed to update data. Please try again.");
			RequestDispatcher dis2 = request.getRequestDispatcher("Home.jsp");
			dis2.forward(request, response);
		}
	}

}
