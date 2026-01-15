package userManagement;

public class UserModel {
    private int id; // auto-incremented primary key
    private String fullName;
    private String contactNumber;
    private String email;
    private String password;

    // Default constructor
    public UserModel() {}

    // Constructor for inserting new users (without id)
    public UserModel(String fullName, String contactNumber, String email, String password) {
        this.fullName = fullName;
        this.contactNumber = contactNumber;
        this.email = email;
        this.password = password;
    }

    // Constructor for fetching users from DB (with id)
    public UserModel(int id, String fullName, String contactNumber, String email, String password) {
        this.id = id;
        this.fullName = fullName;
        this.contactNumber = contactNumber;
        this.email = email;
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

    public String getContactNumber() {
        return contactNumber;
    }
    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
