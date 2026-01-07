\# Star Schema Design – FlexiMart Data Warehouse



\## Section 1: Schema Overview



FlexiMart’s data warehouse is designed using a star schema to support efficient analytical queries on historical sales data.



\### FACT TABLE: fact\_sales



Grain: One row per product per order line item  

Business Process: Sales transactions



Measures (Numeric Facts):

\- quantity\_sold: Number of units sold in the transaction

\- unit\_price: Price per unit at the time of sale

\- discount\_amount: Discount applied on the transaction

\- total\_amount: Final transaction amount (quantity × unit\_price − discount)



Foreign Keys:

\- date\_key → dim\_date

\- product\_key → dim\_product

\- customer\_key → dim\_customer



---



\### DIMENSION TABLE: dim\_date



Purpose: Enables time-based analysis such as daily, monthly, quarterly, and yearly trends.



Attributes:

\- date\_key (PK): Surrogate key in YYYYMMDD format

\- full\_date: Actual calendar date

\- day\_of\_week: Name of the day (Monday, Tuesday, etc.)

\- day\_of\_month: Numeric day of the month

\- month: Month number (1–12)

\- month\_name: Month name (January, February, etc.)

\- quarter: Quarter of the year (Q1–Q4)

\- year: Calendar year

\- is\_weekend: Boolean flag for weekend identification



---



\### DIMENSION TABLE: dim\_product



Purpose: Stores descriptive product information for product-level analysis.



Attributes:

\- product\_key (PK): Surrogate key

\- product\_id: Source system product identifier

\- product\_name: Name of the product

\- category: Product category

\- subcategory: More granular product classification

\- unit\_price: Standard product price



---



\### DIMENSION TABLE: dim\_customer



Purpose: Stores customer-related attributes for segmentation and behavior analysis.



Attributes:

\- customer\_key (PK): Surrogate key

\- customer\_id: Source system customer identifier

\- customer\_name: Full name of the customer

\- city: Customer’s city

\- state: Customer’s state

\- customer\_segment: Business-defined segment



---



\## Section 2: Design Decisions



The data warehouse uses a transaction line-item level granularity, meaning each row in the fact table represents a single product sold within an order. This provides maximum analytical flexibility, enabling detailed drill-down analysis and accurate aggregation.



Surrogate keys are used instead of natural keys to ensure stability and consistency. Natural keys from operational systems can change or be reused, whereas surrogate keys remain immutable and improve join performance across large datasets.



The star schema separates measurable facts from descriptive dimensions, resulting in simplified query logic and faster query execution. This design supports roll-up operations such as category-level or yearly sales summaries, as well as drill-down analysis from year to quarter, month, and day. Overall, this structure is optimized for analytical workloads and historical trend analysis.



---



\## Section 3: Sample Data Flow



Source Transaction  

Order #101  

Customer: John Doe  

Product: Laptop  

Quantity: 2  

Unit Price: ₹50,000  

Order Date: 2024-01-15  



Data Warehouse Representation



fact\_sales  

date\_key: 20240115  

product\_key: 5  

customer\_key: 12  

quantity\_sold: 2  

unit\_price: 50000  

discount\_amount: 0  

total\_amount: 100000  



dim\_date  

date\_key: 20240115  

full\_date: 2024-01-15  

month: 1  

month\_name: January  

quarter: Q1  

year: 2024  



dim\_product  

product\_key: 5  

product\_name: Laptop  

category: Electronics  

subcategory: Computing  



dim\_customer  

customer\_key: 12  

customer\_name: John Doe  

city: Mumbai  

customer\_segment: Premium  



