package vehiclePackage;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class busController {
	
	//Connect DB
			private static boolean isSuccess;
			private static Connection con = null;
			private static Statement stmt = null;
			private static ResultSet rs = null;

			

			//Insert Data Function
			public static boolean insertdata(String busimg, String busName, String brand, String type, String model, String color, String plateNumber, int year, BigDecimal mileage, BigDecimal price, String status) {
				
				boolean isSuccess = false;
				
				try {
					//DB connection call
					con = vehiclesDBconnection.getConnection();
					stmt = con.createStatement();
					
					//SQL Query
					String sql = "insert into buses values (0, '"+busimg+"', '"+busName+"','"+brand+"','"+type+"','"+model+"','"+color+"','"+plateNumber+"','"+year+"','"+mileage+"','"+price+"','"+status+"')";
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
			public static List<busModel> getById (String Id) {
				
				int convertedID = Integer.parseInt(Id);
				
				ArrayList <busModel> bus = new ArrayList<>();
				
				try {
					//DB Connection call
					con = vehiclesDBconnection.getConnection();
					stmt = con.createStatement();
					
					//Query
					String sql = "select * from buses where busId = '"+convertedID+"'";
					
					rs = stmt.executeQuery(sql);
					
					while(rs.next()) {
						int busId = rs.getInt(1);
						String busimg = rs.getString(2);
						String busName = rs.getString(3);
						String brand = rs.getString(4);
						String type = rs.getString(5);
						String model = rs.getString(6);
						String color = rs.getString(7);
						String plateNumber = rs.getString(8);
						int year = rs.getInt(9);
						BigDecimal mileage = rs.getBigDecimal(10);
						BigDecimal price = rs.getBigDecimal(11);
						String status = rs.getString(12);
						
						busModel bs = new busModel(busId, busimg, busName, brand, type, model, color, plateNumber, year, mileage, price, status);
						
						bus.add(bs);
						
					}
					
				}
				catch (Exception e) {
					e.printStackTrace();
				}
				
				return bus;
			}
			
			
			
			//Get All Data
			public static List<busModel> getAllbuses() {
				
				ArrayList <busModel> buses = new ArrayList<>();
				
				try {
					//DB Connection call
					con = vehiclesDBconnection.getConnection();
					stmt = con.createStatement();
					
					//Query
					String sql = "select * from buses";
					
					rs = stmt.executeQuery(sql);
					
					while(rs.next()) {
						int busId = rs.getInt(1);
						String busimg = rs.getString(2);
						String busName = rs.getString(3);
						String brand = rs.getString(4);
						String type = rs.getString(5);
						String model = rs.getString(6);
						String color = rs.getString(7);
						String plateNumber = rs.getString(8);
						int year = rs.getInt(9);
						BigDecimal mileage = rs.getBigDecimal(10);
						BigDecimal price = rs.getBigDecimal(11);
						String status = rs.getString(12);
						
						busModel bs = new busModel(busId, busimg, busName, brand, type, model, color, plateNumber, year, mileage, price, status);
						
						buses.add(bs);
						
					}
					
				}
				catch (Exception e) {
					e.printStackTrace();
				}
				
				return buses;
					
			}
			
			
			
			//Update Data
			public static boolean updatedata(String busId, String busimg, String busName, String brand, String type, String model, String color, String plateNumber, int year,  BigDecimal mileage, BigDecimal price, String status) {
				
				try {
					//DB Connection call
					con = vehiclesDBconnection.getConnection();
					stmt = con.createStatement();
					
					//SQL Query
					String sql = "update buses set busimg='"+busimg+"', busName='"+busName+"', brand='"+brand+"', type='"+type+"', model='"+model+"', color='"+color+"', plateNumber='"+plateNumber+"', year='"+year+"', mileage='"+mileage+"', price='"+price+"', status='"+status+"' "
					+"where busId='"+busId+"'";
					
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
					
					String sql =  "delete from buses where busId = '"+convID+"'";
					
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
