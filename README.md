# Creating Views

# SQL Views for Online Retail Database

This project demonstrates how to use SQL `CREATE VIEW` statements with a sample online retail database. It includes:

1. Complex `SELECT` queries using views  
2. Views for abstraction and security purposes

---

## ✅ 1. Using `CREATE VIEW` with Complex SELECT

These views combine multiple tables using JOINs and aggregations to simplify complex queries and support reporting and analysis.

### 🔹 View 1: `FullOrderDetails`
Shows complete order information including customer, product, payment, and quantity details.
```sql
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
