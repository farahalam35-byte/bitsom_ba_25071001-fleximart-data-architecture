Section A: Limitations of Relational Databases (RDBMS)

Relational databases such as MySQL are effective for managing structured data with a predefined schema. However, they become less efficient when dealing with highly varied data structures. In an e-commerce platform like FlexiMart, different product categories require different sets of attributes. For instance, laptops may have specifications like RAM, processor, and storage, whereas shoes require attributes such as size, color, and material. Managing this diversity in an RDBMS often leads to numerous nullable fields or the creation of multiple tables, which increases design complexity and maintenance overhead.



Another limitation is the lack of flexibility in handling frequent schema changes. Introducing new product categories typically requires modifying existing table structures, which can be time-consuming and risky in a live production environment. This reduces system agility and slows down feature development. Moreover, storing hierarchical or nested data such as customer reviews is inefficient in relational databases, as such data must be separated into different tables and accessed through joins, increasing query complexity and impacting performance.



Section B: Advantages of MongoDB for Product Catalog Management

MongoDB overcomes these challenges through its flexible, document-oriented data model. Each product document can store only the fields relevant to that specific product type, making MongoDB well-suited for managing diverse product categories within a single collection.



Additionally, MongoDB supports embedded documents, enabling customer reviews to be stored directly within product documents. This approach simplifies data retrieval and improves read performance by allowing all related information to be fetched in a single query. MongoDB also offers horizontal scalability through sharding, which distributes data across multiple servers. This makes it highly suitable for large-scale e-commerce platforms with rapidly expanding product catalogs.



Section C: Limitations and Trade-offs of MongoDB

Despite its flexibility, MongoDB has certain limitations. It does not provide strong relational constraints such as foreign key enforcement, which increases the risk of data inconsistency if validation is not carefully managed at the application level. Furthermore, MongoDB is not ideal for systems that require complex transactions with strict ACID guarantees across multiple entities. In such use cases, relational databases like MySQL offer greater reliability and consistency.

