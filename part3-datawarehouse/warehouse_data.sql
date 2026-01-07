USE fleximart_dw;

-- =========================
-- dim_date (30 dates: Jan–Feb 2024)
-- =========================
INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,0),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,0),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,0),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,0),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,0),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,1),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,1),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,0),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,0),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,0),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,0),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,0),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,1),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,1),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,0),
(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,0),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,0),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,1),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,1),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,0),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,0),
(20240207,'2024-02-07','Wednesday',7,2,'February','Q1',2024,0),
(20240208,'2024-02-08','Thursday',8,2,'February','Q1',2024,0),
(20240209,'2024-02-09','Friday',9,2,'February','Q1',2024,0),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,1),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,1),
(20240212,'2024-02-12','Monday',12,2,'February','Q1',2024,0),
(20240213,'2024-02-13','Tuesday',13,2,'February','Q1',2024,0),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,0),
(20240215,'2024-02-15','Thursday',15,2,'February','Q1',2024,0);

-- =========================
-- dim_product (15 products)
-- =========================
INSERT INTO dim_product (product_id,product_name,category,subcategory,unit_price) VALUES
('P001','Laptop Pro','Electronics','Laptop',50000),
('P002','Smartphone X','Electronics','Mobile',30000),
('P003','Headphones','Electronics','Accessories',2000),
('P004','Office Chair','Furniture','Chair',8000),
('P005','Dining Table','Furniture','Table',25000),
('P006','Notebook','Stationery','Paper',100),
('P007','Pen Set','Stationery','Writing',300),
('P008','LED TV','Electronics','TV',45000),
('P009','Washing Machine','Electronics','Appliance',38000),
('P010','Sofa','Furniture','Seating',60000),
('P011','Bookshelf','Furniture','Storage',12000),
('P012','Backpack','Accessories','Bag',2500),
('P013','Shoes','Fashion','Footwear',4000),
('P014','T-Shirt','Fashion','Clothing',1200),
('P015','Jeans','Fashion','Clothing',2500);

-- =========================
-- dim_customer (12 customers)
-- =========================
INSERT INTO dim_customer (customer_id,customer_name,city,state,customer_segment) VALUES
('C001','Amit Sharma','Delhi','Delhi','Retail'),
('C002','Neha Verma','Mumbai','Maharashtra','Retail'),
('C003','Rahul Singh','Bangalore','Karnataka','Retail'),
('C004','Pooja Mehta','Ahmedabad','Gujarat','Retail'),
('C005','Karan Patel','Surat','Gujarat','Retail'),
('C006','Sneha Roy','Kolkata','West Bengal','Retail'),
('C007','Rohit Gupta','Delhi','Delhi','Corporate'),
('C008','Anjali Jain','Jaipur','Rajasthan','Retail'),
('C009','Vikas Malhotra','Chandigarh','Punjab','Corporate'),
('C010','Simran Kaur','Amritsar','Punjab','Retail'),
('C011','Arjun Nair','Kochi','Kerala','Retail'),
('C012','Priya Iyer','Chennai','Tamil Nadu','Corporate');

-- =========================
-- fact_sales (40 transactions)
-- =========================
INSERT INTO fact_sales
(date_key,product_key,customer_key,quantity_sold,unit_price,discount_amount,total_amount) VALUES
(20240101,1,1,1,50000,0,50000),
(20240102,2,2,2,30000,2000,58000),
(20240103,3,3,3,2000,0,6000),
(20240104,4,4,1,8000,0,8000),
(20240105,5,5,1,25000,1000,24000),
(20240106,6,6,10,100,0,1000),
(20240107,7,7,5,300,0,1500),
(20240108,8,8,1,45000,3000,42000),
(20240109,9,9,1,38000,2000,36000),
(20240110,10,10,1,60000,5000,55000),
(20240111,11,11,2,12000,0,24000),
(20240112,12,12,2,2500,0,5000),
(20240113,13,1,3,4000,0,12000),
(20240114,14,2,4,1200,0,4800),
(20240115,15,3,2,2500,0,5000),
(20240201,1,4,1,50000,0,50000),
(20240202,2,5,1,30000,0,30000),
(20240203,3,6,2,2000,0,4000),
(20240204,4,7,2,8000,0,16000),
(20240205,5,8,1,25000,0,25000),
(20240206,6,9,8,100,0,800),
(20240207,7,10,6,300,0,1800),
(20240208,8,11,1,45000,0,45000),
(20240209,9,12,1,38000,2000,36000),
(20240210,10,1,1,60000,4000,56000),
(20240211,11,2,1,12000,0,12000),
(20240212,12,3,3,2500,0,7500),
(20240213,13,4,2,4000,0,8000),
(20240214,14,5,5,1200,0,6000),
(20240215,15,6,2,2500,0,5000),
(20240102,4,7,1,8000,0,8000),
(20240103,5,8,1,25000,0,25000),
(20240104,6,9,15,100,0,1500),
(20240105,7,10,4,300,0,1200),
(20240106,8,11,1,45000,0,45000),
(20240107,9,12,1,38000,0,38000),
(20240108,10,1,1,60000,5000,55000),
(20240109,11,2,2,12000,0,24000),
(20240110,12,3,2,2500,0,5000),
(20240111,13,4,3,4000,0,12000);

