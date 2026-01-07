FlexiMart Database Schema Documentation



&nbsp;1. customers

Stores customer information.



Columns:

\- customer\_id (INT, PK, AUTO\_INCREMENT)

\- first\_name (VARCHAR)

\- last\_name (VARCHAR)

\- email (VARCHAR, UNIQUE)

\- phone (VARCHAR)

\- city (VARCHAR)

\- registration\_date (DATE)



&nbsp;2. products

Stores product catalog information.



Columns:

\- product\_id (INT, PK, AUTO\_INCREMENT)

\- product\_name (VARCHAR)

\- category (VARCHAR)

\- price (DECIMAL)

\- stock\_quantity (INT)



&nbsp;3. sales

Stores transaction-level sales data.



Columns:

\- sale\_id (INT, PK, AUTO\_INCREMENT)

\- customer\_id (INT, FK → customers.customer\_id)

\- product\_id (INT, FK → products.product\_id)

\- quantity (INT)

\- order\_date (DATE)

\- total\_amount (DECIMAL)



&nbsp;Relationships

\- One customer can have multiple sales

\- One product can appear in multiple sales
 Normalization Explanation (3NF)



The FlexiMart database schema is designed following Third Normal Form (3NF) principles to ensure data integrity and reduce redundancy.



First Normal Form (1NF) is satisfied because all tables contain atomic values and there are no repeating groups. Each column stores a single value, such as email, phone, or price.



Second Normal Form (2NF) is achieved as all non-key attributes are fully functionally dependent on the primary key. For example, in the customers table, attributes like first\_name, last\_name, email, city, and registration\_date depend only on customer\_id. Similarly, in the products table, product\_name, category, price, and stock\_quantity depend only on product\_id.



Third Normal Form (3NF) is satisfied because there are no transitive dependencies. Non-key attributes do not depend on other non-key attributes. For instance, customer email does not determine city or phone; they are independently related to customer\_id. In the sales table, quantity, order\_date, and total\_amount depend directly on sale\_id and not on customer or product attributes.



This design avoids update anomalies (changing customer data in multiple places), insert anomalies (adding products without sales), and delete anomalies (removing sales without losing customer information). Hence, the schema is fully normalized to 3NF.



\*Sample Data Representation



Customers Table



| customer\_id | first\_name | last\_name | email               | city     | registration\_date |

|------------ |-----------|-----------|---------------------|---------- |-------------------|

| 1           | Rahul     | Sharma    | rahul@gmail.com     | Delhi     | 2024-01-10        |

| 2           | Neha      | Verma     | neha@gmail.com      | Mumbai    | 2024-01-15        |



&nbsp;Products Table



| product\_id | product\_name     | category      | price   | stock\_quantity |

|----------- |------------------|---------------|---------|----------------|

| 1          | Organic Almonds  | Grocery       | 1299.00 | 0              |

| 2          | iPhone 14        | Electronics   | 69999.00| 10             |



&nbsp;Sales Table



| sale\_id | customer\_id | product\_id | quantity | order\_date  | total\_amount |

|-------- |-------------|------------|----------|-------------|--------------|

| 1       | 1           | 2          | 1        | 2024-01-15  | 69999.00     |

| 2       | 2           | 1          | 2        | 2024-01-20  | 2598.00      |



