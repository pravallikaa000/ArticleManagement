package com.article;

import com.opensymphony.xwork2.ActionSupport;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminLoginAction extends ActionSupport {

    private String userName;
    private String password;

    public String execute() {
        Connection connection = null;
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            // Replace the following with your database URL, username, and password
            String dbUrl = "jdbc:mysql://localhost:3306/Articles";
            String dbUser = "root";
            String dbPassword = "pravallika";
            connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // Query to check admin credentials
            String query = "SELECT * FROM AdminLogin WHERE username=? AND password=?";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, userName);
                statement.setString(2, password);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        // Admin credentials are valid
                        return SUCCESS;
                    } else {
                        addActionError("Invalid admin credentials");
                        return INPUT;
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle database connection or query errors
            e.printStackTrace();
            return ERROR;
        } finally {
            // Close the database connection in the 'finally' block
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    // Getter and setter methods for userName and password

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
