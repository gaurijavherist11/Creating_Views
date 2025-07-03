use gauridb1;

-- View 1: Full Order Details with Payments
CREATE VIEW FullOrderDetails AS
SELECT 
    o.order_id,
    c.name AS customer_name,
    p.product_name,
    oi.quantity,
    (oi.quantity * p.price) AS total_price,
    pay.amount_paid,
    pay.payment_date
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
LEFT JOIN Payments pay ON o.order_id = pay.order_id;

SELECT * FROM FullOrderDetails ;

-- View 2: Total Amount Spent by Each Customer
CREATE VIEW CustomerTotalSpending AS
SELECT 
    c.customer_id,
    c.name,
    SUM(oi.quantity * p.price) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.name;

SELECT * FROM CustomerTotalSpending;

-- View 3: Order Summary with Item Count
CREATE VIEW OrderItemSummary AS
SELECT 
    o.order_id,
    COUNT(oi.order_item_id) AS item_count,
    SUM(oi.quantity) AS total_quantity
FROM Orders o
JOIN OrderItems oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

SELECT * FROM OrderItemSummary;

-- View 4: Monthly Payment Report
CREATE VIEW MonthlyPayments AS
SELECT 
    MONTH(payment_date) AS payment_month,
    SUM(amount_paid) AS total_payments
FROM Payments
GROUP BY MONTH(payment_date);

SELECT * FROM MonthlyPayments;

--  2. Use Views for Abstraction and Security (Total 4 Views)
--  View 5: Abstracted Customer Order List (Hide Joins)
CREATE VIEW CustomerOrders AS
SELECT 
    c.name,
    o.order_id,
    o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

SELECT * FROM CustomerOrders;

-- View 6: Secure Customer View (Hide Email and Phone)
CREATE VIEW SafeCustomerView AS
SELECT 
    customer_id,
    name,
    city
FROM Customers;

SELECT * FROM SafeCustomerView;

-- View 7: Abstract Product Price List
CREATE VIEW ProductPriceList AS
SELECT 
    product_name,
    price
FROM Products;

SELECT * FROM ProductPriceList;

-- View 8: Payment Summary Without Order ID (Security Purpose)
CREATE VIEW PaymentSummary AS
SELECT 
    amount_paid,
    payment_date
FROM Payments;

SELECT * FROM PaymentSummary;
