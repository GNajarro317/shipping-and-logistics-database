### Date created
Date project was created: 4-9-2025
Date README file was last updated: 12-8-2025

### Project Title
Shipping & Logistics Database

### Description
This project designs a SQL database to manage the operations of a shipping company, including hubs, shipments, financial accounts, and clients. The database enforces data integrity through primary and foreign keys, cascading updates and deletes, and constraints on monetary values and allowed hub locations.

This project reinforced practical skills in database design, relational modeling, constraint implementation, and many-to-many relationship management.

The project involved:

* Defining tables for hubs, clients, shipments, and accounts.
* Implementing many-to-many relationships with junction tables (client_shipment and account_client).
* Using CHECK constraints to enforce valid hub locations and non-negative monetary values.
* Applying cascading updates and deletes to maintain data integrity across related tables.
* Creating a clean, organized SQL schema suitable for demonstration in a portfolio.

### Files used
No external dataset required; the database schema can be populated with sample data for testing or demonstration. Tables include hub, client, shipment, client_shipment, account, and account_client.

### Requirements
PostgreSQL or any SQL environment supporting standard SQL

Optional: pgAdmin or Visual Studio Code with SQL extension for running the schema