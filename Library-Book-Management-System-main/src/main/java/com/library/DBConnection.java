package com.library;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection con = null;
        try {
            // 1. Load the MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2. Connect to the Database
            // Format: "jdbc:mysql://localhost:3306/YOUR_DB_NAME", "USERNAME", "PASSWORD"
            String url = "jdbc:mysql://localhost:3306/library_db";
            String user = "root";
            String password = "Admin";

            con = DriverManager.getConnection(url, user, password);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}