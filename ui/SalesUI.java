package ui;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;
import db.Queries;

public class SalesUI extends JFrame {

    private JComboBox<String> reportBox;
    private JTable resultsTable;

    public SalesUI() {
        setTitle("Sales / OLAP Reports");
        setSize(900, 600);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        // Top panel
        JPanel topPanel = new JPanel(new FlowLayout());

        reportBox = new JComboBox<>();
        loadReports();

        JButton runBtn = new JButton("Run Report");
        runBtn.setFont(new Font("Arial", Font.BOLD, 16));
        runBtn.addActionListener(e -> runSelectedReport());
        
        JButton closeButton = new JButton("Close Window");
        closeButton.setFont(new Font("Georgia", Font.BOLD, 16));
        closeButton.addActionListener(e -> dispose());

        topPanel.add(new JLabel("Select Report:"));
        topPanel.add(reportBox);
        topPanel.add(runBtn);
        topPanel.add(closeButton);

        // Table
        resultsTable = new JTable();
        JScrollPane scrollPane = new JScrollPane(resultsTable);

        // Layout
        setLayout(new BorderLayout(10, 10));
        add(topPanel, BorderLayout.NORTH);
        add(scrollPane, BorderLayout.CENTER);

        setVisible(true);
    }

    private void loadReports() {
        reportBox.addItem("Sales Trends (Year/Month/Week)");
        reportBox.addItem("Sales by Gender");
        reportBox.addItem("Sales by Income Range");
        reportBox.addItem("Top 2 Brands by Dollar Sales");
        reportBox.addItem("Top 2 Brands by Unit Sales");
        reportBox.addItem("Best Month for Convertibles");
        reportBox.addItem("Dealers with Longest Inventory Time");
    }

    private void runSelectedReport() {
        String report = (String) reportBox.getSelectedItem();
        if (report == null) return;

        // Ask Queries class for results
        List<String[]> rows = Queries.runReport(report);
        String[] columns = Queries.getReportColumns(report);

        DefaultTableModel model = new DefaultTableModel(columns, 0);

        for (String[] row : rows) {
            model.addRow(row);
        }

        resultsTable.setModel(model);
    }
}
