package driverEdit;

import java.time.LocalDate;

public class vehicleModel {
    private int id; // Added primary key field
    private String fullName;
    private String email;
    private String phone;
    private String licenseNumber;
    private LocalDate licenseExpiryDate; // Using LocalDate instead of String
    private String vehicleAssigned;
    private String address;
    private byte[] profilePicture; // For storing image as binary
    private String password;

    // Parameterized constructor
    public vehicleModel(int id, String fullName, String email, String phone, String licenseNumber, 
                        LocalDate licenseExpiryDate, String vehicleAssigned, String address, 
                        byte[] profilePicture, String password) {
        super();
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.licenseNumber = licenseNumber;
        this.licenseExpiryDate = licenseExpiryDate;
        this.vehicleAssigned = vehicleAssigned;
        this.address = address;
        this.profilePicture = profilePicture;
        this.password = password;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public LocalDate getLicenseExpiryDate() {
        return licenseExpiryDate;
    }

    public void setLicenseExpiryDate(LocalDate licenseExpiryDate) {
        this.licenseExpiryDate = licenseExpiryDate;
    }

    public String getVehicleAssigned() {
        return vehicleAssigned;
    }

    public void setVehicleAssigned(String vehicleAssigned) {
        this.vehicleAssigned = vehicleAssigned;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public byte[] getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(byte[] profilePicture) {
        this.profilePicture = profilePicture;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}