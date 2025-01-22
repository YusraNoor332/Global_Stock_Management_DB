-- FUNCTIONS AND PROCEDURES FOR GLOBAL SUPLY CHAIN MANAGEMENT

use global_supply_chain;



-- PROCEDURES;

CREATE PROCEDURE AddSupplier 
    @s_name VARCHAR(120),
    @contact_name VARCHAR(120),
    @email VARCHAR(120),
    @phone VARCHAR(15),
    @country VARCHAR(80),
    @address VARCHAR(250),
    @rating FLOAT,
    @status VARCHAR(15)
AS
BEGIN
    INSERT INTO Supplier (s_name, contact_name, email, phone, country, address, rating, status)
    VALUES (@s_name, @contact_name, @email, @phone, @country, @address, @rating, @status);
END;

EXEC AddSupplier 
    @s_name = 'Arham Chaudhry', 
    @contact_name = 'Arham 101', 
    @email = 'arham@example.com', 
    @phone = '1234567890', 
    @country = 'Pakistan', 
    @address = 'Lahore', 
    @rating = 4.5, 
    @status = 'active';


CREATE PROCEDURE UpdateSupplierContractStatus
    @contract_id INT,
    @new_status VARCHAR(15)
AS
BEGIN
    UPDATE SupplierContract
    SET status = @new_status
    WHERE contract_id = @contract_id;
END;

EXEC UpdateSupplierContractStatus 
    @contract_id = 1, 
    @new_status = 'active';




CREATE PROCEDURE GetProductsByCategory
    @category_id INT
AS
BEGIN
    SELECT p.product_id, p.p_name, p.description, p.base_price, p.status
    FROM Products p
    WHERE p.category_id = @category_id;
END;

EXEC GetProductsByCategory 
    @category_id = 2;






CREATE PROCEDURE AddProductToInventory
    @warehouse_id INT,
    @product_id INT,
    @sku_id INT,
    @quantity INT,
    @reorder_level INT
AS
BEGIN
    INSERT INTO WarehouseInventory (warehouse_id, product_id, sku_id, quantity, reorder_level, last_restock_date)
    VALUES (@warehouse_id, @product_id, @sku_id, @quantity, @reorder_level, GETDATE());
END;

EXEC AddProductToInventory 
    @warehouse_id = 1, 
    @product_id = 1, 
    @sku_id = 2, 
    @quantity = 50, 
    @reorder_level = 10;









CREATE PROCEDURE UpdateInventoryQuantity
    @inventory_id INT,
    @new_quantity INT
AS
BEGIN
    UPDATE WarehouseInventory
    SET quantity = @new_quantity
    WHERE inventory_id = @inventory_id;
END;

EXEC UpdateInventoryQuantity 
    @inventory_id = 1, 
    @new_quantity = 100;




CREATE PROCEDURE CreateNewOrder
    @customer_id INT,
    @order_status VARCHAR(15),
    @total_amount DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Orders (customer_id, order_date, status, total_amount)
    VALUES (@customer_id, GETDATE(), @order_status, @total_amount);
END;

EXEC CreateNewOrder 
    @customer_id = 10, 
    @order_status = 'confirmed', 
    @total_amount = 150.00;










CREATE PROCEDURE AddItemsToOrder
    @order_id INT,
    @product_id INT,
    @sku_id INT,
    @quantity INT,
    @unit_price FLOAT,
    @discount FLOAT
AS
BEGIN
    DECLARE @total_price FLOAT;
    SET @total_price = (@unit_price * @quantity) - @discount;

    INSERT INTO OrderItems (order_id, product_id, sku_id, quantity, unit_price, discount, total_price)
    VALUES (@order_id, @product_id, @sku_id, @quantity, @unit_price, @discount, @total_price);
END;


EXEC AddItemsToOrder 
    @order_id = 5, 
    @product_id = 10, 
    @sku_id = 10, 
    @quantity = 3, 
    @unit_price = 50.00, 
    @discount = 10.00;








CREATE PROCEDURE GetOrderStatus
    @order_id INT
AS
BEGIN
    SELECT status
    FROM Orders
    WHERE order_id = @order_id;
END;


EXEC GetOrderStatus 
    @order_id = 5;







CREATE PROCEDURE TrackShipmentStatus
    @shipment_id INT
AS
BEGIN
    SELECT status
    FROM OrderShipments
    WHERE shipment_id = @shipment_id;
END;

EXEC TrackShipmentStatus 
    @shipment_id = 3;









CREATE PROCEDURE GenerateInvoice
    @order_id INT,
    @due_date DATE,
    @amount_due DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Invoices (order_id, invoice_date, due_date, amount_due, status)
    VALUES (@order_id, GETDATE(), @due_date, @amount_due, 'unpaid');
END;


EXEC GenerateInvoice 
    @order_id = 5, 
    @due_date = '2024-12-10', 
    @amount_due = 150.00;









CREATE PROCEDURE RecordPayment
    @invoice_id INT,
    @payment_date DATE,
    @amount DECIMAL(10, 2),
    @payment_method VARCHAR(50)
AS
BEGIN
    INSERT INTO Payments (invoice_id, payment_date, amount, payment_method)
    VALUES (@invoice_id, @payment_date, @amount, @payment_method);

    UPDATE Invoices
    SET status = 'paid'
    WHERE invoice_id = @invoice_id;
END;


EXEC RecordPayment 
    @invoice_id = 1, 
    @payment_date = '2024-11-22', 
    @amount = 150.00, 
    @payment_method = 'credit card';








CREATE PROCEDURE UpdateSupplierPerformanceMetrics
    @supplier_id INT,
    @metric_date DATE,
    @on_time_delivery_rate DECIMAL(5, 2),
    @quality_score DECIMAL(5, 2),
    @cost_efficiency DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO SupplierPerformanceMetrics (supplier_id, metric_date, on_time_delivery_rate, quality_score, cost_efficiency)
    VALUES (@supplier_id, @metric_date, @on_time_delivery_rate, @quality_score, @cost_efficiency);
END;

EXEC RecordPayment 
    @invoice_id = 1, 
    @payment_date = '2024-11-22', 
    @amount = 150.00, 
    @payment_method = 'credit card';









CREATE PROCEDURE UpdateInventoryTurnoverMetrics
    @product_id INT,
    @warehouse_id INT,
    @turnover_rate DECIMAL(10, 2),
    @period_start DATE,
    @period_end DATE
AS
BEGIN
    INSERT INTO InventoryTurnoverMetrics (product_id, warehouse_id, turnover_rate, period_start, period_end)
    VALUES (@product_id, @warehouse_id, @turnover_rate, @period_start, @period_end);
END;

EXEC UpdateInventoryTurnoverMetrics 
    @product_id = 10, 
    @warehouse_id = 1, 
    @turnover_rate = 10.5, 
    @period_start = '2024-01-01', 
    @period_end = '2024-06-30';






-- FUNCTIONS;



CREATE FUNCTION dbo.CalculateTotalOrderAmount (
    @order_id INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @total_amount DECIMAL(10, 2);
    
    SELECT @total_amount = SUM(
        (oi.quantity * oi.unit_price) - oi.discount
    )
    FROM OrderItems oi
    WHERE oi.order_id = @order_id;
    
    RETURN @total_amount;
END;

SELECT dbo.CalculateTotalOrderAmount(5) AS TotalAmount;






CREATE FUNCTION dbo.GetProductStockLevel (
    @product_id INT,
    @warehouse_id INT
)
RETURNS INT
AS
BEGIN
    DECLARE @stock_level INT;
    
    SELECT @stock_level = quantity
    FROM WarehouseInventory
    WHERE product_id = @product_id AND warehouse_id = @warehouse_id;
    
    IF @stock_level IS NULL
    BEGIN
        SET @stock_level = 0; -- Return 0 if no inventory record exists
    END
    
    RETURN @stock_level;
END;

SELECT dbo.GetProductStockLevel(1, 1) AS StockLevel;




CREATE FUNCTION dbo.GetSupplierRating (
    @supplier_id INT
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @rating FLOAT;
    
    SELECT @rating = rating
    FROM Supplier
    WHERE supplier_id = @supplier_id;
    
    RETURN @rating;
END;

SELECT dbo.GetSupplierRating(2) AS SupplierRating;



CREATE FUNCTION dbo.GetTotalSalesForProduct (
    @product_id INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @total_sales DECIMAL(10, 2);
    
    SELECT @total_sales = SUM(oi.total_price)
    FROM OrderItems oi
    WHERE oi.product_id = @product_id;
    
    RETURN @total_sales;
END;

SELECT dbo.GetTotalSalesForProduct(1) AS TotalSales;




CREATE FUNCTION dbo.GetActiveSupplierCount ()
RETURNS INT
AS
BEGIN
    DECLARE @active_supplier_count INT;
    
    SELECT @active_supplier_count = COUNT(*)
    FROM Supplier
    WHERE status = 'active';
    
    RETURN @active_supplier_count;
END;

SELECT dbo.GetActiveSupplierCount() AS ActiveSuppliers;



CREATE FUNCTION dbo.GetAverageOrderValue ()
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @avg_order_value DECIMAL(10, 2);
    
    SELECT @avg_order_value = AVG(total_amount)
    FROM Orders;
    
    RETURN @avg_order_value;
END;

SELECT dbo.GetAverageOrderValue() AS AverageOrderValue;




CREATE OR ALTER FUNCTION dbo.GetInventoryTurnoverRate (
    @product_id INT,
    @warehouse_id INT,
    @period_start DATE,
    @period_end DATE
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @turnover_rate DECIMAL(10, 2);
    
    SELECT @turnover_rate = turnover_rate
    FROM InventoryTurnoverMetrics
    WHERE product_id = @product_id
    AND warehouse_id = @warehouse_id
    AND period_start >= @period_start
    AND period_end <= @period_end;
    
    RETURN @turnover_rate;
END;

SELECT dbo.GetInventoryTurnoverRate(1, 1, '2024-01-01', '2024-06-30') AS TurnoverRate;





