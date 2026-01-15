package driverEdit;
//Import necessary classes from the java.sql package
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

	private static String url = "jdbc:mysql://localhost:3306/vehicle_new";
	private static String user = "root";
	private static String pass = "2468Kd";
	private static Connection con;// Connection object to manage the connection with the database

	 // Public static method to get the database connection (error handling)
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");  // Using the newer driver class
			con = DriverManager.getConnection(url,user,pass);//drive manager class -if true then our connection execute
			if (con != null) {
				System.out.println("Database connection successful!");
			}
		}
		catch(ClassNotFoundException e) {
			// Print error message if connection fails
			System.out.println("MySQL JDBC Driver not found!");
			e.printStackTrace();
		}
		catch(SQLException e) {
			System.out.println("Database connection failed!");
			e.printStackTrace();
		}
		return con;  // Return the connection object (null if connection failed)
		
		
	}
}
