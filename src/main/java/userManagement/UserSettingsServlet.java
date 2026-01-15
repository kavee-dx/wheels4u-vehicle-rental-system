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

@WebServlet("/userSettings")
public class UserSettingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final String DB_URL = "jdbc:mysql://localhost:3306/vehicle_new";
    private final String DB_USER = "root";
    private final String DB_PASS = "2468Kd";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userEmail") == null) {
            response.sendRedirect("userLogin.jsp");
            return;
        }

        String email = (String) session.getAttribute("userEmail");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            String sql = "SELECT full_name, contact_number, email FROM users WHERE email=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("userName", rs.getString("full_name"));
                session.setAttribute("userContact", rs.getString("contact_number"));
                session.setAttribute("userEmail", rs.getString("email"));
            }

            rs.close();
            ps.close();
            con.close();

            request.getRequestDispatcher("/userSettings.jsp").forward(request, response);


        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to load profile data");
            request.getRequestDispatcher("/userSettings.jsp").forward(request, response);

        }
    }
}
