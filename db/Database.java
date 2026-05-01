package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database 
{

    private static final String URL = "jdbc:postgresql://localhost:5432/dealership";
    private static final String USER = "postgres";
    private static final String PASSWORD = "Mejor@ElMund017$"; // You need to type your personal password

    public static Connection getConnection() {
        try
        {
            Class.forName("org.postgresql.Driver");
            System.out.println("Connecting to database");
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Connection successful");
            return conn;
        } 
        catch (Exception e) 
        {
            System.out.println("Connection failed");
            e.printStackTrace();
            return null;
        }
    }
}

