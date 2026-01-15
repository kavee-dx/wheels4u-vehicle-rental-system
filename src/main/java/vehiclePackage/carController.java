package vehiclePackage;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class carController {
	
	 //Connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	

	//Insert Data Function
	public static boolean insertdata(String carimg, String carName, String brand, String type, String model, String color, String plateNumber, int year, BigDecimal mileage, BigDecimal price, String status) {
		
		boolean isSuccess = false;
		
		try {
			//DB connection call
			con = vehiclesDBconnection.getConnection();
			stmt = con.createStatement();
			
			//SQL Query
			String sql = "insert into cars values (0, '"+carimg+"', '"+carName+"','"+brand+"','"+type+"','"+model+"','"+color+"','"+plateNumber+"','"+year+"','"+mileage+"','"+price+"','"+status+"')";
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
	public static List<carModel> getById (String Id) {
		
		int convertedID = Integer.parseInt(Id);
		
		ArrayList <carModel> car = new ArrayList<>();
		
		try {
			//DB Connection call
			con = vehiclesDBconnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "select * from cars where carId = '"+convertedID+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int carId = rs.getInt(1);
				String carimg = rs.getString(2);
				String carName = rs.getString(3);
				String brand = rs.getString(4);
				String type = rs.getString(5);
				String model = rs.getString(6);
				String color = rs.getString(7);
				String plateNumber = rs.getString(8);
				int year = rs.getInt(9);
				BigDecimal mileage = rs.getBigDecimal(10);
				BigDecimal price = rs.getBigDecimal(11);
				String status = rs.getString(12);
				
				carModel cr = new carModel(carId, carimg, carName, brand, type, model, color, plateNumber, year, mileage, price, status);
				
				car.add(cr);
				
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return car;
	}
	
	
	
	//Get All Data
	public static List<carModel> getAllcars() {
		
		ArrayList <carModel> cars = new ArrayList<>();
		
		try {
			//DB Connection call
			con = vehiclesDBconnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "select * from cars";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int carId = rs.getInt(1);
				String carimg = rs.getString(2);
				String carName = rs.getString(3);
				String brand = rs.getString(4);
				String type = rs.getString(5);
				String model = rs.getString(6);
				String color = rs.getString(7);
				String plateNumber = rs.getString(8);
				int year = rs.getInt(9);
				BigDecimal mileage = rs.getBigDecimal(10);
				BigDecimal price = rs.getBigDecimal(11);
				String status = rs.getString(12);
				
				carModel cr = new carModel(carId, carimg, carName, brand, type, model, color, plateNumber, year, mileage, price, status);
				
				cars.add(cr);
				
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return cars;
			
	}
	
	
	
	//Update Data
	public static boolean updatedata(String carId, String carimg, String carName, String brand, String type, String model, String color, String plateNumber, int year,  BigDecimal mileage, BigDecimal price, String status) {
		
		try {
			//DB Connection call
			con = vehiclesDBconnection.getConnection();
			stmt = con.createStatement();
			
			//SQL Query
			String sql = "update cars set carimg='"+carimg+"', carName='"+carName+"', brand='"+brand+"', type='"+type+"', model='"+model+"', color='"+color+"', plateNumber='"+plateNumber+"', year='"+year+"', mileage='"+mileage+"', price='"+price+"', status='"+status+"' "
			+"where carId='"+carId+"'";
			
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
			
			String sql =  "delete from cars where carId = '"+convID+"'";
			
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
