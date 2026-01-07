FlexiMart Enterprise Data Architecture Implementation
Student Information:

Name: Farah Alam
Student ID: BITSoM_BA_25071001
Email: farahalam35@gmail.com
Course: Data for Artificial Intelligence
Submission Date: 8 January 2026
Executive Summary
This project presents a comprehensive, enterprise-grade data architecture solution for FlexiMart, a multi-channel e-commerce platform. The implementation encompasses a complete data engineering lifecycle, from raw data ingestion through analytical intelligence delivery, leveraging both relational database management systems (RDBMS) and NoSQL technologies integrated with a dimensional data warehouse architecture.

The solution demonstrates proficiency in Extract, Transform, Load (ETL) pipeline development, relational database normalization (up to Third Normal Form), document-oriented data modeling, dimensional modeling utilizing star schema architecture, and Online Analytical Processing (OLAP) for business intelligence operations.

Repository Architecture
The codebase is structured into three functionally distinct modules:

Module 1 – Relational Database Implementation & ETL Pipeline
Implementation of a Python-based ETL workflow that performs data extraction from CSV sources, applies data cleansing and transformation logic, and loads structured data entities (customers, products, sales transactions) into a MySQL relational database. Includes comprehensive schema documentation, entity-relationship diagrams (ERD), and transactional SQL queries addressing business intelligence requirements.

Module 2 – NoSQL Database Analysis & Implementation
Technical justification and implementation of MongoDB as the document store for semi-structured product catalog data. Features document-based data modeling, schema flexibility analysis, and implementation of CRUD (Create, Read, Update, Delete) operations optimized for hierarchical product attribute management.

Module 3 – Data Warehouse Design & OLAP Analytics
Development of a dimensional data model based on star schema methodology, data warehouse instantiation, fact and dimension table population, and execution of complex OLAP queries supporting multidimensional analysis across sales metrics, product performance indicators, and customer segmentation analytics.

Technology Stack
Programming Language: Python 3.x
Data Processing Framework: pandas (data manipulation and transformation)
RDBMS Connector: mysql-connector-python (database connectivity layer)
Relational Database: MySQL 8.0 (OLTP and data warehouse implementation)
NoSQL Database: MongoDB 6.0 (document-oriented storage)
Query Language: SQL (DDL, DML, and analytical queries)
Technical Competencies Demonstrated
ETL Pipeline Engineering: Developed production-ready ETL workflows addressing real-world data quality challenges including missing values, duplicate records, data type inconsistencies, and referential integrity constraints.
Database Normalization: Applied systematic normalization principles (1NF, 2NF, 3NF) to eliminate data redundancy and ensure transactional integrity within the relational database architecture.
Polyglot Persistence Strategy: Evaluated and implemented appropriate database technologies (RDBMS vs. NoSQL) based on specific data characteristics, access patterns, and scalability requirements.
Dimensional Modeling: Architected a star schema-based data warehouse facilitating efficient aggregation, drill-down analysis, and business intelligence reporting across multiple dimensions.
Analytical Query Development: Constructed sophisticated SQL queries leveraging aggregation functions, window functions, JOINs, subqueries, and GROUP BY operations to extract actionable business insights.
Quality Assurance & Compliance
All Python scripts execute successfully with zero runtime errors
Data volumetric requirements satisfy assignment specifications
Repository structure adheres to prescribed organizational guidelines
Code follows industry best practices for maintainability and documentation
