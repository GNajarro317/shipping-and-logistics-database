-- ============================================================
-- Shipping & Logistics Database
-- Author: Gerardo Najarro
-- Date Created: 4-9-2025
-- Description: Database schema for managing hubs, shipments, 
--              accounts, and clients for a theoretical shipping company
-- ============================================================

-- Create the database
CREATE DATABASE shipping;

-- Connect to the database
\connect shipping;

-- ============================================================
-- Table: hub
-- Stores information about company hubs
-- ============================================================
CREATE TABLE hub (
    hub_name VARCHAR(40) NOT NULL,
    hub_city VARCHAR(40) NOT NULL CHECK (hub_city IN ('Brooklyn', 'Bronx', 'Manhattan', 'Yonkers')),
    assets MONEY NOT NULL CHECK (assets >= '0.00'),
    PRIMARY KEY (hub_name)
);

-- ============================================================
-- Table: client
-- Stores client information
-- ============================================================
CREATE TABLE client (
    client_ID VARCHAR(40) NOT NULL,
    client_name VARCHAR(40) NOT NULL,
    client_street VARCHAR(40) NOT NULL,
    client_city VARCHAR(40) NOT NULL,
    PRIMARY KEY (client_ID)
);

-- ============================================================
-- Table: shipment
-- Represents shipments created at hubs
-- ============================================================
CREATE TABLE shipment (
    shipment_number VARCHAR(40) NOT NULL,
    hub_name VARCHAR(40) NOT NULL,
    shipment_value MONEY NOT NULL CHECK (shipment_value >= '0.00') DEFAULT '0.00',
    PRIMARY KEY (shipment_number),
    FOREIGN KEY (hub_name) REFERENCES hub(hub_name) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
-- Table: client_shipment
-- Many-to-many relationship between clients and shipments
-- ============================================================
CREATE TABLE client_shipment (
    client_ID VARCHAR(40) NOT NULL,
    shipment_number VARCHAR(40) NOT NULL,
    PRIMARY KEY (client_ID, shipment_number),
    FOREIGN KEY (client_ID) REFERENCES client(client_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (shipment_number) REFERENCES shipment(shipment_number) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
-- Table: account
-- Stores financial accounts for clients or hubs
-- ============================================================
CREATE TABLE account (
    account_number VARCHAR(40) NOT NULL,
    hub_name VARCHAR(40) NOT NULL,
    balance MONEY NOT NULL DEFAULT '0.00',
    PRIMARY KEY (account_number),
    FOREIGN KEY (hub_name) REFERENCES hub(hub_name) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
-- Table: account_client
-- Many-to-many relationship between clients and accounts
-- ============================================================
CREATE TABLE account_client (
    client_ID VARCHAR(40) NOT NULL,
    account_number VARCHAR(40) NOT NULL,
    PRIMARY KEY (client_ID, account_number),
    FOREIGN KEY (client_ID) REFERENCES client(client_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (account_number) REFERENCES account(account_number) ON DELETE CASCADE ON UPDATE CASCADE
);