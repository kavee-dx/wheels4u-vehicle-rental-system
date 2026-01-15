package userManagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userInsertServlet")
public class userInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private final String DB_URL = "jdbc:mysql://localhost:3306/vehicle_new";
    private final String DB_USER = "root"; // replace with your DB user
    private final String DB_PASS = "2468Kd";     // replace with your DB password

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String fullName = request.getParameter("fullName").trim();
        String contact = request.getParameter("contactNumber").trim();
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();
        String confirmPassword = request.getParameter("confirmPassword").trim();

        // Basic validation
        if (fullName.isEmpty() || contact.isEmpty() || email.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
            request.setAttribute("error", "All fields are required!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            // Check if email already exists
            String checkQuery = "SELECT * FROM users WHERE email = ?";
            PreparedStatement psCheck = con.prepareStatement(checkQuery);
            psCheck.setString(1, email);
            ResultSet rs = psCheck.executeQuery();
            if (rs.next()) {
                request.setAttribute("error", "Email already registered!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                con.close();
                return;
            }

            // Insert user into DB
            String insertQuery = "INSERT INTO users (full_name, contact_number, email, password) VALUES (?, ?, ?, ?)";
            PreparedStatement psInsert = con.prepareStatement(insertQuery);
            psInsert.setString(1, fullName);
            psInsert.setString(2, contact);
            psInsert.setString(3, email);
            psInsert.setString(4, password); // plain text password

            int row = psInsert.executeUpdate();
            con.close();

            if (row > 0) {
                request.setAttribute("success", "Registration successful!");
            } else {
                request.setAttribute("error", "Registration failed! Try again.");
            }

            request.getRequestDispatcher("register.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }
}
