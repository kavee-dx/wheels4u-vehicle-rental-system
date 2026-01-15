package vehiclePackage;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class vanController {

	
	 //Connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	

	//Insert Data Function
	public static boolean insertdata(String vanimg, String vanName, String brand, String type, String model, String color, String plateNumber, int year, BigDecimal mileage, BigDecimal price, String status) {
		
		boolean isSuccess = false;
		
		try {
			//DB connection call
			con = vehiclesDBconnection.getConnection();
			stmt = con.createStatement();
			
			//SQL Query
			String sql = "insert into vans values (0, '"+vanimg+"', '"+vanName+"','"+brand+"','"+type+"','"+model+"','"+color+"','"+plateNumber+"','"+year+"','"+mileage+"','"+price+"','"+status+"')";
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
	public static List<vanModel> getById (String Id) {
		
		int convertedID = Integer.parseInt(Id);
		
		ArrayList <vanModel> van = new ArrayList<>();
		
		try {
			//DB Connection call
			con = vehiclesDBconnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "select * from vans where vanId = '"+convertedID+"'";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int vanId = rs.getInt(1);
				String vanimg = rs.getString(2);
				String vanName = rs.getString(3);
				String brand = rs.getString(4);
				String type = rs.getString(5);
				String model = rs.getString(6);
				String color = rs.getString(7);
				String plateNumber = rs.getString(8);
				int year = rs.getInt(9);
				BigDecimal mileage = rs.getBigDecimal(10);
				BigDecimal price = rs.getBigDecimal(11);
				String status = rs.getString(12);
				
				vanModel vn = new vanModel(vanId, vanimg, vanName, brand, type, model, color, plateNumber, year, mileage, price, status);
				
				van.add(vn);
				
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return van;
	}
	
	
	
	//Get All Data
	public static List<vanModel> getAllvans() {
		
		ArrayList <vanModel> vans = new ArrayList<>();
		
		try {
			//DB Connection call
			con = vehiclesDBconnection.getConnection();
			stmt = con.createStatement();
			
			//Query
			String sql = "select * from vans";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int vanId = rs.getInt(1);
				String vanimg = rs.getString(2);
				String vanName = rs.getString(3);
				String brand = rs.getString(4);
				String type = rs.getString(5);
				String model = rs.getString(6);
				String color = rs.getString(7);
				String plateNumber = rs.getString(8);
				int year = rs.getInt(9);
				BigDecimal mileage = rs.getBigDecimal(10);
				BigDecimal price = rs.getBigDecimal(11);
				String status = rs.getString(12);
				
				vanModel vn = new vanModel(vanId, vanimg, vanName, brand, type, model, color, plateNumber, year, mileage, price, status);
				
				vans.add(vn);
				
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return vans;
			
	}
	
	
	
	//Update Data
	public static boolean updatedata(String vanId, String vanimg, String vanName, String brand, String type, String model, String color, String plateNumber, int year,  BigDecimal mileage, BigDecimal price, String status) {
		
		try {
			//DB Connection call
			con = vehiclesDBconnection.getConnection();
			stmt = con.createStatement();
			
			//SQL Query
			String sql = "update vans set vanimg='"+vanimg+"', vanName='"+vanName+"', brand='"+brand+"', type='"+type+"', model='"+model+"', color='"+color+"', plateNumber='"+plateNumber+"', year='"+year+"', mileage='"+mileage+"', price='"+price+"', status='"+status+"' "
			+"where vanId='"+vanId+"'";
			
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
			
			String sql =  "delete from vans where vanId = '"+convID+"'";
			
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
