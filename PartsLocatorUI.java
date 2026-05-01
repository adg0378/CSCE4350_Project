package ui;

import db.Queries;
import java.awt.*;
import java.util.List;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

public class PartsLocatorUI extends JFrame
{
    private JComboBox<String> supplierBox;
    private JComboBox<String> partTypeBox;
    private JTextField startDateField;
    private JTextField endDateField;
    private JTable resultsTable;

    public PartsLocatorUI()
    {
        setTitle("Parts Locator");
        setSize(900, 600);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        JPanel topPanel = new JPanel(new GridLayout(3, 4, 10, 10));

        supplierBox = new JComboBox<>();
        partTypeBox = new JComboBox<>();
        startDateField = new JTextField("2020-01-01");
        endDateField = new JTextField("2023-12-31");

        loadSuppliers();
        loadPartTypes();

        JButton searchButton = new JButton("Search Parts");
        searchButton.setFont(new Font("Georgia", Font.BOLD, 16));
        searchButton.addActionListener(e -> searchParts());

        JButton closeButton = new JButton("Close Window");
        closeButton.setFont(new Font("Georgia", Font.BOLD, 16));
        closeButton.addActionListener(e -> dispose());

        topPanel.add(new JLabel("Supplier:"));
        topPanel.add(new JLabel("Part Type:"));
        topPanel.add(new JLabel("Start Date:"));
        topPanel.add(new JLabel("End Date:"));

        topPanel.add(supplierBox);
        topPanel.add(partTypeBox);
        topPanel.add(startDateField);
        topPanel.add(endDateField);

        topPanel.add(new JLabel(""));
        topPanel.add(searchButton);
        topPanel.add(closeButton);
        topPanel.add(new JLabel(""));

        resultsTable = new JTable();
        JScrollPane scrollPane = new JScrollPane(resultsTable);

        setLayout(new BorderLayout(10, 10));
        add(topPanel, BorderLayout.NORTH);
        add(scrollPane, BorderLayout.CENTER);

        setVisible(true);
    }

    private void loadSuppliers()
    {
        supplierBox.removeAllItems();

        for (String supplier : Queries.getSuppliers())
        {
            supplierBox.addItem(supplier);
        }
    }

    private void loadPartTypes()
    {
        partTypeBox.removeAllItems();

        for (String partType : Queries.getPartTypes())
        {
            partTypeBox.addItem(partType);
        }
    }

    private void searchParts()
    {
        String supplier = (String) supplierBox.getSelectedItem();
        String partType = (String) partTypeBox.getSelectedItem();
        String startDate = startDateField.getText();
        String endDate = endDateField.getText();

        List<String[]> rows = Queries.searchPartsLocator(
            supplier,
            partType,
            startDate,
            endDate
        );

        String[] columns =
        {
            "VIN", "Customer", "Sale Date", "Part Type", "Supplier", "Date Made"
        };

        DefaultTableModel model = new DefaultTableModel(columns, 0);

        if (rows.isEmpty())
        {
            model.addRow(new String[]{"No matching vehicles found"});
        }
        else
        {
            for (String[] row : rows)
            {
                model.addRow(row);
            }
        }

        resultsTable.setModel(model);
    }
}