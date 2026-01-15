package Vehical.Rent.util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static String url = "jdbc:mysql://localhost:3306/vehicle_new";
	private static String user = "root";
	private static String pass = "2468Kd";
	
  

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver"); // correct driver of mine
            return DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
