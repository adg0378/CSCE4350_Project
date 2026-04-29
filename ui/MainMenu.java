package ui;

import java.awt.*;
import javax.swing.*;

public class MainMenu extends JFrame
{
    public MainMenu()
    {
        // Main Menu window
        setTitle("FakeMax Dealership"); // We need to think of a name
        setSize(800, 600);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null); // Center the window

        JLabel title = new JLabel("FakeMax Dealership", SwingConstants.CENTER);
        title.setFont(new Font("Georgia", Font.BOLD, 30));
        
        //Buttons Main Menu
        JButton customerButton = new JButton("Customer Menu");
        customerButton.setFont(new Font("Georgia", Font.PLAIN, 16));
        JButton vehicleButton = new JButton("Vehicle Locator");
        vehicleButton.setFont(new Font("Georgia", Font.PLAIN, 16));
        JButton salesButton = new JButton("Sales Menu");
        salesButton.setFont(new Font("Georgia", Font.PLAIN, 16));
        JButton closeButton = new JButton("Close Program");
        closeButton.setFont(new Font("Georgia", Font.PLAIN, 16));

        // Button redirection/actions
        customerButton.addActionListener(e -> new CustomerUI());
        vehicleButton.addActionListener(e -> new VehicleLocatorUI());
        salesButton.addActionListener(e -> new SalesUI());
        closeButton.addActionListener(e -> System.exit(0));

        // Logo Panel
        JPanel logoPanel = new JPanel(new BorderLayout());
        ImageIcon logoIcon = new ImageIcon(getClass().getResource("/ui/images/FakeMaxLogo.png"));

        // Logo layout
        JLabel logoLabel = new JLabel(logoIcon, SwingConstants.CENTER);
        logoPanel.add(logoLabel, BorderLayout.CENTER);

        // Button Layout
        JPanel buttonPanel = new JPanel(new GridLayout(2, 2, 20, 20));
        buttonPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
        buttonPanel.add(customerButton);
        buttonPanel.add(vehicleButton);
        buttonPanel.add(salesButton);
        buttonPanel.add(closeButton);

        // Main Menu layout
        setLayout(new BorderLayout(10, 10));
        add(title, BorderLayout.NORTH);
        add(buttonPanel, BorderLayout.SOUTH);
        add(logoPanel, BorderLayout.CENTER);

        setVisible(true);
    }

    public static void main(String[] args)
    {
        SwingUtilities.invokeLater(MainMenu::new);
    }
}
