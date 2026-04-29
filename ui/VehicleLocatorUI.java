package ui;

import db.Queries;
import java.awt.*;
import java.util.List;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

public class VehicleLocatorUI extends JFrame 
{

    private JComboBox<String> brandBox;
    private JComboBox<String> modelBox;
    private JComboBox<String> colorBox;
    private JTable resultsTable;

    public VehicleLocatorUI() 
    {
        setTitle("Vehicle Locator Service");
        setSize(900, 600);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        // Top panel
        JPanel topPanel = new JPanel(new GridLayout(3, 3, 10, 10));

        brandBox = new JComboBox<>();

        modelBox = new JComboBox<>();
        modelBox.addItem("Select a brand first");

        colorBox = new JComboBox<>();
        colorBox.addItem("Select a color");

        // Search and close window buttons
        JButton searchButton = new JButton("Search Inventory");
        searchButton.setFont(new Font("Georgia", Font.BOLD, 16));
        searchButton.addActionListener(e -> searchVehicles());

        JButton closeButton = new JButton("Close Window");
        closeButton.setFont(new Font("Georgia", Font.BOLD, 16));
        closeButton.addActionListener(e -> dispose());

        topPanel.add(new JLabel("Brand:"));
        topPanel.add(new JLabel("Model:"));
        topPanel.add(new JLabel("Color:"));

        topPanel.add(brandBox);
        topPanel.add(modelBox);
        topPanel.add(colorBox);
        topPanel.add(new JLabel(""));
        topPanel.add(searchButton);
        topPanel.add(closeButton);

        // Load dropdowns from database
        loadBrands();
        loadColors();

        brandBox.addActionListener(e -> loadModels());

        // Table
        resultsTable = new JTable();
        JScrollPane scrollPane = new JScrollPane(resultsTable);

        // Layout
        setLayout(new BorderLayout(10, 10));
        add(topPanel, BorderLayout.NORTH);
        add(scrollPane, BorderLayout.CENTER);

        setVisible(true);
    }

    // Load dropdowns from database
    private void loadBrands() 
    {
        brandBox.removeAllItems();
        for (String brand : Queries.getBrands()) 
        {
            brandBox.addItem(brand);
        }
    }

    private void loadModels() 
    {
        modelBox.removeAllItems();
        String brand = (String) brandBox.getSelectedItem();
        if (brand == null) return;

        for (String model : Queries.getModelsByBrand(brand)) 
        {
            modelBox.addItem(model);
        }
    }

    private void loadColors() 
    {
        colorBox.removeAllItems();
        for (String color : Queries.getColors()) 
        {
            colorBox.addItem(color);
        }
    }

    // Search vehicles
    private void searchVehicles() 
    {
        String brand = (String) brandBox.getSelectedItem();
        String model = (String) modelBox.getSelectedItem();
        String color = (String) colorBox.getSelectedItem();

        List<String[]> rows = Queries.searchInventory(brand, model, color);

        String[] columns = 
        {
            "VIN", "Brand", "Model", "Year", "Color",
            "Body Style", "Engine", "Transmission",
            "Dealer", "Status"
        };

        DefaultTableModel modelTable = new DefaultTableModel(columns, 0);

        if (rows.isEmpty())
        {
            modelTable.addRow(new String[]{"No vehicles found"});
        }
        else
        {
            for (String[] row : rows) 
            {
                modelTable.addRow(row);
            }
        }
        resultsTable.setModel(modelTable);
    }
}
