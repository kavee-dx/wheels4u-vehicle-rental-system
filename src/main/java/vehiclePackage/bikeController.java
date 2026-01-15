package vehiclePackage;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class bikeController {
	
	 //Connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	

	//Insert Data Function
	public static boolean insertdata(String bikeimg, String bikeName, String brand, String type, String model, String color, String plateNumber, int year, BigDecimal mileage, BigDecimal price, String status) {
		
		boolean isSuccess = false;
		
		try {
			//DB connection call
			con = vehiclesDBconnection.getConnection();
			stmt = con.createStatement();
			
			//SQL Query
			String sql = "insert into bikes values (0, '"+bikeimg+"', '"+bikeName+"','"+brand+"','"+type+"','"+model+"','"+color+"','"+plateNumber+"','"+year+"','"+mileage+"','"+price+"','"+status+"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
		
	}
	
	
	//GetById function
	public static List<bikeModel> getById (String Id) {
		
		int convertedID = Integer.parseInt(Id);
		
		ArrayList <bikeModel> bike = new ArrayList<>();
		
		try {
			//DB Connection call
			con = vehiclesDBconnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "select * from bikes where bikeId = '"+convertedID+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int bikeId = rs.getInt(1);
				String bikeimg = rs.getString(2);
				String bikeName = rs.getString(3);
				String brand = rs.getString(4);
				String type = rs.getString(5);
				String model = rs.getString(6);
				String color = rs.getString(7);
				String plateNumber = rs.getString(8);
				int year = rs.getInt(9);
				BigDecimal mileage = rs.getBigDecimal(10);
				BigDecimal price = rs.getBigDecimal(11);
				String status = rs.getString(12);
				
				bikeModel bk = new bikeModel(bikeId, bikeimg, bikeName, brand, type, model, color, plateNumber, year, mileage, price, status);
				
				bike.add(bk);
				
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return bike;
	}
	
	
	
	//Get All Data
	public static List<bikeModel> getAllbikes() {
		
		ArrayList <bikeModel> bikes = new ArrayList<>();
		
		try {
			//DB Connection call
			con = vehiclesDBconnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "select * from bikes";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int bikeId = rs.getInt(1);
				String bikeimg = rs.getString(2);
				String bikeName = rs.getString(3);
				String brand = rs.getString(4);
				String type = rs.getString(5);
				String model = rs.getString(6);
				String color = rs.getString(7);
				String plateNumber = rs.getString(8);
				int year = rs.getInt(9);
				BigDecimal mileage = rs.getBigDecimal(10);
				BigDecimal price = rs.getBigDecimal(11);
				String status = rs.getString(12);
				
				bikeModel bk = new bikeModel(bikeId, bikeimg, bikeName, brand, type, model, color, plateNumber, year, mileage, price, status);
				
				bikes.add(bk);
				
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return bikes;
			
	}
	
	
	
	//Update Data
	public static boolean updatedata(String bikeId, String bikeimg, String bikeName, String brand, String type, String model, String color, String plateNumber, int year,  BigDecimal mileage, BigDecimal price, String status) {
		
		try {
			//DB Connection call
			con = vehiclesDBconnection.getConnection();
			stmt = con.createStatement();
			
			//SQL Query
			String sql = "update bikes set bikeimg='"+bikeimg+"', bikeName='"+bikeName+"', brand='"+brand+"', type='"+type+"', model='"+model+"', color='"+color+"', plateNumber='"+plateNumber+"', year='"+year+"', mileage='"+mileage+"', price='"+price+"', status='"+status+"' "
			+"where bikeId='"+bikeId+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	

	//Delete Data
	public static boolean deletedata(String Id) {
		int convID = Integer.parseInt(Id);
		
		try {
			//DB Connection call
			con = vehiclesDBconnection.getConnection();
			stmt = con.createStatement();
			
			String sql =  "delete from bikes where bikeId = '"+convID+"'";
			
			int rs =stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;

	}
}
	
