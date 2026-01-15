package driverEdit;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.FileInputStream;
import java.io.File;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProfilePictureServlet")
public class ProfilePictureServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ProfilePictureServlet.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        
        logger.info("Received request for ID: " + id);
        
        if (id == null || id.trim().isEmpty()) {
            logger.warning("ID parameter is missing or empty");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID parameter is missing");
            return;
        }

        try {
            Connection con = DatabaseConnection.getConnection();
            String sql = "SELECT profilePicture FROM vehicle_new WHERE id = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(id));
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                byte[] imageData = rs.getBytes("profilePicture");
                if (imageData != null && imageData.length > 0) {
                    // Set the content type to image/jpeg (you might want to store the actual image type in the database)
                    response.setContentType("image/jpeg");
                    response.getOutputStream().write(imageData);
                } else {
                    logger.warning("No image found for ID: " + id);
                    // Serve a default image if no image is found
                    File defaultImage = new File("VehicleRental/src/main/webapp/img/default.jpg");
                    if (defaultImage.exists()) {
                        response.setContentType("image/jpeg");
                        try (FileInputStream fis = new FileInputStream(defaultImage)) {
                            byte[] buffer = new byte[1024];
                            int bytesRead;
                            while ((bytesRead = fis.read(buffer)) != -1) {
                                response.getOutputStream().write(buffer, 0, bytesRead);
                            }
                        }
                    } else {
                        logger.severe("Default image is missing");
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "No image found and default image is missing");
                    }
                }
            } else {
                logger.warning("Driver not found for ID: " + id);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Driver not found");
            }
            
            rs.close();
            stmt.close();
            con.close();
            
        } catch (SQLException e) {
            logger.severe("Database error: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        } catch (NumberFormatException e) {
            logger.severe("Invalid ID format: " + id);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format");
        }
    }
} 