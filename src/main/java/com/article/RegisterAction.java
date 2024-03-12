package com.article;

import com.opensymphony.xwork2.ActionSupport;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterAction extends ActionSupport {

    private User user;

    public RegisterAction() {
        // Initialize the user object
        user = new User();
    }

    public String execute() {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            String dbUrl = "jdbc:mysql://localhost:3306/Articles";
            String dbUser = "root";
            String dbPassword = "pravallika";
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // Insert user details into the database
            String insertQuery = "INSERT INTO users (username, password) VALUES (?, ?)";
            statement = connection.prepareStatement(insertQuery);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword()); // In a real-world scenario, hash and salt the password

            // Execute the insert query
            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                // Registration successful
                System.out.println("User Registration Successful");
                return SUCCESS;
            } else {
                // Registration failed
                addActionError("Failed to register the user. Please try again.");
                return INPUT;
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle database connection or query errors
            e.printStackTrace();
            addActionError("Error connecting to the database");
            return ERROR;
        } finally {
            // Close the database connection and statement in the 'finally' block
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Getter and Setter methods fo user
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
