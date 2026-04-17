package db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Queries 
{

    public static List<String> getBrands() 
    {
        List<String> brands = new ArrayList<>();

        String sql = "SELECT name FROM Brand ORDER BY name";

        try (Connection conn = Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery())
        {

            while (rs.next()) 
                {
                brands.add(rs.getString("name"));
            }

        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }

        return brands;
    }

    public static List<String> getModelsByBrand(String brandName) 
    {
        List<String> models = new ArrayList<>();

        String sql = """
            SELECT m.name
            FROM Model m
            JOIN Brand b ON m.brand_id = b.brand_id
            WHERE b.name = ?
            ORDER BY m.name
        """;

        try (Connection conn = Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) 
        {

            stmt.setString(1, brandName);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) 
            {
                models.add(rs.getString("name"));
            }

        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }

        return models;
    }

    public static List<String> getColors() 
    {
        List<String> colors = new ArrayList<>();

        String sql = "SELECT name FROM Color ORDER BY name";

        try (Connection conn = Database.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) 
        {

            while (rs.next()) 
            {
                colors.add(rs.getString("name"));
            }

        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }

        return colors;
    }

    public static List<String> getBodyStyles() 
    {
    List<String> styles = new ArrayList<>();

    String sql = "SELECT description FROM BodyStyle ORDER BY description";

    try (Connection conn = Database.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {

        while (rs.next()) {
            styles.add(rs.getString("description"));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return styles;
}

    public static List<String> getEngines() 
    {
        List<String> engines = new ArrayList<>();

        String sql = "SELECT type FROM Engine ORDER BY type";

        try (Connection conn = Database.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                engines.add(rs.getString("type"));
            }

        } 
        catch (Exception e) 
        {
        e.printStackTrace();
        }

        return engines;
    }

    public static List<String[]> searchInventory(String brand, String model, String color) 
    {
        List<String[]> results = new ArrayList<>();

        String sql = """
            SELECT 
                v.VIN,
                b.name AS brand,
                m.name AS model,
                v.year,
                c.name AS color,
                bs.description AS body_style,
                e.type AS engine,
                t.type AS transmission,
                d.name AS dealer,
                i.status
            FROM Vehicle v
            JOIN Model m ON v.model_id = m.model_id
            JOIN Brand b ON m.brand_id = b.brand_id
            JOIN Color c ON v.color_id = c.color_id
            JOIN BodyStyle bs ON v.body_style_id = bs.body_style_id
            JOIN Engine e ON v.engine_id = e.engine_id
            JOIN Transmission t ON v.transmission_id = t.transmission_id
            JOIN Inventory i ON v.VIN = i.VIN
            JOIN Dealer d ON i.dealer_id = d.dealer_id
            WHERE b.name = ?
                AND m.name = ?
                AND c.name = ?
            ORDER BY d.name, v.year DESC
            """;

        try (Connection conn = Database.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, brand);
            stmt.setString(2, model);
            stmt.setString(3, color);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String[] row = {
                    rs.getString("VIN"),
                    rs.getString("brand"),
                    rs.getString("model"),
                    rs.getString("year"),
                    rs.getString("color"),
                    rs.getString("body_style"),
                    rs.getString("engine"),
                    rs.getString("transmission"),
                    rs.getString("dealer"),
                    rs.getString("status")
                };
                results.add(row);
            }

        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }

        return results;
    }


}
