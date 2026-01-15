package Vehical.Rent.service;


import Vehical.Rent.model.ContactMessage;
import Vehical.Rent.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactMessageService {
    
    // Create Contact Message
    public boolean createContactMessage(ContactMessage message) {
        String query = "INSERT INTO respons (firstname, lastname, email, phone, message) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, message.getFirstname());
            stmt.setString(2, message.getLastname());
            stmt.setString(3, message.getEmail());
            stmt.setString(4, message.getPhone());
            stmt.setString(5, message.getMessage());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Contact Message by ID
    public ContactMessage getContactMessage(int id) {
        String query = "SELECT * FROM respons WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                ContactMessage message = new ContactMessage();
                message.setId(rs.getInt("id"));
                message.setFirstname(rs.getString("firstname"));
                message.setLastname(rs.getString("lastname"));
                message.setEmail(rs.getString("email"));
                message.setPhone(rs.getString("phone"));
                message.setMessage(rs.getString("message"));
                return message;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Contact Messages
    public List<ContactMessage> getAllContactMessages() {
        List<ContactMessage> messages = new ArrayList<>();
        String query = "SELECT * FROM respons";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                ContactMessage message = new ContactMessage();
                message.setId(rs.getInt("id"));
                message.setFirstname(rs.getString("firstname"));
                message.setLastname(rs.getString("lastname"));
                message.setEmail(rs.getString("email"));
                message.setPhone(rs.getString("phone"));
                message.setMessage(rs.getString("message"));
                messages.add(message);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return messages;
    }

    // Update Contact Message
    public boolean updateContactMessage(ContactMessage message) {
        String query = "UPDATE respons SET firstname = ?, lastname = ?, email = ?, phone = ?, message = ? WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, message.getFirstname());
            stmt.setString(2, message.getLastname());
            stmt.setString(3, message.getEmail());
            stmt.setString(4, message.getPhone());
            stmt.setString(5, message.getMessage());
            stmt.setInt(6, message.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Contact Message
    public boolean deleteContactMessage(int id) {
        String query = "DELETE FROM respons WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
