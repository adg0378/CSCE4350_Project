package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database 
{

    private static final String URL = "jdbc:postgresql://localhost:5432/dealership";
    private static final String USER = "postgres";
    private static final String PASSWORD = "password used to connect to the database"; // You need to type your personal password

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

