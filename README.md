# 🧾 SQL Views for Reporting, Abstraction & Security

This project demonstrates the use of **SQL Views** to simplify reporting, abstract complex joins, and secure sensitive information in a relational database.

The database schema includes tables for Customers, Orders, Products, OrderItems, and Payments. Using this data, views were created to serve various purposes such as analytics, abstraction, and access control.

---

## 🔍 1. Reporting Views

These views are designed to simplify **data analysis and reporting** by aggregating or joining data.

### ✅ View 1: `FullOrderDetails`
- Displays complete order information including customer name, products ordered, quantity, total price, and payment details.
- Combines data from multiple related tables to provide a full transactional view.

### ✅ View 2: `CustomerTotalSpending`
- Shows the total amount spent by each customer.
- Useful for customer value analysis and segmentation.

### ✅ View 3: `OrderItemSummary`
- Provides a summary of each order including number of items and total quantity.
- Ideal for order-level reporting and logistics planning.

### ✅ View 4: `MonthlyPayments`
- Aggregates total payments received per month.
- Useful for generating financial reports or analyzing monthly revenue trends.

---

## 🔒 2. Views for Abstraction & Security

These views are created to **hide complexity or restrict access** to sensitive data.

### ✅ View 5: `CustomerOrders`
- Shows each customer with their order IDs and order dates.
- Abstracts away complex joins for frontend access or application queries.

### ✅ View 6: `SafeCustomerView`
- Displays only non-sensitive customer information such as name and city.
- Hides personal data like email and phone for privacy/security.

### ✅ View 7: `ProductPriceList`
- Simple product listing with names and prices.
- Useful for public display or integration into web stores without revealing inventory or order details.

### ✅ View 8: `PaymentSummary`
- Displays payments made with amount and date, while hiding order IDs.
- Ideal for secure financial summaries or dashboards.

---

## 🎯 Outcome

- Developed 8 views to demonstrate different use cases: detailed reporting, data summarization, abstraction, and data security.
- Practiced JOINs, aggregations, and GROUP BY operations within views.
- Reinforced best practices in **modular SQL design**, making data easier to access, interpret, and protect.


