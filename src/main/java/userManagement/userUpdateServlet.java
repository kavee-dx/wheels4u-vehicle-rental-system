package userManagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userUpdateServlet")
public class userUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final String DB_URL = "jdbc:mysql://localhost:3306/vehicle_new";
    private final String DB_USER = "root";
    private final String DB_PASS = "2468Kd";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("userEmail");

        if (email == null) {
            response.sendRedirect("userLogin.jsp");
            return;
        }

        String fullName = request.getParameter("fullName").trim();
        String contact = request.getParameter("contactNumber").trim();
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        /* BASIC VALIDATION */
        if (fullName.isEmpty() || contact.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/userSettings?error=required");
            return;
        }

        if (!newPassword.isEmpty() || !confirmPassword.isEmpty()) {
            if (!newPassword.equals(confirmPassword)) {
                response.sendRedirect(request.getContextPath() + "/userSettings?error=password");
                return;
            }
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            PreparedStatement ps;

            if (newPassword == null || newPassword.isEmpty()) {
                ps = con.prepareStatement(
                    "UPDATE users SET full_name = ?, contact_number = ? WHERE email = ?"
                );
                ps.setString(1, fullName);
                ps.setString(2, contact);
                ps.setString(3, email);
            } else {
                ps = con.prepareStatement(
                    "UPDATE users SET full_name = ?, contact_number = ?, password = ? WHERE email = ?"
                );
                ps.setString(1, fullName);
                ps.setString(2, contact);
                ps.setString(3, newPassword); // plain text (same as register)
                ps.setString(4, email);
            }

            int updated = ps.executeUpdate();
            con.close();

            if (updated > 0) {
                // Update session immediately
                session.setAttribute("userName", fullName);
                session.setAttribute("userContact", contact);

                // Redirect to reload DB data + show success message
                response.sendRedirect(request.getContextPath() + "/userSettings?success=1");
            } else {
                response.sendRedirect(request.getContextPath() + "/userSettings?error=failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/userSettings?error=exception");
        }
    }
}
