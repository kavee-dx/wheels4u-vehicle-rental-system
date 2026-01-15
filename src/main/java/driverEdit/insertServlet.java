package driverEdit;

import java.io.IOException;
import java.io.InputStream;
import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

// Servlet implementation class insertServlet
@WebServlet("/insertServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1 MB
    maxFileSize = 1024 * 1024 * 5,    // 5 MB
    maxRequestSize = 1024 * 1024 * 10  // 10 MB
)
public class insertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// Set character encoding
			request.setCharacterEncoding("UTF-8");
			
			String fullName = request.getParameter("fullName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String licenseNumber = request.getParameter("licenseNumber");
			String vehicleAssigned = request.getParameter("vehicleAssigned");
			String address = request.getParameter("address");
			String password = request.getParameter("password");
			String licenseExpiryDate = request.getParameter("licenseExpiryDate");

			// Log all parameters for debugging
			System.out.println("Received parameters:");
			System.out.println("fullName: " + fullName);
			System.out.println("email: " + email);
			System.out.println("phone: " + phone);
			System.out.println("licenseNumber: " + licenseNumber);
			System.out.println("licenseExpiryDate: " + licenseExpiryDate);
			System.out.println("vehicleAssigned: " + vehicleAssigned);
			System.out.println("address: " + address);

			// Validate required fields
			if (fullName == null || fullName.trim().isEmpty() ||
				email == null || email.trim().isEmpty() ||
				licenseNumber == null || licenseNumber.trim().isEmpty() ||
				licenseExpiryDate == null || licenseExpiryDate.trim().isEmpty() ||
				password == null || password.trim().isEmpty()) {
				
				request.setAttribute("error", "All required fields must be filled out");
				RequestDispatcher dis = request.getRequestDispatcher("driverInsert.jsp");
				dis.forward(request, response);
				return;
			}

			// Handle file upload (profilePicture)
			byte[] profilePicture = null;
			Part filePart = request.getPart("profilePicture");
			if (filePart != null && filePart.getSize() > 0) {
				try (InputStream fileContent = filePart.getInputStream()) {
					profilePicture = fileContent.readAllBytes();
				}
			}

			// Define the directory to save the images
			String imagePath = "VehicleRental/src/main/webapp/img";
			File imageDir = new File(imagePath);
			if (!imageDir.exists()) {
			    imageDir.mkdirs(); // Create the directory if it doesn't exist
			}

			// Save the file to the local filesystem
			if (filePart != null && filePart.getSize() > 0) {
			    String fileName = fullName.replaceAll("\\s+", "_") + "_" + System.currentTimeMillis() + ".jpg";
			    File file = new File(imageDir, fileName);
			    try (FileOutputStream fos = new FileOutputStream(file)) {
			        fos.write(profilePicture);
			    }
			    // Optionally, store the file path in the database instead of the byte array
			    // profilePicture = fileName.getBytes();
			}

			int generatedId = VehicleControl.insertData(fullName, email, phone, licenseNumber, 
													 licenseExpiryDate, vehicleAssigned, 
													 address, profilePicture, password);

			if (generatedId != -1) {
				// Store the generated ID in session for future use
				request.getSession().setAttribute("lastInsertedId", generatedId);
				String alertMessage = "Data Insert Successful";
				response.sendRedirect("GetByIDServlet?id=" + generatedId);
			} else {
				request.setAttribute("error", "Failed to insert data. Please try again.");
				RequestDispatcher dis2 = request.getRequestDispatcher("driverInsert.jsp");
				dis2.forward(request, response);
			}
		} catch (Exception e) {
			System.out.println("Error in insertServlet: " + e.getMessage());
			e.printStackTrace();
			request.setAttribute("error", "An error occurred: " + e.getMessage());
			RequestDispatcher dis = request.getRequestDispatcher("driverInsert.jsp");
			dis.forward(request, response);
		}
	}

}
