--- INSERTING DATA INTO TABLES

USE global_supply_chain;


-- Inserting data into Supplier
INSERT INTO Supplier (s_name, contact_name, email, phone, country, address, rating, status) VALUES
('Supplier A', 'Ali Khan', 'ali.khan@example.com', '03001234567', 'Pakistan', '123 Main St, Karachi', 4.5, 'active'),
('Supplier B', 'Fatima Bibi', 'fatima.bibi@example.com', '03101234567', 'Pakistan', '456 Market St, Lahore', 4.2, 'active'),
('Supplier C', 'Ahmed Raza', 'ahmed.raza@example.com', '03201234567', 'Pakistan', '789 Park St, Islamabad', 3.8, 'inactive'),
('Supplier D', 'Zainab Shah', 'zainab.shah@example.com', '03301234567', 'Pakistan', '321 Hill St, Peshawar', 4.7, 'active'),
('Supplier E', 'Omar Ali', 'omar.ali@example.com', '03401234567', 'Pakistan', '654 River Rd, Quetta', 4.1, 'active');

SELECT * FROM Supplier;

-- Inserting data into SupplierContract
INSERT INTO SupplierContract (supplier_id, start_date, end_date, contract_details, terms, status) VALUES
(1, '2023-01-01', '2024-01-01', 'Annual supply of goods', 'Payment due within 30 days', 'active'),
(2, '2023-05-15', '2024-05-15', 'Quarterly supply of materials', 'Payment upon delivery', 'active'),
(1, '2023-07-01', '2023-12-31', 'Six-month supply contract', 'Payment within 45 days', 'expired'),
(3, '2023-02-20', '2024-02-20', 'Supply of electronics', 'Monthly payments', 'active'),
(4, '2023-08-01', '2024-08-01', 'Annual service agreement', 'Payment upfront', 'active');


SELECT * FROM SupplierContract;


-- Inserting data into SupplierProducts
INSERT INTO SupplierProducts (supplier_id, product_id, cost, delivery_lead_time) VALUES
(1, NULL, 100.00, 10),
(2, NULL, 150.50, 5),
(3, NULL, 200.00, 15),
(1, NULL, 120.75, 8),
(4, NULL, 180.00, 20);


SELECT * FROM SupplierProducts;

-- Inserting data into Products
INSERT INTO Products (p_name, description, category_id, weight, length, width, height, base_price, status) VALUES
('Product A', 'Description of Product A', NULL, 1.5, 10.0, 5.0, 2.0, 50.00, 'active'),
('Product B', 'Description of Product B', NULL, 2.0, 15.0, 8.0, 3.0, 75.00, 'active'),
('Product C', 'Description of Product C', NULL, 1.0, 7.5, 4.0, 1.5, 30.00, 'discontinued'),
('Product D', 'Description of Product D', NULL, 3.0, 20.0, 10.0, 5.0, 100.00, 'active'),
('Product E', 'Description of Product E', NULL, 2.5, 12.0, 6.0, 4.0, 60.00, 'active');

SELECT * FROM Products;

-- Inserting data into ProductCategories
INSERT INTO ProductCategories (category_name, parent_category_id, description) VALUES
('Electronics', NULL, 'All electronic items'),
('Furniture', NULL, 'Home and office furniture'),
('Clothing', NULL, 'Apparel and clothing items'),
('Books', NULL, 'Books and educational materials'),
('Toys', NULL, 'Toys for children');

SELECT * FROM ProductCategories;


-- Inserting data into Variants
INSERT INTO Variants (variant_name) VALUES
('Size'),
('Color'),
('Material');

SELECT * FROM Variants;


-- Inserting data into VariantOptions
INSERT INTO VariantOptions (variant_id, option_value) VALUES
(1, 'Small'),
(1, 'Medium'),
(1, 'Large'),
(2, 'Red'),
(2, 'Blue');

SELECT * FROM VariantOptions;

-- Inserting data into ProductSKUs
INSERT INTO ProductSKUs (product_id, sku_code, barcode, cost_price, status) VALUES
(1, 'SKU001', '1234567890123', 45.00, 'active'),
(2, 'SKU002', '1234567890124', 70.00, 'active'),
(3, 'SKU003', '1234567890125', 28.00, 'inactive'),
(4, 'SKU004', '1234567890126', 95.00, 'active'),
(5, 'SKU005', '1234567890127', 55.00, 'active');

SELECT * FROM ProductSKUs;

-- Inserting data into Warehouse
INSERT INTO Warehouse (name, location, capacity, manager_id) VALUES
('Warehouse A', '123 Warehouse Rd, Karachi', 1000.0, NULL),
('Warehouse B', '456 Storage Ave, Lahore', 2000.0, NULL),
('Warehouse C', '789 Depot Ln, Islamabad', 1500.0, NULL),
('Warehouse D', '321 Shipping St, Peshawar', 3000.0, NULL);

SELECT * FROM Warehouse;


INSERT INTO Supplier (s_name, contact_name, email, phone, country, address, rating, status) VALUES
('PakTech Supplies', 'Ali Raza', 'ali.raza@paktech.com', '03012223344', 'Pakistan', 'Suite 12, Gulshan-e-Iqbal, Karachi', 4.6, 'active'),
('Elite Traders', 'Sara Faisal', 'sara.faisal@elitetraders.pk', '03045556677', 'Pakistan', 'Block H, DHA, Lahore', 4.3, 'active'),
('NexGen Importers', 'Kamran Shah', 'kamran.shah@nexgen.com.pk', '03057778899', 'Pakistan', 'Plot 45, Industrial Area, Islamabad', 4.1, 'active'),
('Al-Safa Suppliers', 'Zain Malik', 'zain.malik@alsafa.com', '03211223344', 'Pakistan', 'Shop 8, Saddar, Rawalpindi', 3.9, 'active'),
('Quality Hub', 'Fatima Naeem', 'fatima.naeem@qhub.pk', '03456677889', 'Pakistan', 'Sector F, G-11, Islamabad', 4.2, 'active'),
('ValueMart Distributors', 'Omar Aslam', 'omar.aslam@valuemart.pk', '03014445556', 'Pakistan', 'Shop 55, Tariq Road, Karachi', 4.0, 'active'),
('Pak Trading Co.', 'Sadaf Ahmed', 'sadaf.ahmed@paktraders.com', '03097778866', 'Pakistan', 'Sector J, Hayatabad, Peshawar', 4.3, 'inactive'),
('Reliable Imports', 'Ahmed Khan', 'ahmed.khan@reliable.pk', '03337778899', 'Pakistan', 'Plot 22, SITE Area, Karachi', 4.7, 'active'),
('Al-Furqan Distributors', 'Uzma Tariq', 'uzma.tariq@furqan.pk', '03224445566', 'Pakistan', 'Block M, DHA Phase 2, Lahore', 4.5, 'active'),
('Shahbaz Supply Co.', 'Shahbaz Ali', 'shahbaz.ali@shahbazco.pk', '03441112233', 'Pakistan', 'Street 7, Model Town, Lahore', 4.8, 'active');

Select * from Supplier;


INSERT INTO SupplierContract (supplier_id, start_date, end_date, contract_details, terms, status) VALUES
(1, '2023-03-01', '2024-02-28', 'Supply of IT equipment', 'Payment within 30 days of delivery', 'active'),
(2, '2023-05-15', '2023-11-15', 'Quarterly supply of construction materials', 'Advance payment required', 'expired'),
(3, '2023-01-01', '2023-12-31', 'Yearly supply of consumer electronics', '50% upfront payment', 'active'),
(4, '2023-06-01', '2024-05-31', 'Annual service agreement for office furniture', 'Payable quarterly', 'active'),
(5, '2023-02-01', '2024-01-31', 'Supply of medical equipment', '60 days credit period', 'active'),
(6, '2023-07-01', '2023-12-31', 'Seasonal supply of clothing', 'Advance payment', 'expired'),
(7, '2023-03-15', '2024-03-15', 'Supply of auto parts', 'Payment on delivery', 'active'),
(8, '2023-08-01', '2024-07-31', 'Electronics and accessories supply', 'Payment within 45 days', 'active'),
(9, '2023-09-01', '2024-08-31', 'Service agreement for heavy machinery', 'Monthly payments', 'active'),
(10, '2023-04-01', '2024-03-31', 'Supply of office stationery', 'Net 30 payment terms', 'active');


SELECT * from SupplierContract;



INSERT INTO SupplierProducts (supplier_id, product_id, cost, delivery_lead_time) VALUES
(1, 1, 200.00, 5),
(1, 2, 300.50, 7),
(2, 3, 150.00, 10),
(2, 4, 180.00, 8),
(3, 5, 250.00, 12),
(4, 6, 120.00, 15),
(5, 7, 170.50, 9),
(6, 8, 400.00, 20),
(7, 9, 500.00, 18),
(8, 10, 320.00, 6),
(9, 1, 220.00, 5),
(10, 2, 330.00, 7),
(1, 3, 280.00, 10),
(2, 4, 190.00, 12),
(3, 5, 270.00, 8),
(4, 6, 140.00, 5),
(5, 7, 180.50, 6),
(6, 8, 390.00, 14),
(7, 9, 520.00, 19),
(8, 10, 310.00, 7);


INSERT INTO Products (p_name, description, category_id, weight, length, width, height, base_price, status) VALUES
('Laptop Dell Inspiron', 'High-performance laptop for office and gaming', 1, 2.5, 14.0, 10.0, 1.0, 80000.00, 'active'),
('HP Laser Printer', 'Laser printer with high-speed performance', 1, 7.5, 16.0, 12.0, 10.0, 30000.00, 'active'),
('Samsung Galaxy A52', 'Smartphone with 6GB RAM and 128GB storage', 1, 0.5, 6.5, 3.0, 0.3, 45000.00, 'active'),
('Office Chair', 'Ergonomic chair with lumbar support', 2, 12.0, 24.0, 20.0, 10.0, 15000.00, 'active'),
('Study Table', 'Compact study table with shelves', 2, 20.0, 36.0, 24.0, 30.0, 10000.00, 'active'),
('Cotton Shirt', 'Casual cotton shirt for men', 3, 0.3, 15.0, 10.0, 1.0, 1500.00, 'active'),
('Jeans', 'Slim-fit denim jeans for men', 3, 0.8, 30.0, 15.0, 2.0, 2500.00, 'active'),
('Pakistani History Book', 'Comprehensive book on Pakistan’s history', 4, 1.0, 10.0, 8.0, 0.5, 1200.00, 'active'),
('Teddy Bear', 'Soft and cuddly teddy bear for kids', 5, 1.2, 18.0, 15.0, 10.0, 800.00, 'active'),
('Building Blocks', 'Educational building blocks for kids', 5, 2.0, 20.0, 15.0, 10.0, 1500.00, 'active');
SELECT * FROM Products;



INSERT INTO ProductCategories (category_name, parent_category_id, description) VALUES
('Mobile Phones', 1, 'Smartphones and basic phones'),
('Home Appliances', 1, 'Microwaves, refrigerators, washing machines, etc.'),
('Office Furniture', 2, 'Desks, chairs, and storage solutions for offices'),
('Kids’ Clothing', 3, 'Clothing for babies and children'),
('Educational Toys', 5, 'Toys designed to enhance learning for kids');
SELECT * From ProductCategories;



INSERT INTO Variants (variant_name) VALUES
('RAM'),
('Storage'),
('Battery Capacity'),
('Weight');


INSERT INTO VariantOptions (variant_id, option_value) VALUES
(1, 'Small'),
(1, 'Medium'),
(1, 'Large'),
(2, 'Black'),
(2, 'White'),
(2, 'Silver'),
(2, 'Blue'),
(3, 'Wooden'),
(3, 'Plastic'),
(3, 'Metal'),
(4, '4GB'),
(4, '8GB'),
(4, '16GB'),
(5, '64GB'),
(5, '128GB'),
(5, '256GB'),
(6, '3000mAh'),
(6, '4000mAh'),
(6, '5000mAh'),
(7, 'Lightweight'),
(7, 'Standard');


INSERT INTO ProductSKUs (product_id, sku_code, barcode, cost_price, status) VALUES
(1, 'SKU001', '1234567890001', 78000.00, 'active'),
(2, 'SKU002', '1234567890002', 28500.00, 'active'),
(3, 'SKU003', '1234567890003', 43000.00, 'active'),
(4, 'SKU004', '1234567890004', 14000.00, 'active'),
(5, 'SKU005', '1234567890005', 9500.00, 'active'),
(6, 'SKU006', '1234567890006', 1400.00, 'active'),
(7, 'SKU007', '1234567890007', 2400.00, 'active'),
(8, 'SKU008', '1234567890008', 1150.00, 'active'),
(9, 'SKU009', '1234567890009', 750.00, 'active'),
(10, 'SKU010', '1234567890010', 1400.00, 'active'),
(1, 'SKU011', '1234567890011', 80000.00, 'active'),
(2, 'SKU012', '1234567890012', 29000.00, 'active'),
(3, 'SKU013', '1234567890013', 45000.00, 'active'),
(4, 'SKU014', '1234567890014', 13500.00, 'active'),
(5, 'SKU015', '1234567890015', 10500.00, 'active'),
(6, 'SKU016', '1234567890016', 1300.00, 'active'),
(7, 'SKU017', '1234567890017', 2600.00, 'active'),
(8, 'SKU018', '1234567890018', 1200.00, 'active'),
(9, 'SKU019', '1234567890019', 800.00, 'active'),
(10, 'SKU020', '1234567890020', 1500.00, 'active');



INSERT INTO Warehouse (name, location, capacity, manager_id) VALUES
('Warehouse E', '654 Distribution Ave, Quetta', 1800.0, NULL),
('Warehouse F', '12 Industrial Zone, Faisalabad', 2500.0, NULL),
('Warehouse G', '89 Supply St, Rawalpindi', 2200.0, NULL),
('Warehouse H', '45 Factory Rd, Multan', 1600.0, NULL),
('Warehouse I', '78 Logistics Ln, Sialkot', 1400.0, NULL),
('Warehouse J', '100 Industrial Estate, Sukkur', 1200.0, NULL);




INSERT INTO SupplierProducts (supplier_id, product_id, cost, delivery_lead_time) VALUES
(1, 1, 75000.00, 15),
(1, 2, 28000.00, 10),
(2, 3, 42000.00, 20),
(2, 4, 13500.00, 12),
(3, 5, 9400.00, 8),
(3, 6, 1400.00, 5),
(4, 7, 2300.00, 7),
(4, 8, 1100.00, 6),
(5, 9, 700.00, 3);


INSERT INTO WarehouseInventory (product_id, warehouse_id, quantity) VALUES
(1, 1, 200),
(2, 1, 150),
(3, 2, 100),
(4, 3, 120),
(5, 4, 90),
(6, 5, 300),
(7, 1, 150),
(8, 2, 80),
(9, 3, 70),
(10, 4, 200);



INSERT INTO InventoryMovement (inventory_id, quantity, movement_type, movement_date, reason) VALUES
(17, 50, 'addition', '2024-11-01', 'Stock replenishment from supplier A'),
(18, 30, 'removal', '2024-11-02', 'Customer order fulfillment'),
(19, 20, 'addition', '2024-11-03', 'Stock replenishment from supplier B'),
(20, 10, 'removal', '2024-11-04', 'Product damaged during handling');


INSERT INTO Customers (name, email, phone, billing_address, shipping_address, customer_type) VALUES
('Ali Khan', 'ali.khan@example.com', '03001234567', '123 Main St, Karachi', '123 Main St, Karachi', 'individual'),
('Fatima Bibi', 'fatima.bibi@example.com', '03101234567', '456 Market St, Lahore', '456 Market St, Lahore', 'individual'),
('Ahmed Raza', 'ahmed.raza@example.com', '03201234567', '789 Park St, Islamabad', '789 Park St, Islamabad', 'individual'),
('Zainab Shah', 'zainab.shah@example.com', '03301234567', '321 Hill St, Peshawar', '321 Hill St, Peshawar', 'individual'),
('Omar Ali', 'omar.ali@example.com', '03401234567', '654 River Rd, Quetta', '654 River Rd, Quetta', 'individual'),
('Shoaib Malik', 'shoaib.malik@business.com', '03007894567', '101 Industrial Zone, Faisalabad', '101 Industrial Zone, Faisalabad', 'business'),
('Muneeb Ali', 'muneeb.ali@corporation.com', '03008765432', '202 Business Avenue, Karachi', '202 Business Avenue, Karachi', 'business'),
('Syed Imran', 'syed.imran@business.com', '03006547890', '456 Commercial St, Lahore', '456 Commercial St, Lahore', 'business'),
('Ayesha Khan', 'ayesha.khan@corporation.com', '03009123456', '789 Corporate Park, Islamabad', '789 Corporate Park, Islamabad', 'business'),
('Usman Shah', 'usman.shah@enterprise.com', '03005678901', '101 Business Center, Peshawar', '101 Business Center, Peshawar', 'business'),
('Bilal Ahmed', 'bilal.ahmed@retail.com', '03007456890', '12 Retail Plaza, Karachi', '12 Retail Plaza, Karachi', 'business'),
('Sara Khan', 'sara.khan@example.com', '03006789123', '789 ABC Road, Lahore', '789 ABC Road, Lahore', 'individual'),
('Tariq Jamil', 'tariq.jamil@example.com', '03005487912', '456 Blue Street, Islamabad', '456 Blue Street, Islamabad', 'individual'),
('Hassan Akhtar', 'hassan.akhtar@example.com', '03004567891', '10 Green Park, Quetta', '10 Green Park, Quetta', 'individual'),
('Kashif Iqbal', 'kashif.iqbal@example.com', '03005678912', '30 Red Hill St, Karachi', '30 Red Hill St, Karachi', 'individual'),
('Maira Shah', 'maira.shah@example.com', '03007894565', '200 Green Street, Faisalabad', '200 Green Street, Faisalabad', 'individual'),
('Wasiq Ahmad', 'wasiq.ahmad@example.com', '03006789124', '15 Yellow Avenue, Lahore', '15 Yellow Avenue, Lahore', 'individual'),
('Rashid Mehmood', 'rashid.mehmood@business.com', '03007894562', '150 Business Lane, Karachi', '150 Business Lane, Karachi', 'business'),
('Jameela Rehman', 'jameela.rehman@corporation.com', '03001122334', '250 Business Hub, Lahore', '250 Business Hub, Lahore', 'business'),
('Rizwan Akram', 'rizwan.akram@corporation.com', '03009988765', '400 Industrial Park, Islamabad', '400 Industrial Park, Islamabad', 'business');



INSERT INTO Orders (customer_id, order_date, status, total_amount) VALUES
(1, '2024-11-01', 'pending', 2500.50),
(2, '2024-11-03', 'confirmed', 5000.00),
(3, '2024-11-05', 'shipped', 1500.75),
(4, '2024-11-06', 'delivered', 3500.60),
(5, '2024-11-07', 'canceled', 1200.40),
(6, '2024-11-08', 'pending', 8000.20),
(7, '2024-11-09', 'confirmed', 6700.00),
(8, '2024-11-10', 'shipped', 9500.50),
(9, '2024-11-12', 'delivered', 1500.00),
(10, '2024-11-13', 'pending', 4000.00),
(11, '2024-11-14', 'confirmed', 2200.30),
(12, '2024-11-15', 'shipped', 3000.00),
(13, '2024-11-16', 'delivered', 2500.75),
(14, '2024-11-17', 'canceled', 1800.00),
(15, '2024-11-18', 'pending', 2100.45),
(16, '2024-11-19', 'confirmed', 4800.60),
(17, '2024-11-20', 'shipped', 1500.25),
(18, '2024-11-21', 'delivered', 3700.35),
(19, '2024-11-22', 'pending', 9000.40),
(20, '2024-11-23', 'confirmed', 5600.00);




INSERT INTO OrderItems (order_id, product_id, sku_id, quantity, unit_price, discount, total_price) VALUES
(1, 1, 1, 2, 50.00, 5.00, 95.00),
(2, 2, 2, 3, 75.00, 10.00, 220.00),
(3, 3, 3, 1, 30.00, 0.00, 30.00),
(4, 4, 4, 5, 100.00, 15.00, 475.00),
(5, 5, 5, 1, 60.00, 5.00, 55.00),
(6, 1, 1, 4, 50.00, 5.00, 190.00),
(7, 2, 2, 2, 75.00, 10.00, 140.00),
(8, 4, 4, 3, 100.00, 15.00, 285.00),
(9, 3, 3, 2, 30.00, 0.00, 60.00),
(10, 1, 1, 6, 50.00, 5.00, 270.00),
(11, 5, 5, 2, 60.00, 5.00, 110.00),
(12, 4, 4, 4, 100.00, 15.00, 370.00),
(13, 2, 2, 3, 75.00, 10.00, 220.00),
(14, 3, 3, 1, 30.00, 0.00, 30.00),
(15, 4, 4, 2, 100.00, 15.00, 170.00),
(16, 1, 1, 4, 50.00, 5.00, 190.00),
(17, 5, 5, 1, 60.00, 5.00, 55.00),
(18, 2, 2, 2, 75.00, 10.00, 140.00),
(19, 3, 3, 2, 30.00, 0.00, 60.00),
(20, 4, 4, 3, 100.00, 15.00, 285.00);




INSERT INTO Carriers (name, contact_info, country, service_type, rating) VALUES
('Pakistan Post', '0511111111', 'Pakistan', 'ground', 4.2),
('TCS', '0211112345', 'Pakistan', 'ground', 4.5),
('M&P', '0213000000', 'Pakistan', 'ground', 4.1),
('DHL', '0218006543', 'Pakistan', 'air', 4.8),
('FedEx', '0216001234', 'Pakistan', 'air', 4.6),
('UPS', '0219006789', 'Pakistan', 'ground', 4.7),
('BlueDart', '0218002345', 'Pakistan', 'air', 4.3),
('Emirates SkyCargo', '0097142990000', 'UAE', 'air', 4.9),
('Qatar Airways Cargo', '0097430002222', 'Qatar', 'air', 4.7),
('Maersk Line', '0097104444555', 'Denmark', 'sea', 4.6),
('MSC', '0097106007000', 'Switzerland', 'sea', 4.5),
('CMA CGM', '0097101234321', 'France', 'sea', 4.4),
('A.P. Moller-Maersk', '0097102342345', 'Denmark', 'sea', 4.7),
('Singapore Airlines Cargo', '0096512345678', 'Singapore', 'air', 4.8),
('China COSCO Shipping', '009861234567890', 'China', 'sea', 4.3),
('Indian Railways', '02218553966', 'India', 'ground', 4.1),
('DP World', '0097108005000', 'UAE', 'sea', 4.7),
('Hapag-Lloyd', '0097104531212', 'Germany', 'sea', 4.5),
('TNT Express', '0216723444', 'Pakistan', 'ground', 4.4),
('Air India Cargo', '01123318060', 'India', 'air', 4.6);




INSERT INTO OrderShipments (order_id, shipment_date, expected_delivery_date, tracking_number, carrier_id, status) VALUES
(1, '2024-01-05', '2024-01-10', 123456789, 1, 'in-transit'),
(2, '2024-01-06', '2024-01-11', 234567890, 2, 'delivered'),
(3, '2024-01-07', '2024-01-12', 345678901, 1, 'delayed'),
(4, '2024-01-08', '2024-01-13', 456789012, 3, 'in-transit'),
(5, '2024-01-09', '2024-01-14', 567890123, 2, 'delivered'),
(6, '2024-01-10', '2024-01-15', 678901234, 1, 'in-transit'),
(7, '2024-01-11', '2024-01-16', 789012345, 3, 'delayed'),
(8, '2024-01-12', '2024-01-17', 890123456, 2, 'delivered'),
(9, '2024-01-13', '2024-01-18', 901234567, 1, 'in-transit'),
(10, '2024-01-14', '2024-01-19', 123987456, 3, 'delivered'),
(11, '2024-01-15', '2024-01-20', 234876345, 1, 'in-transit'),
(12, '2024-01-16', '2024-01-21', 345765234, 2, 'delayed'),
(13, '2024-01-17', '2024-01-22', 456654123, 3, 'delivered'),
(14, '2024-01-18', '2024-01-23', 567543012, 1, 'in-transit'),
(15, '2024-01-19', '2024-01-24', 678432901, 2, 'delayed'),
(16, '2024-01-20', '2024-01-25', 789321890, 1, 'delivered'),
(17, '2024-01-21', '2024-01-26', 890210789, 3, 'in-transit'),
(18, '2024-01-22', '2024-01-27', 901109678, 2, 'delayed'),
(19, '2024-01-23', '2024-01-28', 123000987, 1, 'delivered'),
(20, '2024-01-24', '2024-01-29', 234001876, 3, 'in-transit');


INSERT INTO DeliveryAreas (area_name) VALUES
('North America'),
('South America'),
('Europe'),
('Asia'),
('Africa'),
('Australia'),
('Middle East'),
('Central Asia'),
('Southeast Asia'),
('East Asia'),
('Central Europe'),
('Western Europe'),
('Northern Europe'),
('Southern Europe'),
('Southern Asia'),
('South Asia'),
('Sub-Saharan Africa'),
('Oceania'),
('Caucasus'),
('Scandinavia');


INSERT INTO CarrierDeliveryAreas (carrier_id, area_id) VALUES
(1, 1), -- Carrier 1 (e.g., FedEx) serves North America
(2, 2), -- Carrier 2 (e.g., DHL) serves South America
(3, 3), -- Carrier 3 (e.g., UPS) serves Europe
(1, 4), -- Carrier 1 (e.g., FedEx) serves Asia
(4, 5), -- Carrier 4 (e.g., Maersk) serves Africa
(5, 6), -- Carrier 5 (e.g., Australia Post) serves Australia
(2, 7), -- Carrier 2 (e.g., DHL) serves the Middle East
(3, 8), -- Carrier 3 (e.g., UPS) serves Central Asia
(1, 9), -- Carrier 1 (e.g., FedEx) serves Southeast Asia
(4, 10), -- Carrier 4 (e.g., Maersk) serves East Asia
(5, 11), -- Carrier 5 (e.g., Australia Post) serves Central Europe
(3, 12), -- Carrier 3 (e.g., UPS) serves Western Europe
(2, 13), -- Carrier 2 (e.g., DHL) serves Northern Europe
(1, 14), -- Carrier 1 (e.g., FedEx) serves Southern Europe
(4, 15), -- Carrier 4 (e.g., Maersk) serves Southern Asia
(3, 16), -- Carrier 3 (e.g., UPS) serves South Asia
(5, 17), -- Carrier 5 (e.g., Australia Post) serves Sub-Saharan Africa
(2, 18), -- Carrier 2 (e.g., DHL) serves Oceania
(1, 19), -- Carrier 1 (e.g., FedEx) serves the Caucasus
(4, 20); -- Carrier 4 (e.g., Maersk) serves Scandinavia



INSERT INTO Shipments (carrier_id, shipment_type, origin, destination, departure_date, estimated_arrival_date, actual_arrival_date, status) VALUES
(1, 'inbound', 'Karachi Port, Pakistan', 'London, United Kingdom', '2024-01-15', '2024-01-25', '2024-01-26', 'delivered'),
(2, 'outbound', 'Lahore, Pakistan', 'New York, USA', '2024-01-20', '2024-02-05', NULL, 'in transit'),
(3, 'inbound', 'Hamburg, Germany', 'Islamabad, Pakistan', '2024-01-10', '2024-01-18', '2024-01-19', 'delivered'),
(4, 'outbound', 'Karachi, Pakistan', 'Shanghai, China', '2024-02-01', '2024-02-15', NULL, 'in transit'),
(5, 'inbound', 'Sydney, Australia', 'Karachi, Pakistan', '2024-01-25', '2024-02-05', '2024-02-07', 'delivered'),
(2, 'outbound', 'Peshawar, Pakistan', 'Berlin, Germany', '2024-01-28', '2024-02-10', NULL, 'in transit'),
(3, 'inbound', 'Dubai, UAE', 'Lahore, Pakistan', '2024-01-22', '2024-02-02', '2024-02-03', 'delivered'),
(1, 'outbound', 'Rawalpindi, Pakistan', 'Mumbai, India', '2024-02-05', '2024-02-12', NULL, 'in transit'),
(4, 'inbound', 'Los Angeles, USA', 'Karachi, Pakistan', '2024-01-30', '2024-02-10', '2024-02-11', 'delivered'),
(5, 'outbound', 'Quetta, Pakistan', 'Singapore', '2024-01-18', '2024-02-08', NULL, 'in transit'),
(2, 'inbound', 'Hong Kong', 'Karachi, Pakistan', '2024-01-12', '2024-01-22', '2024-01-23', 'delivered'),
(3, 'outbound', 'Lahore, Pakistan', 'Tokyo, Japan', '2024-01-17', '2024-02-02', NULL, 'in transit'),
(1, 'inbound', 'Doha, Qatar', 'Islamabad, Pakistan', '2024-01-23', '2024-02-04', '2024-02-06', 'delivered'),
(4, 'outbound', 'Faisalabad, Pakistan', 'Paris, France', '2024-01-25', '2024-02-09', NULL, 'in transit'),
(5, 'inbound', 'Dubai, UAE', 'Karachi, Pakistan', '2024-01-13', '2024-01-23', '2024-01-25', 'delivered'),
(2, 'outbound', 'Lahore, Pakistan', 'Los Angeles, USA', '2024-01-30', '2024-02-14', NULL, 'in transit'),
(3, 'inbound', 'London, UK', 'Karachi, Pakistan', '2024-01-29', '2024-02-07', '2024-02-08', 'delivered'),
(1, 'outbound', 'Karachi, Pakistan', 'Kuala Lumpur, Malaysia', '2024-01-10', '2024-01-20', NULL, 'in transit'),
(4, 'inbound', 'Singapore', 'Islamabad, Pakistan', '2024-02-03', '2024-02-12', '2024-02-14', 'delivered');


INSERT INTO ShipmentItems (shipment_id, order_item_id, quantity) VALUES
(1, 1, 50),
(1, 2, 30),
(2, 3, 40),
(2, 4, 60),
(3, 5, 70),
(4, 6, 80),
(4, 7, 90),
(5, 8, 100),
(6, 9, 110),
(6, 10, 120),
(7, 11, 130),
(8, 12, 140),
(9, 13, 150),
(9, 14, 160),
(10, 15, 170),
(11, 16, 180),
(12, 17, 190),
(13, 18, 200),
(14, 19, 210),
(15, 20, 220);



INSERT INTO Employees (first_name, last_name, email, phone, department_id, position, status) VALUES
('Ali', 'Ahmed', 'ali.ahmed@example.com', '03001234567', 6, 'Supply Chain Manager', 'active'),
('Fatima', 'Bibi', 'fatima.bibi@example.com', '03101234567', 2, 'HR Manager', 'active'),
('Omar', 'Ali', 'omar.ali@example.com', '03201234567', 3, 'IT Specialist', 'active'),
('Sara', 'Khan', 'sara.khan@example.com', '03301234567', 4, 'Sales Executive', 'on leave'),
('Ahmed', 'Raza', 'ahmed.raza@example.com', '03401234567', 5, 'Finance Officer', 'active'),
('Zainab', 'Shah', 'zainab.shah@example.com', '03501234567', 6, 'Logistics Coordinator', 'terminated'),
('Bilal', 'Khan', 'bilal.khan@example.com', '03601234567', 2, 'HR Assistant', 'active'),
('Raza', 'Iqbal', 'raza.iqbal@example.com', '03701234567', 3, 'System Administrator', 'active'),
('Mariam', 'Ali', 'mariam.ali@example.com', '03801234567', 4, 'Sales Representative', 'active'),
('Ayesha', 'Jamil', 'ayesha.jamil@example.com', '03901234567', 5, 'Accountant', 'active'),
('Hassan', 'Yousaf', 'hassan.yousaf@example.com', '04001234567', 6, 'Warehouse Manager', 'active'),
('Noor', 'Fatima', 'noor.fatima@example.com', '04101234567', 2, 'Recruitment Officer', 'on leave'),
('Farhan', 'Mehmood', 'farhan.mehmood@example.com', '04201234567', 3, 'Network Engineer', 'active'),
('Rashid', 'Qureshi', 'rashid.qureshi@example.com', '04301234567', 4, 'Customer Support', 'active'),
('Imran', 'Jamil', 'imran.jamil@example.com', '04401234567', 5, 'Finance Assistant', 'terminated'),
('Asma', 'Shah', 'asma.shah@example.com', '04501234567', 7, 'Inventory Control Specialist', 'active'),
('Bilal', 'Nasir', 'bilal.nasir@example.com', '04601234567', 2, 'Payroll Officer', 'active'),
('Sana', 'Rafiq', 'sana.rafiq@example.com', '04701234567', 3, 'Software Developer', 'active'),
('Kashif', 'Abid', 'kashif.abid@example.com', '04801234567', 4, 'Sales Coordinator', 'on leave'),
('Aftab', 'Hassan', 'aftab.hassan@example.com', '04901234567', 5, 'Financial Analyst', 'active');


INSERT INTO Departments (name,  location) VALUES
('Supply Chain',  'Karachi Head Office'),
('Human Resources',  'Lahore Branch'),
('Information Technology',  'Islamabad Office'),
('Sales & Marketing',  'Peshawar Regional Office'),
('Finance & Accounting',  'Quetta Office'),
('Logistics',  'Karachi Warehouse'),
('Customer Service',  'Lahore Support Center'),
('Recruitment',  'Rawalpindi Branch'),
('Inventory Management',  'Multan Warehouse'),
('Payroll & Benefits',  'Karachi HR Office'),
('Legal', 'Karachi Office'),
('Operations', 'Lahore Operations Center'),
('R&D', 'Islamabad R&D Center'),
('Business Development', 'Karachi Office'),
('Marketing', 'Lahore Office'),
('Procurement', 'Karachi Head Office'),
('Quality Assurance', 'Multan Facility'),
('Customer Experience', 'Rawalpindi Center'),
('Production', 'Karachi Plant'),
('Shipping', 'Karachi Warehouse');



-- Assigning Managers to Departments
UPDATE Departments SET manager_id = 21 WHERE name = 'Supply Chain';
UPDATE Departments SET manager_id = 22 WHERE name = 'Human Resources';
UPDATE Departments SET manager_id = 23 WHERE name = 'Information Technology';
UPDATE Departments SET manager_id = 4 WHERE name = 'Sales & Marketing';
UPDATE Departments SET manager_id = 5 WHERE name = 'Finance & Accounting';
UPDATE Departments SET manager_id = 6 WHERE name = 'Logistics';
UPDATE Departments SET manager_id = 7 WHERE name = 'Customer Service';
UPDATE Departments SET manager_id = 8 WHERE name = 'Recruitment';
UPDATE Departments SET manager_id = 9 WHERE name = 'Inventory Management';
UPDATE Departments SET manager_id = 10 WHERE name = 'Payroll & Benefits';
UPDATE Departments SET manager_id = 11 WHERE name = 'Legal';

SELECT * FROM Employees;
SELECT * FROM Departments;


INSERT INTO Invoices (order_id, due_date, amount_due, status) VALUES
(1, '2024-12-01', 150.75, 'unpaid'),
(2, '2024-12-15', 275.50, 'unpaid'),
(3, '2024-11-30', 380.00, 'paid'),
(4, '2024-12-20', 500.00, 'unpaid'),
(5, '2024-12-10', 220.00, 'overdue'),
(6, '2024-12-25', 150.00, 'unpaid'),
(7, '2024-12-05', 210.50, 'paid'),
(8, '2024-12-12', 125.00, 'overdue'),
(9, '2024-12-30', 350.75, 'unpaid'),
(10, '2024-12-22', 450.25, 'paid');

INSERT INTO Payments (invoice_id, amount, payment_method) VALUES
(1, 150.75, 'credit card'),
(2, 275.50, 'bank transfer'),
(3, 380.00, 'cash'),
(4, 500.00, 'credit card'),
(5, 220.00, 'bank transfer'),
(6, 150.00, 'cash'),
(7, 210.50, 'credit card'),
(8, 125.00, 'other'),
(9, 350.75, 'bank transfer'),
(10, 450.25, 'credit card');


INSERT INTO SupplierPerformanceMetrics (supplier_id, metric_date, on_time_delivery_rate, quality_score, cost_efficiency) VALUES
(1, '2023-01-15', 95.50, 92.00, 85.75),
(2, '2023-01-15', 89.00, 90.00, 87.25),
(3, '2023-02-20', 80.00, 85.50, 78.50),
(4, '2023-03-01', 97.00, 93.50, 92.00),
(5, '2023-04-10', 92.50, 88.00, 84.00),
(1, '2023-05-15', 94.50, 91.00, 86.00),
(2, '2023-06-01', 88.00, 89.50, 90.00),
(4, '2023-06-10', 98.00, 94.00, 91.50),
(3, '2023-07-05', 79.50, 84.00, 76.75),
(5, '2023-08-25', 91.50, 86.00, 83.00);


INSERT INTO OrderFulfillmentMetrics (order_id, fulfillment_date, lead_time, order_accuracy_rate, return_rate) VALUES
(1, '2023-01-20', 5, 98.00, 2.00),
(2, '2023-01-25', 3, 97.50, 1.00),
(3, '2023-02-10', 7, 95.00, 5.00),
(4, '2023-02-15', 4, 99.00, 1.50),
(5, '2023-03-05', 6, 94.50, 3.00),
(6, '2023-03-15', 2, 98.50, 0.50),
(7, '2023-04-01', 4, 96.00, 2.50),
(8, '2023-04-20', 5, 97.00, 2.00),
(9, '2023-05-10', 3, 99.50, 1.00),
(10, '2023-06-05', 8, 92.00, 6.00);


INSERT INTO InventoryTurnoverMetrics (product_id, warehouse_id, turnover_rate, period_start, period_end) VALUES
(1, 1, 5.25, '2023-01-01', '2023-03-31'),
(2, 1, 3.80, '2023-01-01', '2023-03-31'),
(3, 2, 7.50, '2023-01-01', '2023-03-31'),
(4, 2, 4.10, '2023-01-01', '2023-03-31'),
(5, 3, 2.00, '2023-01-01', '2023-03-31'),
(6, 3, 6.30, '2023-01-01', '2023-03-31'),
(7, 1, 8.20, '2023-04-01', '2023-06-30'),
(8, 1, 3.10, '2023-04-01', '2023-06-30'),
(9, 2, 5.60, '2023-04-01', '2023-06-30'),
(10, 2, 4.75, '2023-04-01', '2023-06-30'),
(11, 3, 7.85, '2023-04-01', '2023-06-30'),
(12, 3, 5.00, '2023-04-01', '2023-06-30');

INSERT INTO Users (username, password_hash, role_id, last_login, status) VALUES
('ali.ahmed', 'hashed_password_123', 1, '2024-11-01 10:30:00', 'active'),
('fatima.bibi', 'hashed_password_456', 2, '2024-11-02 14:15:00', 'active'),
('omar.ali', 'hashed_password_789', 3, '2024-11-03 16:45:00', 'disabled'),
('sara.khan', 'hashed_password_101', 2, '2024-11-04 09:00:00', 'active'),
('ahmed.raza', 'hashed_password_102', 1, '2024-11-05 11:30:00', 'active'),
('zainab.shah', 'hashed_password_103', 3, '2024-11-06 13:00:00', 'disabled'),
('bilal.khan', 'hashed_password_104', 2, '2024-11-07 08:45:00', 'active'),
('raza.iqbal', 'hashed_password_105', 3, '2024-11-08 17:30:00', 'active'),
('mariam.ali', 'hashed_password_106', 1, '2024-11-09 10:00:00', 'active'),
('ayesha.jamil', 'hashed_password_107', 2, '2024-11-10 12:30:00', 'disabled');




