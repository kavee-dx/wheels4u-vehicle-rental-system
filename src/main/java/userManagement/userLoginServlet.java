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
import javax.servlet.http.HttpSession;

@WebServlet("/userLoginServlet")
public class userLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private final String DB_URL = "jdbc:mysql://localhost:3306/vehicle_new";
    private final String DB_USER = "root"; // replace with your DB user
    private final String DB_PASS = "2468Kd";     // replace with your DB password

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        if(email.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "All fields are required!");
            request.getRequestDispatcher("userLogin.jsp").forward(request, response);
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {

                String query = "SELECT * FROM users WHERE email = ? AND password = ?";
                try (PreparedStatement ps = con.prepareStatement(query)) {
                    ps.setString(1, email);
                    ps.setString(2, password); // plain-text password

                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            // Login successful
                            HttpSession session = request.getSession();
                            session.setAttribute("userId", rs.getInt("user_id"));
                            session.setAttribute("userName", rs.getString("full_name"));
                            session.setAttribute("userEmail", rs.getString("email"));

                            // Redirect to user dashboard (create a JSP for this)
                            response.sendRedirect("Home.jsp");
                        } else {
                            // Login failed
                            request.setAttribute("error", "Invalid email or password!");
                            request.getRequestDispatcher("userLogin.jsp").forward(request, response);
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong: " + e.getMessage());
            request.getRequestDispatcher("userLogin.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("userLogin.jsp");
    }
}
