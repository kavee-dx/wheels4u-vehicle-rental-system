package driverEdit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class VehicleControl {

    // Track success
    private static boolean isSuccess;

    // Insert data function
    public static int insertData(String fullName, String email, String phone, String licenseNumber, String licenseExpiryDate, String vehicleAssigned, String address, byte[] profilePicture, String password)
    {
        Connection con = null;
        ResultSet generatedKeys = null;

        try {
            // Get DB connection
            con = DatabaseConnection.getConnection();

            // Check if connection failed
            if (con == null) {
                System.out.println("Database connection is null.");
                return -1;
            }

            // SQL insert with prepared statement
            String sql = "INSERT INTO vehicle_new (fullName, email, phone, licenseNumber, licenseExpiryDate, vehicleAssigned, address, profilePicture, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            try (PreparedStatement stmt = con.prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS)) {
                stmt.setString(1, fullName);
                stmt.setString(2, email);
                stmt.setString(3, phone);
                stmt.setString(4, licenseNumber);
                stmt.setDate(5, java.sql.Date.valueOf(licenseExpiryDate));
                stmt.setString(6, vehicleAssigned);
                stmt.setString(7, address);
                
                // Handle profile picture
                if (profilePicture != null && profilePicture.length > 0) {
                    stmt.setBinaryStream(8, new java.io.ByteArrayInputStream(profilePicture), profilePicture.length);
                } else {
                    stmt.setNull(8, java.sql.Types.BLOB);
                }
                
                stmt.setString(9, password);
                
                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    // Retrieve the auto-generated ID
                    generatedKeys = stmt.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        int generatedId = generatedKeys.getInt(1);
                        isSuccess = true;
                        return generatedId; // Return the generated ID
                    }
                }
                isSuccess = false;
                return -1;
            }
        } catch (SQLException e) {
            isSuccess = false;
            e.printStackTrace();
            return -1;
        } finally {
            // Close resources in finally block
            try {
                if (generatedKeys != null) generatedKeys.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Getter for success status
    public static boolean isSuccess() {
        return isSuccess;
    }

    // Helper method to convert byte array to hex string
    private static String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
     }
    //getById
    public static List <vehicleModel> getById (String Id){
    	
    	ArrayList<vehicleModel> vehicle = new ArrayList<>();
    	
    	try {
    		//dbConnection
    		Connection con = DatabaseConnection.getConnection();
    		//Query
    		String sql = "SELECT * FROM vehicle_new WHERE id = ?";
    		PreparedStatement stmt = con.prepareStatement(sql);
    		stmt.setString(1, Id);
    		
    		ResultSet rs = stmt.executeQuery();
    		 
    		 while(rs.next()) {
    			 int id = rs.getInt(1);
    			 String fullName = rs.getString(2);
    			 String email = rs.getString(3);
    			 String phone = rs.getString(4);
    			 String licenseNumber = rs.getString(5);
    			 LocalDate licenseExpiryDate = rs.getDate(6).toLocalDate();
    			 String vehicleAssigned = rs.getString(7);
    			 String address = rs.getString(8);
    			 byte[] profilePicture = rs.getBytes(9);
    			 String password = rs.getString(10);          
   
    			 vehicleModel vk = new vehicleModel(id, fullName,email,phone,licenseNumber,licenseExpiryDate,vehicleAssigned,address,profilePicture,password );
    			 vehicle.add(vk);
    		 }
    				 
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return vehicle;
    }
    public static List <vehicleModel> getAllVehicle (){
    ArrayList<vehicleModel> vehicles = new ArrayList<>();
    
    try {
		//dbConnection
		Connection con = DatabaseConnection.getConnection();
		//Query
		String sql = "SELECT * FROM vehicle_new ";
		PreparedStatement stmt = con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		 
		 while(rs.next()) {
			 int id = rs.getInt(1);
			 String fullName = rs.getString(2);
			 String email = rs.getString(3);
			 String phone = rs.getString(4);
			 String licenseNumber = rs.getString(5); // corrected spelling
			 LocalDate licenseExpiryDate = rs.getDate(6).toLocalDate(); // Use java.sql.Date or java.time.LocalDate (see note below)
			 String vehicleAssigned = rs.getString(7);
			 String address = rs.getString(8);
			 byte[] profilePicture = rs.getBytes(9); // changed from getString to getBytes
			 String password = rs.getString(10);          

			 vehicleModel vk = new vehicleModel(id, fullName,email,phone,licenseNumber,licenseExpiryDate,vehicleAssigned,address,profilePicture,password );
			 vehicles.add(vk);
		 }
				 
	}catch(Exception e) {
		e.printStackTrace();
	}
	return vehicles;
   
}
    //update function
    public static boolean updatedata(String id,String fullName,String email,String phone,String licenseNumber,LocalDate licenseExpiryDate ,String vehicleAssigned ,String address,byte[] profilePicture,String password ) {
    	
    	try {
    		//dbConnection
    		Connection con = DatabaseConnection.getConnection();
    		
    		//sql query
    		String sql = "UPDATE vehicle_new SET fullName=?, email=?, phone=?, licenseNumber=?, licenseExpiryDate=?, vehicleAssigned=?, address=?, profilePicture=?, password=? WHERE Id=?";
    		
    	   try (PreparedStatement stmt = con.prepareStatement(sql)) {
                 stmt.setString(1, fullName);
                 stmt.setString(2, email);
                 stmt.setString(3, phone);
                 stmt.setString(4, licenseNumber);
                 stmt.setDate(5, java.sql.Date.valueOf(licenseExpiryDate));
                 stmt.setString(6, vehicleAssigned);
                 stmt.setString(7, address);
                 
                 // Handle profile picture
                 if (profilePicture != null && profilePicture.length > 0) {
                     stmt.setBinaryStream(8, new java.io.ByteArrayInputStream(profilePicture), profilePicture.length);
                 } else {
                     stmt.setNull(8, java.sql.Types.BLOB);
                 }
                 
                 stmt.setString(9, password);
                 stmt.setInt(10, Integer.parseInt(id));
                 
                 System.out.println("Executing update with ID: " + id); // Debug log
                 int rowsAffected = stmt.executeUpdate();
                 isSuccess = rowsAffected > 0;
                 return isSuccess;
             } catch (SQLException e) {
                 System.out.println("SQL Error: " + e.getMessage()); // Debug log
                 isSuccess = false;
                 e.printStackTrace();
                 return false;
             }
    	} catch(Exception e) {
    		System.out.println("General Error: " + e.getMessage()); // Debug log
    		e.printStackTrace();
    	}
    	return isSuccess;
    }
    //delete data
    public static boolean deletedata(String id) {
    	try {
    		//dbConnection
    		Connection con = DatabaseConnection.getConnection();
    		
    		String sql = "delete from vehicle_new where Id = "+id+"";
    		
    	   try (PreparedStatement stmt = con.prepareStatement(sql)) {
                 int rowsAffected = stmt.executeUpdate();
                 isSuccess = rowsAffected > 0;
                 return isSuccess;
                 
             }catch (SQLException e) {
             isSuccess = false;
             e.printStackTrace();
             return false;
         }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    		return isSuccess;
    }

    // Login method to validate user credentials
    public static boolean login(String email, String password) {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            // Get database connection
            con = DatabaseConnection.getConnection();
            
            // Prepare SQL query
            String sql = "SELECT * FROM vehicle_new WHERE email = ? AND password = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            
            // Execute query
            rs = stmt.executeQuery();
            
            // Check if any matching record exists
            isSuccess = rs.next();
            return isSuccess;
            
        } catch (SQLException e) {
            isSuccess = false;
            e.printStackTrace();
            return false;
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
