package ui;

import db.Queries;
import java.awt.*;
import java.util.List;
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
        topPanel.setLayout(new GridLayout(2, 3, 10, 10));

        brandBox = new JComboBox<>();
        modelBox = new JComboBox<>();
        modelBox.addItem("Select a brand first");
        
        JButton closeButton = new JButton("Close Window");
        closeButton.setFont(new Font("Georgia", Font.BOLD, 16));
        closeButton.addActionListener(e -> dispose());

        topPanel.add(new JLabel("Brand:"));
        topPanel.add(brandBox);
        topPanel.add(closeButton);
        topPanel.add(new JLabel("Model:"));
        topPanel.add(modelBox);
        topPanel.add(new JLabel(""));

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

        List<String[]> rows = Queries.getVehiclesByModel(selectedModel);
        
        String[] columns = {"VIN", "Brand", "Model", "Year",
                            "Color", "Body Style", "Engine",
                            "Transmission", "Dealer", "Status"
                        };
        
        DefaultTableModel tableModel = new DefaultTableModel(columns, 0);

        for (String[] row : rows)
        {
            tableModel.addRow(row);
        }

        vehicleTable.setModel(tableModel);
    }
}