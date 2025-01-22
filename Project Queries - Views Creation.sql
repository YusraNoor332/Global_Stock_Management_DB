-- Queries to create and See the views in database
use global_supply_chain;


CREATE VIEW OrderSummary AS
SELECT
    o.order_id,
    o.order_date,
    o.status AS order_status,
    c.name AS customer_name,
    c.email AS customer_email,
    c.phone AS customer_phone,
    o.total_amount,
    i.invoice_date,
    i.due_date,
    i.amount_due,
    i.status AS invoice_status
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
LEFT JOIN Invoices i ON o.order_id = i.order_id;



SELECT * FROM OrderSummary;




CREATE VIEW SalesPerformance AS
SELECT 
	p.product_id,
    p.p_name AS product_name,
	COUNT(oi.order_item_id) AS total_orders,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.total_price) AS total_sales
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.p_name;

SELECT * FROM SalesPerformance;



CREATE VIEW InventoryTurnover AS
SELECT
    p.product_id,
    p.p_name AS product_name,
    w.warehouse_id,
    w.name AS warehouse_name,
    itm.turnover_rate,
    itm.period_start,
    itm.period_end
FROM InventoryTurnoverMetrics itm
JOIN Products p ON itm.product_id = p.product_id
JOIN Warehouse w ON itm.warehouse_id = w.warehouse_id;

SELECT * FROM InventoryTurnover;



CREATE VIEW SupplierPerformance AS
SELECT
    s.supplier_id,
    s.s_name AS supplier_name,
    spm.metric_date,
    spm.on_time_delivery_rate,
    spm.quality_score,
    spm.cost_efficiency
FROM SupplierPerformanceMetrics spm
JOIN Supplier s ON spm.supplier_id = s.supplier_id;

SELECT * FROM SupplierPerformance;



CREATE VIEW SupplierProductCostSummary AS
SELECT
    s.s_name AS supplier_name,
    p.p_name AS product_name,
    sp.cost AS product_cost,
    sp.delivery_lead_time AS delivery_lead_time_days
FROM SupplierProducts sp
JOIN Supplier s ON sp.supplier_id = s.supplier_id
JOIN Products p ON sp.product_id = p.product_id
WHERE sp.cost > 0;
SELECT * FROM SupplierProductCostSummary;



CREATE VIEW CustomerOrderHistoryWithPayments AS
SELECT
    c.name AS customer_name,
    c.email AS customer_email,
    o.order_id,
    o.order_date,
    o.status AS order_status,
    o.total_amount,
    i.invoice_date,
    i.amount_due,
    i.status AS invoice_status,
    p.payment_date,
    p.amount AS payment_amount,
    p.payment_method
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
LEFT JOIN Invoices i ON o.order_id = i.order_id
LEFT JOIN Payments p ON i.invoice_id = p.invoice_id;

SELECT * FROM CustomerOrderHistoryWithPayments;




CREATE VIEW WarehouseInventoryOverview AS
SELECT
    w.name AS warehouse_name,
    p.p_name AS product_name,
    wi.quantity AS current_quantity,
    wi.reorder_level,
    wi.last_restock_date
FROM WarehouseInventory wi
JOIN Warehouse w ON wi.warehouse_id = w.warehouse_id
JOIN Products p ON wi.product_id = p.product_id
WHERE wi.quantity <= wi.reorder_level;

SELECT * FROM WarehouseInventoryOverview;



CREATE VIEW SupplierPerformanceOverview AS
SELECT
    s.s_name AS supplier_name,
    spm.metric_date,
    spm.on_time_delivery_rate,
    spm.quality_score,
    spm.cost_efficiency
FROM SupplierPerformanceMetrics spm
JOIN Supplier s ON spm.supplier_id = s.supplier_id
WHERE spm.on_time_delivery_rate > 0;
SELECT * FROM SupplierPerformanceOverview;


CREATE VIEW OrderFulfillmentPerformance AS
SELECT
    o.order_id,
    o.order_date,
    ofm.fulfillment_date,
    ofm.lead_time,
    ofm.order_accuracy_rate,
    ofm.return_rate
FROM OrderFulfillmentMetrics ofm
JOIN Orders o ON ofm.order_id = o.order_id;

SELECT * FROM OrderFulfillmentPerformance;




CREATE VIEW ProductsByCategoryWithSuppliers AS
SELECT
    pc.category_name,
    p.p_name AS product_name,
    s.s_name AS supplier_name
FROM Products p
JOIN ProductCategories pc ON p.category_id = pc.category_id
JOIN SupplierProducts sp ON p.product_id = sp.product_id
JOIN Supplier s ON sp.supplier_id = s.supplier_id;


SELECT * FROM ProductsByCategoryWithSuppliers;




CREATE VIEW EmployeeDepartmentOverview AS
SELECT
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    e.position AS employee_position,
    e.status AS employee_status,
    d.name AS department_name,
    m.first_name AS manager_first_name,
    m.last_name AS manager_last_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
LEFT JOIN Employees m ON d.manager_id = m.employee_id;
SELECT * FROM EmployeeDepartmentOverview;




CREATE VIEW CarrierShipmentOverview AS
SELECT
    c.name AS carrier_name,
    s.shipment_id,
    s.shipment_type,
    s.origin,
    s.destination,
    s.departure_date,
    s.estimated_arrival_date,
    s.actual_arrival_date,
    s.status AS shipment_status
FROM Shipments s
JOIN Carriers c ON s.carrier_id = c.carrier_id;
SELECT * FROM CarrierShipmentOverview;



CREATE VIEW ProductSalesSummary AS
SELECT
    p.p_name AS product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.total_price) AS total_revenue
FROM OrderItems oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.p_name;


SELECT * FROM ProductSalesSummary;


