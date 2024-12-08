DROP DATABASE IF EXISTS Store;
CREATE DATABASE IF NOT EXISTS Store;
USE Store;

-- Product Table --
CREATE TABLE Product (
    Product_ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(64) NOT NULL,
    Price DECIMAL(10, 2),
    Category VARCHAR(64),
    Stock INT NOT NULL,
    PRIMARY KEY (Product_ID)
);

-- Employee Table -- 
CREATE TABLE Employee (
    Emp_ID INT NOT NULL AUTO_INCREMENT,
    FName VARCHAR(92) NOT NULL,
    MName VARCHAR(92),
    LName VARCHAR(92) NOT NULL,
    SSN CHAR(9) UNIQUE NOT NULL,
    Gender CHAR(1),
    Position VARCHAR(92),
    Address VARCHAR(222),
    Dob DATE NOT NULL,
    PRIMARY KEY (Emp_ID)
);

-- Phone_Numbers Table --
CREATE TABLE Phone_Numbers (
    Emp_ID INT NOT NULL,
    Phone_Numbers VARCHAR(15) NOT NULL,
    PRIMARY KEY (Emp_ID, Phone_Numbers),
    FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);

-- Employee_Manager Table --
CREATE TABLE Employee_Manager (
    Emp_ID INT NOT NULL,
    Mgr_ID INT,
    PRIMARY KEY (Emp_ID),
    FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
    FOREIGN KEY (Mgr_ID) REFERENCES Employee(Emp_ID)
);

-- Transactions Table --
CREATE TABLE Transactions (
    Transaction_ID INT NOT NULL AUTO_INCREMENT,
    Date DATE NOT NULL,
    Customer_Name VARCHAR(92),
    Emp_ID INT NOT NULL,
    PRIMARY KEY (Transaction_ID),
    FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);

-- Payments Table --
CREATE TABLE Payments (
    Payment_ID INT NOT NULL AUTO_INCREMENT,
    Transaction_ID INT NOT NULL,
    Type VARCHAR(24) NOT NULL,
    PRIMARY KEY (Payment_ID),
    FOREIGN KEY (Transaction_ID) REFERENCES Transactions(Transaction_ID)
);

-- Check_Data Table --
CREATE TABLE Check_Data (
    Payment_ID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Holders_Name VARCHAR(92) NOT NULL,
    Check_Routing_Number CHAR(9) NOT NULL,
    Check_Account_Number VARCHAR(20) NOT NULL,
    Check_Date DATE NOT NULL,
    PRIMARY KEY (Payment_ID),
    FOREIGN KEY (Payment_ID) REFERENCES Payments(Payment_ID)
);

-- Card Table --
CREATE TABLE Card (
    Payment_ID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Holders_Name VARCHAR(92) NOT NULL,
    Card_Number VARCHAR(16) NOT NULL,
    PRIMARY KEY (Payment_ID),
    FOREIGN KEY (Payment_ID) REFERENCES Payments(Payment_ID)
);

-- Cash Table --
CREATE TABLE Cash (
    Payment_ID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Payment_ID),
    FOREIGN KEY (Payment_ID) REFERENCES Payments(Payment_ID)
);

-- Product_Order Table --
CREATE TABLE Product_Order (
    Order_ID INT NOT NULL AUTO_INCREMENT,
    Quantity INT NOT NULL,
    Price_Paid DECIMAL(10, 2),
    Supplier_Name VARCHAR(92),
    Sup_Contact_Name VARCHAR(64),
    Shipping_Date DATE,
    Status VARCHAR(64) NOT NULL,
    Emp_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    PRIMARY KEY (Order_ID),
    FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
    FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID)
);

-- Transactions_Contains_Product Table --
CREATE TABLE Transactions_Contains_Product (
    Transaction_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (Transaction_ID, Product_ID),
    FOREIGN KEY (Transaction_ID) REFERENCES Transactions(Transaction_ID),
    FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID)
);


INSERT INTO PRODUCT (Name, Price, Category, Stock) VALUES 
('Laptop', 999.99, 'Electronics', 50),
('Desk Chair', 149.99, 'Furniture', 120),
('Coffee Maker', 79.99, 'Appliances', 200),
('Monitor', 219.99, 'Electronics', 75),
('Smartphone', 799.99, 'Electronics', 30),
('Blender', 59.99, 'Appliances', 60),
('Bookcase', 129.99, 'Furniture', 45),
('Headphones', 89.99, 'Electronics', 90);

INSERT INTO Employee (FName, MName, LName, SSN, Gender, Position, Address, Dob) VALUES
('John', 'A', 'Doe', '123456789', 'M', 'Staff Manager', '123 Main St', '1985-06-15'),
('Jane', 'B', 'Smith', '234567890', 'F', 'Head Sales Associate', '456 Oak Rd', '1990-03-22'),
('Alice', 'C', 'Johnson', '345678901', 'F', 'Cashier', '789 Pine Ave', '1992-08-30'),
('Bob', 'D', 'Williams', '456789012', 'M', 'Technician', '101 Maple St', '1988-12-05'),
('Charlie', 'E', 'Brown', '567890123', 'M', 'Sales Associate', '202 Birch Dr', '1995-07-14'),
('Diana', 'F', 'Jones', '678901234', 'F', 'Customer Service', '303 Cedar Ln', '1980-02-17'),
('Eva', 'G', 'Garcia', '789012345', 'F', 'Store Manager', '404 Willow Rd', '1982-11-01'),
('Frank', 'H', 'Martinez', '890123456', 'M', 'Head Technician', '505 Elm St', '1987-09-10');

INSERT INTO Phone_Numbers (Emp_ID, Phone_Numbers) VALUES
(1, '555-123-4567'),
(2, '555-234-5678'),
(3, '555-345-6789'),
(4, '555-456-7890'),
(5, '555-567-8901'),
(6, '555-678-9012'),
(7, '555-789-0123'),
(8, '555-890-1234');

INSERT INTO Employee_Manager (Emp_ID, Mgr_ID) VALUES
(1, 7),
(2, 1),
(3, 1),
(4, 8),
(5, 2),
(6, 1),
(7, NULL),
(8, 1);

INSERT INTO Transactions (Date, Customer_Name, Emp_ID) VALUES
('2024-11-01', 'Michael Clark', 1),
('2024-11-02', 'Sarah Adams', 2),
('2024-11-03', 'David Lee', 3),
('2024-11-04', 'Emily Harris', 3),
('2024-11-05', 'Brian Walker', 5),
('2024-11-06', 'Sophia Lewis', 5),
('2024-11-07', 'William Robinson', 3),
('2024-11-08', 'Olivia Perez', 2),
('2024-11-08', 'Brian Walker', 5),
('2024-11-08', 'Sarah Adams', 3);

INSERT INTO Payments (Transaction_ID, Type) VALUES
(1, 'Check'),
(2, 'Card'),
(3, 'Cash'),
(4, 'Check'),
(5, 'Card'),
(6, 'Cash'),
(7, 'Card'),
(8, 'Check'),
(9, 'Cash'),
(9, 'Card'),
(10, 'Cash');

INSERT INTO Check_Data (Payment_ID, Amount, Holders_Name, Check_Routing_Number, Check_Account_Number, Check_Date) VALUES
(1, 250.00, 'Michael Clark', '021000021', '1234567890', '2024-11-01'),    
(4, 250.00, 'Emily Harris', '122000661', '4567890123', '2024-11-04'),   
(8, 180.00, 'Olivia Perez', '091000019', '8901234567', '2024-11-08');  


INSERT INTO Card (Payment_ID, Amount, Holders_Name, Card_Number) VALUES
(2, 120.00, 'Sarah Adams', '2345678923456789'),
(5, 200.00, 'Brian Walker', '5678901256789012'),
(7, 300.00, 'William Robinson', '7890123478901234'),
(10, 100.00, 'Brian Walker', '7890123478901234');

INSERT INTO Cash (Payment_ID, Amount) VALUES
(3, 90.00),
(6, 150.00),
(9, 300.00),
(11, 180.00);

INSERT INTO PRODUCT_ORDER (Quantity, Price_Paid, Supplier_Name, Sup_Contact_Name, Shipping_Date, Status, Emp_ID, Product_ID) VALUES
(5, 499.95, 'TechSupplies Inc.', 'James Miller', '2024-11-10', 'Shipping', 1, 1),
(10, 1499.90, 'Furniture World', 'John Doe', '2024-11-12', 'Ordered', 1, 2),
(3, 239.97, 'Appliance Central', 'Samantha Lee', '2024-11-13', 'Delivered', 7, 3),
(7, 1539.93, 'Electronics Store', 'George Brown', '2024-11-14', 'Shipping', 1, 4),
(2, 1599.98, 'MobileTech', 'Katie White', '2024-11-15', 'Ordered', 7, 5),
(4, 239.96, 'BlenderCo', 'Linda Clark', '2024-11-16', 'Delivered', 7, 6),
(8, 1039.92, 'Office Furnishings', 'Nancy Williams', '2024-11-17', 'Shipping', 7, 7),
(6, 539.94, 'SoundGear', 'Michael Johnson', '2024-11-18', 'Delivered', 1, 8);

INSERT INTO Transactions_Contains_Product (Transaction_ID, Product_ID, Quantity) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 5),
(4, 2, 1),
(5, 5, 2),
(6, 6, 3),
(7, 7, 2),
(8, 5, 4);


DELIMITER $$

CREATE TRIGGER check_status_change
AFTER UPDATE
ON product_order
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Delivered' AND OLD.Status != 'Delivered' THEN
		UPDATE Product
        SET Stock = Stock + NEW.Quantity
        WHERE Product.Product_ID = NEW.Product_ID;
    END IF;
END$$

DELIMITER ;