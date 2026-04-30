# CSCE4350_Project

# Group 7
Preethi
Ryan
Alejandro Gonzalez
Jorge

# DESCRIPTION
FakeMax Dealership is a Java Swing + PostgreSQL application for managing vehicle inventory, customers, and sales.

# Overview of the program
This project implements a complete dealership management system using Java Swing for the user interface,
PostgreSQL for persistent data storage, JDBC for database connectivity and normalized relational schema 
with realistic data (60+ vehicles, customers, sales, inventory)

# Database Schema
Tables created for this application include:
Brand
Model
Color
BodyStyle
Engine
Transmission
Vehicle
Inventory
Customer
Sales
Part (not actually used - for reference only)
Supplier (not actually used - for reference only)
Supplier_Part (not actually used - for reference only)
Plant (not actually used - for reference only)
Plant_Part (not actually used - for reference only)

# Files
Presentation.pdf -> presentation and description of the program and interface

.vscode foler -> this folder needs to be added to the IDE or text editor to run the program
db folder -> needs to be added to the IDE or text editor to run the program
lib folder -> folder containing the .jar file, the JDBC driver; needs to be added to the IDE or text editor to run the program
ui folder -> needs to be added to the IDE or text editor to run the program (MOST IMPORTANT FOLDER)

# Running application
1. Ensure inside .vscode, the settings.json file looks like this:
   {
    "java.project.referencedLibraries": [
        "lib/**/*.jar"
    ]
}
2. inside Database.java, add the personal password used for the database
3. Import and run the SQL schema included in this zip file
4. Run the program launching MainMenu.java

