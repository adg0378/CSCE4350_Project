package ui;

import db.Queries;
import java.awt.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

public class CustomerUI extends JFrame
{
    // UI components
    private JComboBox<String> brandBox;
    private JComboBox<String> modelBox;
    private JTable vehicleTable;

    public CustomerUI()
    {
        // Customer Menu window
        setTitle("Customer Menu");
        setSize(800, 600);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        // Top panel for brand and model
        JPanel topPanel = new JPanel();
        topPanel.setLayout(new GridLayout(2, 2, 10, 10));

        brandBox = new JComboBox<>();
        modelBox = new JComboBox<>();

        topPanel.add(new JLabel("Brand: "));
        topPanel.add(brandBox);
        topPanel.add(new JLabel("Model: "));
        topPanel.add(modelBox);

        // Load initial data
        loadBrands();

        brandBox.addActionListener(e -> loadModels());
        modelBox.addActionListener(e -> loadVehicles());

        // Table for displaying vehicles
        vehicleTable = new JTable();
        JScrollPane scrollPane = new JScrollPane(vehicleTable);

        // Main layout
        setLayout(new BorderLayout(10, 10));
        add(topPanel, BorderLayout.NORTH);
        add(scrollPane, BorderLayout.CENTER);
        setVisible(true);
    }

    private void loadBrands()
    {
        // Connect to DB and load brands into brandBox
        brandBox.removeAllItems();

        for (String brand : Queries.getBrands())
        {
            brandBox.addItem(brand);
        }
    }

    private void loadModels()
    {
        modelBox.removeAllItems();
        String selectedBrand = (String) brandBox.getSelectedItem();

        if (selectedBrand == null)
        {
            return;
        }

        for (String model: Queries.getModelsByBrand(selectedBrand))
        {
            modelBox.addItem(model);
        }
    }

    private void loadVehicles()
    {
        String selectedModel = (String) modelBox.getSelectedItem();

        if(selectedModel == null)
        {
            return;
        }

        // Simulated data - replace with DB queries
        String[][] data = {
            {"1G1ZD5ST3JF100001", selectedModel, "Red", "Automatic", "V6", "2020", "Dallas Auto Mall"},
            {"1G1ZD5ST3JF100002", selectedModel, "Black", "Manual", "V4", "2021", "McKinney Motors"}
        };
        String[] columns = {"VIN", "Model", "Color", "Transmission", "Engine", "Year", "Dealer"};

        vehicleTable.setModel(new DefaultTableModel(data, columns));
    }
}