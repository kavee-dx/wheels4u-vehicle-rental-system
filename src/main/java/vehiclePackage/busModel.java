package vehiclePackage;

import java.math.BigDecimal;

public class busModel {
	
	private int busId;
	private String busimg;
	private String busName;
	private String brand;
	private String type;
	private String model;
	private String color;
	private String plateNumber;
	private int year;
	private BigDecimal mileage; //use DECIMAL data type in the database table 
	private BigDecimal price; //use DECIMAL data type in the database table
	private String status;
	
	
	
	public busModel(int busId, String busimg, String busName, String brand, String type, String model, String color,
			String plateNumber, int year, BigDecimal mileage, BigDecimal price, String status) {
		super();
		this.busId = busId;
		this.busimg = busimg;
		this.busName = busName;
		this.brand = brand;
		this.type = type;
		this.model = model;
		this.color = color;
		this.plateNumber = plateNumber;
		this.year = year;
		this.mileage = mileage;
		this.price = price;
		this.status = status;
	}


	//getters and setters

	public int getBusId() {
		return busId;
	}



	public void setBusId(int busId) {
		this.busId = busId;
	}



	public String getBusimg() {
		return busimg;
	}



	public void setBusimg(String busimg) {
		this.busimg = busimg;
	}



	public String getBusName() {
		return busName;
	}



	public void setBusName(String busName) {
		this.busName = busName;
	}



	public String getBrand() {
		return brand;
	}



	public void setBrand(String brand) {
		this.brand = brand;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getModel() {
		return model;
	}



	public void setModel(String model) {
		this.model = model;
	}



	public String getColor() {
		return color;
	}



	public void setColor(String color) {
		this.color = color;
	}



	public String getPlateNumber() {
		return plateNumber;
	}



	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}



	public int getYear() {
		return year;
	}



	public void setYear(int year) {
		this.year = year;
	}



	public BigDecimal getMileage() {
		return mileage;
	}



	public void setMileage(BigDecimal mileage) {
		this.mileage = mileage;
	}



	public BigDecimal getPrice() {
		return price;
	}



	public void setPrice(BigDecimal price) {
		this.price = price;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	

}
