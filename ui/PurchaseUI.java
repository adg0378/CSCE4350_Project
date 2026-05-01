package ui;

import db.Queries;
import java.awt.*;
import java.awt.event.KeyEvent;
import javax.swing.*;

import java.awt.event.KeyAdapter;

public class PurchaseUI extends JFrame {

    // UI components
    private JComboBox<String> customersBox;
    private JComboBox<String> dealershipBox;
    private JComboBox<String> vehicleBox;
    private JTextField priceField;


    public PurchaseUI() {

        // Purchase Menu window
        setTitle("Purchase Menu");
        setSize(800, 600);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        // Top panel for choosing customer, dealership, car, price, and purchase
        JPanel topPanel = new JPanel();
        topPanel.setLayout(new GridLayout(3, 3, 10, 10));

        customersBox = new JComboBox<>();
        loadCustomers();

        dealershipBox = new JComboBox<>();
        loadDealership();

        vehicleBox = new JComboBox<>();

        priceField = new JTextField();
        priceField.addKeyListener(new KeyAdapter() { // Do not accept other than numbers or delete key on priceField
            public void keyTyped(KeyEvent key) {
                char character = key.getKeyChar();

                if(!(Character.isDigit(character) || (character == KeyEvent.VK_BACK_SPACE) || (character == KeyEvent.VK_DELETE))) {
                    key.consume();
                }
            }
        });


        JButton purchaseButton = new JButton("Purchase");
        purchaseButton.setFont(new Font("Georgia", Font.BOLD, 16));

        JButton closeButton = new JButton("Close Window");
        closeButton.setFont(new Font("Georgia", Font.BOLD, 16));
        closeButton.addActionListener(e -> dispose());

        topPanel.add(new JLabel("Customer:"));
        topPanel.add(customersBox);
        topPanel.add(new JLabel("Dealership:"));
        topPanel.add(dealershipBox);
        topPanel.add(new JLabel("Vehicle:"));
        topPanel.add(vehicleBox);
        topPanel.add(new JLabel("Price:"));
        topPanel.add(priceField);
        topPanel.add(new JLabel(""));
        topPanel.add(purchaseButton);
        topPanel.add(closeButton);

        dealershipBox.addActionListener(e -> { // Load all vehicles available at a dealership if selected
            if (dealershipBox.getSelectedItem() != null) {
                loadVehicles();
            }
        });

        purchaseButton.addActionListener(e -> confirmPurchase());

        // Main layout
        setLayout(new BorderLayout(10, 10));
        add(topPanel, BorderLayout.NORTH);
        setVisible(true);
    }

    private void loadCustomers()
    {
        // Connect to DB and load customers into costumersBox
        customersBox.removeAllItems();

        customersBox.addItem("Select a customer first");
        for (String customer : Queries.getCustomers())
        {
            customersBox.addItem(customer);
        }
    }

    private void loadDealership()
    {
        //Load all dealerships into dealershipBox
        dealershipBox.removeAllItems();

        dealershipBox.addItem("Select a dealership first");
        for(String dealership : Queries.getDealerships()){
            dealershipBox.addItem(dealership);
        }
    }

    private void loadVehicles()
    {
        //Load all vehicles from a specific dealership into vehicleBox (if dealership selected)

        vehicleBox.removeAllItems();

        vehicleBox.addItem("Select a vehicle first");

        String selectedDealership = (String) dealershipBox.getSelectedItem();

        if (selectedDealership == null)
        {
            return;
        }

        for(String vehicle : Queries.getVehiclesByDealer(selectedDealership)){
            vehicleBox.addItem(vehicle);
        }
    }

    private void confirmPurchase() {

        // Confirm Purchase: update Inventory and Sales tables

        try {
            //Handle PriceField is empty when purchasing
            if (priceField.getText().trim().isEmpty()) {
                JOptionPane.showMessageDialog(this, "Please enter a price", "Input Error", JOptionPane.WARNING_MESSAGE);
                return;
            }

            String text = priceField.getText();
            int price = Integer.parseInt(text);

            String selectedCustomer = (String) customersBox.getSelectedItem();

            //Handle customer not selected when purchasing
            if (selectedCustomer.startsWith("Select")) {
                JOptionPane.showMessageDialog(this, "Please enter a valid customer");
                return;
            }

            int customerIncome = Queries.getCustomerIncome(selectedCustomer);

            //Handle price offered is greater than customer income
            if (price > customerIncome) {
                JOptionPane.showMessageDialog(this,
                        "Transaction Denied: The price ($" + price + ") exceeds the customer's budget ($" + customerIncome + ")",
                        "Insufficient Funds",
                        JOptionPane.ERROR_MESSAGE);
                return;
            }

            String selectedDealership = (String) dealershipBox.getSelectedItem();
            String selectedModel = (String) vehicleBox.getSelectedItem();

            //Perform purchase
            Queries.purchase(selectedCustomer, selectedDealership, selectedModel, price);

            JOptionPane.showMessageDialog(this, "Sale completed successfully!");
            priceField.setText("");
            loadVehicles();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Error: " + e.getMessage());
        }
    }
}