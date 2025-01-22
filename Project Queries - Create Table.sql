
-- To reset the database
-- DROP DATABASE global_supply_chain;

CREATE DATABASE global_supply_chain;

USE global_supply_chain;


-- Tables for Supplier Management


CREATE TABLE Supplier(
	supplier_id INT IDENTITY(1,1) PRIMARY KEY,
	s_name VARCHAR(120),
	contact_name VARCHAR(120),
	email VARCHAR(120) UNIQUE,
	phone VARCHAR(15),
	country VARCHAR(80),
	address VARCHAR(250),
	rating FLOAT,
	status VARCHAR(15) CHECK( status IN ('active', 'inactive'))
);


CREATE TABLE SupplierContract(
	contract_id INT IDENTITY(1,1) PRIMARY KEY,
	supplier_id INT,
	start_date DATE DEFAULT GETDATE(),
	end_date DATE,
	contract_details VARCHAR(1500),
	terms VARCHAR(1500),
	status VARCHAR(15) CHECK( status IN ('active', 'expired', 'terminated' )),

	FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);


CREATE TABLE SupplierProducts(
	supplier_product_id INT IDENTITY(1,1) PRIMARY KEY,
	supplier_id INT,
	product_id INT, -- FK will be made later
	cost DECIMAL(10,2),
	delivery_lead_time INT, -- In Days

	FOREIGN KEY(supplier_id) REFERENCES Supplier(supplier_id)
);


-- Tables for Product Management

CREATE TABLE Products(
	product_id INT IDENTITY(1,1) PRIMARY KEY,
	p_name VARCHAR(120),
	description VARCHAR(1500),
	category_id INT, -- FK will be made later 
	weight FLOAT,
	length FLOAT, 
	width FLOAT, 
	height FLOAT,
	base_price DECIMAL(10,2),
	status VARCHAR(15) CHECK(status IN ('active','discontinued')),
);



-- Adding the foregn key contraint to SupplierProducts
ALTER TABLE SupplierProducts ADD CONSTRAINT FK_SupplierProduct_Product FOREIGN KEY(product_id) REFERENCES Products(product_id);


CREATE TABLE ProductCategories(
	category_id INT IDENTITY(1,1) PRIMARY KEY,
	category_name VARCHAR(120) UNIQUE,
	parent_category_id INT,  -- references records of same table
	description VARCHAR(1200)
);


-- Adding the foreign key constraint to Products
ALTER TABLE Products ADD CONSTRAINT FK_PRODUCTS_CATEGORY FOREIGN KEY(category_id) REFERENCES ProductCategories(category_id);


CREATE TABLE Variants (
    variant_id INT IDENTITY(1,1) PRIMARY KEY,
    variant_name VARCHAR(120) UNIQUE -- Examples: 'Size', 'Color'
);

CREATE TABLE VariantOptions (
    option_id INT IDENTITY(1,1) PRIMARY KEY,
    variant_id INT,  -- Links to Variants
    option_value VARCHAR(120), -- Examples: 'Small', 'Large', 'Red', 'Blue'
    FOREIGN KEY (variant_id) REFERENCES Variants(variant_id)
);

CREATE TABLE ProductSKUs(
	sku_id INT IDENTITY(1,1) PRIMARY KEY,
	product_id INT,
	sku_code VARCHAR(20),
	barcode VARCHAR(120),
	cost_price FLOAT,
	status VARCHAR(12) CHECK( status IN ('active', 'inactive')),

	FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE ProductSKUOptions (
    sku_option_id INT IDENTITY(1,1) PRIMARY KEY,
    sku_id INT,
    option_id INT,  -- Links to VariantOptions
    FOREIGN KEY (sku_id) REFERENCES ProductSKUs(sku_id),
    FOREIGN KEY (option_id) REFERENCES VariantOptions(option_id)
);


-- Tables for Inventory Management

CREATE TABLE Warehouse(
	warehouse_id INT IDENTITY(1,1) PRIMARY KEY,
	name  VARCHAR(120),
	location VARCHAR(250),
	capacity FLOAT, -- No of sq feet
	manager_id INT, -- FK will be set in future
);



CREATE TABLE WarehouseInventory(
	inventory_id INT IDENTITY(1,1) PRIMARY KEY,
	warehouse_id INT,
	product_id INT,
	sku_id INT,
	quantity INT,
	reorder_level INT,
	last_restock_date DATE,

	FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id),
	FOREIGN KEY (product_id) REFERENCES Products(product_id),
	FOREIGN KEY (sku_id) REFERENCES ProductSKUs(sku_id)
);


CREATE TABLE InventoryMovement(
	movement_id INT IDENTITY(1,1) PRIMARY KEY,
	inventory_id INT,
	quantity INT,
	movement_type VARCHAR(15) CHECK(movement_type IN ('addition', 'removal', 'adjustment')),
	movement_date DATE DEFAULT GETDATE(),
	reason VARCHAR(500),

	FOREIGN KEY(inventory_id) REFERENCES WarehouseInventory(inventory_id)
);


-- Tables for Order Management


CREATE TABLE Customers(
	customer_id INT IDENTITY(1,1) PRIMARY KEY,
	name  VARCHAR(120),
	email VARCHAR(120) UNIQUE,
	phone VARCHAR(15) UNIQUE,
	billing_address VARCHAR(250),
	shipping_address VARCHAR(250),
	customer_type VARCHAR(15) CHECK(customer_type IN ('business', 'individual')),
);


CREATE TABLE Orders(
	order_id INT IDENTITY(1,1) PRIMARY KEY,
	customer_id INT,
	order_date DATE DEFAULT GETDATE(),
	status VARCHAR(15) CHECK(status IN ('pending', 'confirmed', 'shipped', 'delivered', 'canceled')),
	total_amount DECIMAL(10,2)

	FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


CREATE TABLE OrderItems(
	order_item_id INT IDENTITY(1,1) PRIMARY KEY,
	order_id INT,
	product_id INT,
	sku_id INT,
	quantity INT,
	unit_price FLOAT,
	discount FLOAT,
	total_price FLOAT,

	FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	FOREIGN KEY (product_id) REFERENCES Products(product_id),
	FOREIGN KEY (sku_id) REFERENCES ProductSKUs(sku_id),
);


CREATE TABLE OrderShipments(
	shipment_id INT IDENTITY(1,1) PRIMARY KEY,
	order_id INT,
	shipment_date DATE,
	expected_delivery_date DATE,
	tracking_number INT,
	carrier_id INT, -- will refrence to (FK, references Carriers) in future
	status VARCHAR(15) CHECK(status IN ( 'in-transit', 'delivered', 'delayed')),

	FOREIGN KEY (order_id) REFERENCES Orders(order_id),
);




-- Tables for Logistics and Transportation

CREATE TABLE Carriers (
    carrier_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(120),
    contact_info VARCHAR(15),
    country VARCHAR(120),
    service_type VARCHAR(10) CHECK (service_type IN ('air', 'sea', 'ground')),
    rating FLOAT
);


ALTER TABLE OrderShipments ADD CONSTRAINT FK_Shipment_Carrier FOREIGN KEY(carrier_id) REFERENCES Carriers(carrier_id);


CREATE TABLE DeliveryAreas (
    area_id INT IDENTITY(1,1) PRIMARY KEY,
    area_name VARCHAR(120) UNIQUE -- E.g., 'North America', 'Europe', 'Asia'
);


CREATE TABLE CarrierDeliveryAreas (
    carrier_id INT,
    area_id INT,
    PRIMARY KEY (carrier_id, area_id),
    FOREIGN KEY (carrier_id) REFERENCES Carriers(carrier_id),
    FOREIGN KEY (area_id) REFERENCES DeliveryAreas(area_id)
);

CREATE TABLE Shipments (
    shipment_id INT IDENTITY(1,1) PRIMARY KEY,
    carrier_id INT,
    shipment_type VARCHAR(10) CHECK (shipment_type IN ('inbound', 'outbound')),
    origin VARCHAR(255),
    destination VARCHAR(255),
    departure_date DATE,
    estimated_arrival_date DATE,
    actual_arrival_date DATE,
    status VARCHAR(15) CHECK (status IN ('in transit', 'delivered', 'delayed')),

    FOREIGN KEY (carrier_id) REFERENCES Carriers(carrier_id)
);


CREATE TABLE ShipmentItems (
    shipment_item_id INT IDENTITY(1,1) PRIMARY KEY,
    shipment_id INT,
    order_item_id INT,
    quantity INT,

    FOREIGN KEY (shipment_id) REFERENCES Shipments(shipment_id),
    FOREIGN KEY (order_item_id) REFERENCES OrderItems(order_item_id)
);


-- Tables for Human Resources

CREATE TABLE Employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(120) NOT NULL,
    last_name VARCHAR(120) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    phone VARCHAR(15),
    department_id INT,  -- This will reference Departments table
    position VARCHAR(120),
    hire_date DATE DEFAULT GETDATE(),
    status VARCHAR(15) CHECK(status IN ('active', 'terminated', 'on leave')),
);


-- Creating the Departments table
CREATE TABLE Departments (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(120) UNIQUE,
    manager_id INT,  -- This will reference Employees table
    location VARCHAR(250),

    FOREIGN KEY (manager_id) REFERENCES Employees(employee_id)  -- Manager can be an employee
);


ALTER TABLE Employees ADD CONSTRAINT FK_Employees_Departments FOREIGN KEY(department_id) REFERENCES Departments(department_id);



-- Tables for Payment and Accounting

CREATE TABLE Invoices (
    invoice_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    invoice_date DATE DEFAULT GETDATE(),
    due_date DATE,
    amount_due DECIMAL(10,2),
    status VARCHAR(15) CHECK(status IN ('paid', 'unpaid', 'overdue')),
    
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Payments (
    payment_id INT IDENTITY(1,1) PRIMARY KEY,
    invoice_id INT,
    payment_date DATE DEFAULT GETDATE(),
    amount DECIMAL(10,2),
    payment_method VARCHAR(50) CHECK(payment_method IN ('credit card', 'bank transfer', 'cash', 'other')),
    
    FOREIGN KEY (invoice_id) REFERENCES Invoices(invoice_id)
);


-- Tables for  Analytics and Reporting

CREATE TABLE SupplierPerformanceMetrics (
    supplier_id INT, -- Foreign key referencing Suppliers
    metric_date DATE NOT NULL,
    on_time_delivery_rate DECIMAL(5, 2) CHECK (on_time_delivery_rate >= 0 AND on_time_delivery_rate <= 100),
    quality_score DECIMAL(5, 2) CHECK (quality_score >= 0 AND quality_score <= 100),
    cost_efficiency DECIMAL(10, 2),
    
    PRIMARY KEY (supplier_id, metric_date),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id) ON DELETE CASCADE
);


CREATE TABLE OrderFulfillmentMetrics (
    order_id INT, -- Foreign key referencing Orders
    fulfillment_date DATE NOT NULL,
    lead_time INT CHECK (lead_time >= 0), -- Lead time in days
    order_accuracy_rate DECIMAL(5, 2) CHECK (order_accuracy_rate >= 0 AND order_accuracy_rate <= 100),
    return_rate DECIMAL(5, 2) CHECK (return_rate >= 0 AND return_rate <= 100),

    PRIMARY KEY (order_id, fulfillment_date),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE
);


CREATE TABLE InventoryTurnoverMetrics (
    product_id INT, -- Foreign key referencing Products
    warehouse_id INT, -- Foreign key referencing Warehouses
    turnover_rate DECIMAL(10, 2),
    period_start DATE NOT NULL,
    period_end DATE NOT NULL,

    PRIMARY KEY (product_id, warehouse_id, period_start, period_end),
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE,
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id) ON DELETE CASCADE
);



-- Tables for System Security and Auditing

CREATE TABLE UserRoles (
    role_id INT IDENTITY(1,1) PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE
);

-- Insert possible roles
INSERT INTO UserRoles (role_name) VALUES ('admin'), ('manager'), ('staff');


CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255),
    role_id INT,
    last_login DATETIME,
    status VARCHAR(15) CHECK (status IN ('active', 'disabled')),
    FOREIGN KEY (role_id) REFERENCES UserRoles(role_id)
);


CREATE TABLE AuditLogs (
    log_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    action VARCHAR(10) CHECK (action IN ('create', 'update', 'delete')),
    table_name VARCHAR(100),
    record_id INT,
    timestamp DATETIME DEFAULT GETDATE(),
    description VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);





SELECT * FROM Departments;
SELECT * FROM ShipmentItems;
SELECT * FROM CarrierDeliveryAreas;
SELECT * FROM Carriers;
