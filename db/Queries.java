package db;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Queries 
{
    // Methods to retrieve data for dropdowns and tables in the UI
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

            if (brands.isEmpty())
            {
                brands.add("No data");
            }
        } 
        catch (Exception e) 
        {
            System.err.println("Database error in getBrands(): "
                            + e.getMessage());
        }

        return brands;
    }

    // Get models based on selected brand
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

            if (models.isEmpty())
            {
                models.add("No data");
            }
        } 
        catch (Exception e) 
        {
            System.err.println("Database error in getModelsByBrand(): "
                            + e.getMessage());
        }

        return models;
    }

    // Get vehicles based on selected model
    public static List<String[]> getVehiclesByModel(String modelName) 
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
            WHERE m.name = ?
            ORDER BY d.name, v.year DESC;
            """;

        try (Connection conn = Database.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, modelName);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) 
            {
                results.add(new String[]{
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
                });
            }

            if (results.isEmpty())
            {
                results.add(new String[]{"No data"});
            }

        } 
        catch (Exception e) 
        {
            System.err.println("Database error in getVehiclesByModel(): "
                            + e.getMessage());
        }
        
        return results;
    }


    // Get colors for dropdown
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

            if (colors.isEmpty())
            {
                colors.add("No data");
            }
        } 
        catch (Exception e) 
        {
            System.err.println("Database error in getColors(): "
                            + e.getMessage());
        }

        return colors;
    }

    // Get body styles for dropdown
    public static List<String> getBodyStyles() 
    {
        List<String> styles = new ArrayList<>();

        String sql = "SELECT description FROM BodyStyle ORDER BY description";

        try (Connection conn = Database.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) 
        {
            while (rs.next()) 
            {
                styles.add(rs.getString("description"));
            }

            if (styles.isEmpty())
            {
                styles.add("No data");
            }

        } 
        catch (Exception e) 
        {
            System.err.println("Database error in getBodyStyles(): "
                            + e.getMessage());
        }

        return styles;
    }

    // Get engines for dropdown
    public static List<String> getEngines() 
    {
        List<String> engines = new ArrayList<>();

        String sql = "SELECT type FROM Engine ORDER BY type";

        try (Connection conn = Database.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) 
        {
            while (rs.next()) 
            {
                engines.add(rs.getString("type"));
            }

            if (engines.isEmpty())
            {
                engines.add("No data");
            }

        } 
        catch (Exception e) 
        {
            System.err.println("Database error in getEngines(): "
                            + e.getMessage());
        }

        return engines;
    }
    
    // Get cars in inventory based on search criteria
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
            PreparedStatement stmt = conn.prepareStatement(sql)) 
        {
            stmt.setString(1, brand);
            stmt.setString(2, model);
            stmt.setString(3, color);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) 
            {
                String[] row = 
                {
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
            System.err.println("Database error in searchInventory(): "
                            + e.getMessage());
        }

        return results;
    }

    // Report generation methods
    public static String[] getReportColumns(String reportName) 
    {
        return switch (reportName) 
        {
            case "Sales Trends (Year/Month/Week)" ->
                new String[]{"Year", "Month", "Week", "Total Sales"};

            case "Sales by Gender" ->
                new String[]{"Gender", "Total Sales"};

            case "Sales by Income Range" ->
                new String[]{"Income Range", "Total Sales"};

            case "Top 2 Brands by Dollar Sales" ->
                new String[]{"Brand", "Total Revenue"};

            case "Top 2 Brands by Unit Sales" ->
                new String[]{"Brand", "Units Sold"};

            case "Best Month for Convertibles" ->
                new String[]{"Month", "Units Sold"};

            case "Dealers with Longest Inventory Time" ->
                new String[]{"Dealer", "Average Days in Inventory"};

            default -> new String[]{"Result"};
        };
    }

    // Run the selected report and return results
    public static List<String[]> runReport(String reportName) 
    {
        return switch (reportName) 
        {
            case "Sales Trends (Year/Month/Week)" ->
                reportSalesTrends();

            case "Sales by Gender" ->
                reportSalesByGender();

            case "Sales by Income Range" ->
                reportSalesByIncome();

            case "Top 2 Brands by Dollar Sales" ->
                reportTopBrandsByRevenue();

            case "Top 2 Brands by Unit Sales" ->
                reportTopBrandsByUnits();

            case "Best Month for Convertibles" ->
                reportBestMonthForConvertibles();

            case "Dealers with Longest Inventory Time" ->
                reportLongestInventoryTime();

            default -> new ArrayList<>();
        };
    }

    // Sales by trends report
    private static List<String[]> reportSalesTrends() 
    {
        List<String[]> rows = new ArrayList<>();

        String sql = """
            SELECT 
                EXTRACT(YEAR FROM sale_date) AS year,
                EXTRACT(MONTH FROM sale_date) AS month,
                EXTRACT(WEEK FROM sale_date) AS week,
                COUNT(*) AS units_sold
            FROM Sales
            GROUP BY year, month, week
            ORDER BY year, month, week;
            """;

        try (Connection conn = Database.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) 
        {
            while (rs.next()) 
            {
                rows.add(new String[]
                    {
                        rs.getString("year"),
                        rs.getString("month"),
                        rs.getString("week"),
                        rs.getString("units_sold")
                    });
            }
        }
        catch (Exception e) 
        {
            System.err.println("Database error in reportSalesTrends(): "
                            + e.getMessage());
        }
        
        return rows;
    }

    // Sales by gender report
    private static List<String[]> reportSalesByGender() 
    {
        List<String[]> rows = new ArrayList<>();

        String sql = """
            SELECT 
                c.gender,
                COUNT(*) AS total_sales
            FROM Sales s
            JOIN Customer c ON s.customer_id = c.customer_id
            GROUP BY c.gender;
            """;

        try (Connection conn = Database.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) 
        {
            while (rs.next()) 
            {
                rows.add(new String[]{
                    rs.getString("gender"),
                    rs.getString("total_sales")
                });
            }
        }
        catch (Exception e) 
        {
            System.err.println("Database error in reportSalesByGender(): "
                            + e.getMessage());
        }
        
        return rows;
    }

    // Sales by income range report
    private static List<String[]> reportSalesByIncome() 
    {
        List<String[]> rows = new ArrayList<>();

        String sql = """
            SELECT 
                CASE 
                    WHEN c.income < 40000 THEN '< 40k'
                    WHEN c.income BETWEEN 40000 AND 80000 THEN '40k - 80k'
                    WHEN c.income BETWEEN 80000 AND 120000 THEN '80k - 120k'
                    ELSE '> 120k'
                END AS income_range,
                COUNT(*) AS total_sales
            FROM Sales s
            JOIN Customer c ON s.customer_id = c.customer_id
            GROUP BY income_range
            ORDER BY income_range;
            """;

        try (Connection conn = Database.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) 
        {
            while (rs.next())
            {
                rows.add(new String[]{
                    rs.getString("income_range"),
                    rs.getString("total_sales")
                });
            }
        }
        catch (Exception e) 
        {
            System.err.println("Database error in reportSalesByIncome(): "
                            + e.getMessage());
        }
        
        return rows;
    }

    // Top brands by revenue report
    private static List<String[]> reportTopBrandsByRevenue() 
    {
        List<String[]> rows = new ArrayList<>();

        String sql = """
            SELECT 
                b.name AS brand,
                SUM(s.price) AS total_revenue
            FROM Sales s
            JOIN Vehicle v ON s.VIN = v.VIN
            JOIN Model m ON v.model_id = m.model_id
            JOIN Brand b ON m.brand_id = b.brand_id
            GROUP BY b.name
            ORDER BY total_revenue DESC
            LIMIT 2;
            """;

        try (Connection conn = Database.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) 
        {
            while (rs.next()) 
            {
                rows.add(new String[]{
                    rs.getString("brand"),
                    rs.getString("total_revenue")
                });
            }
        }
        catch (Exception e) 
        {
            System.err.println("Database error in reportTopBrandsByRevenue(): "
                            + e.getMessage());
        }
        
        return rows;
    }

    // Top brands by units sold report
    private static List<String[]> reportTopBrandsByUnits() 
    {
        List<String[]> rows = new ArrayList<>();

        String sql = """
            SELECT 
                b.name AS brand,
                COUNT(*) AS units_sold
            FROM Sales s
            JOIN Vehicle v ON s.VIN = v.VIN
            JOIN Model m ON v.model_id = m.model_id
            JOIN Brand b ON m.brand_id = b.brand_id
            GROUP BY b.name
            ORDER BY units_sold DESC
            LIMIT 2;
            """;

        try (Connection conn = Database.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) 
        {
            while (rs.next()) 
            {
                rows.add(new String[]{
                    rs.getString("brand"),
                    rs.getString("units_sold")
                });
            }
        } 
        catch (Exception e) 
        {
            System.err.println("Database error in reportTopBrandsByUnits(): "
                            + e.getMessage());
        }
        
        return rows;
    }

    // Best month for convertibles report
    private static List<String[]> reportBestMonthForConvertibles() 
    {
        List<String[]> rows = new ArrayList<>();

        String sql = """
            SELECT 
                EXTRACT(MONTH FROM s.sale_date) AS month,
                COUNT(*) AS units_sold
            FROM Sales s
            JOIN Vehicle v ON s.VIN = v.VIN
            JOIN BodyStyle bs ON v.body_style_id = bs.body_style_id
            WHERE bs.description = 'convertible'
            GROUP BY month
            ORDER BY units_sold DESC;
            """;

        try (Connection conn = Database.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) 
        {
                while (rs.next()) 
                {
                    rows.add(new String[]{
                        rs.getString("month"),
                        rs.getString("units_sold")
                    });
                }
        }
        catch (Exception e) 
        {
            System.err.println("Database error in reportBestMonthForConvertibles(): "
                            + e.getMessage());
        }
        
        return rows;
    }

    // Dealers with longest inventory time report
    private static List<String[]> reportLongestInventoryTime() 
    {
        List<String[]> rows = new ArrayList<>();

        String sql = """
            SELECT 
                d.name AS dealer,
                AVG(s.sale_date - i.date_arrived) AS avg_days
            FROM Sales s
            JOIN Inventory i ON s.VIN = i.VIN
            JOIN Dealer d ON i.dealer_id = d.dealer_id
            WHERE i.date_arrived IS NOT NULL
            GROUP BY d.name
            ORDER BY avg_days DESC;
            """;

        try (Connection conn = Database.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) 
        {
            while (rs.next())
            {
                rows.add(new String[]{
                    rs.getString("dealer"),
                    rs.getString("avg_days")
                });
            }
        }
        catch (Exception e)
        {
            System.err.println("Database error in reportLongestInventoryTime(): "
                            + e.getMessage());
        }
        
        return rows;
    }
    
}
