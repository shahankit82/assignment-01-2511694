Anomaly Analysis

1. Insert Anomaly

An  insert anomaly  occurs when we cannot insert data about one entity without inserting data about another entity.

Example:

The table stores  product information only when an order exists .
Columns involved:    product_id   ,    product_name   ,    category   ,    unit_price   .

Example rows:

   Row 0 →    order_id = ORD1027   ,    product_id = P004   ,    product_name = Notebook   
   Row 10 →    order_id = ORD1162   ,    product_id = P004   ,    product_name = Notebook   

Because product data is embedded in the orders table,  a new product cannot be added unless an order is created for it .
For example, if the company wants to add a new product like    P010 – Monitor   , it  cannot be inserted without creating a fake order , which is an insert anomaly.

---

2. Update Anomaly

An  update anomaly  occurs when the same information appears in multiple rows and must be updated in all of them.

Example:

Sales representative office addresses are repeated across many rows.

Columns involved:

      sales_rep_id   
      office_address   

Example rows:

   Row 1 →    sales_rep_id = SR01   ,    office_address = Mumbai HQ, Nariman Point, Mumbai - 400021   
   Row 37 →    sales_rep_id = SR01   ,    office_address = Mumbai HQ, Nariman Pt, Mumbai - 400021   

These rows refer to the  same sales representative (SR01)  but store  different versions of the office address :

      "Nariman Point"   
      "Nariman Pt"   

If the address changes, it must be updated in  every row containing SR01 , otherwise inconsistencies appear. This duplication leads to an  update anomaly .

---

3. Delete Anomaly

A  delete anomaly  occurs when deleting a row unintentionally removes important information about another entity.

Example:

Customer information is stored inside order records.

Columns involved:

      customer_id   
      customer_name   
      customer_email   
      customer_city   

Example row:

   Row 0 →    customer_id = C002   ,    customer_name = Priya Sharma   ,    customer_email = priya@gmail.com   

If the order    ORD1027    were deleted and it happened to be the  only order for customer C002 , then  all information about that customer would also be lost .

Thus, deleting an order can accidentally delete  customer data , which is a  delete anomaly .

---
**Normalization Justification**

Keeping all information in a single table may appear simpler at first, but the dataset demonstrates several problems that arise from this approach. When customer, product, sales representative, and order information are stored together in one flat table, the same data must be repeated across multiple rows. This repetition leads directly to the anomalies identified earlier.

For example, the **sales representative’s office address** appears in many rows because each order handled by that representative repeats the same information. If the office address changes, every row containing that representative’s details must be updated. If one row is missed, the database will contain inconsistent information. This is a clear example of an **update anomaly**, which can compromise data accuracy.

Similarly, product information such as **product name, category, and unit price** is repeated in every order containing that product. If the price of a product changes, multiple records would need to be modified. In a large dataset with thousands of orders, this increases the likelihood of errors and makes maintenance inefficient.

The flat structure also creates **insert and delete anomalies**. For instance, it would not be possible to add a new product to the system unless it appears in an order record. Likewise, deleting the only order associated with a particular customer could result in the loss of that customer’s details from the database entirely.

Normalising the schema to **Third Normal Form (3NF)** resolves these issues by separating the data into related tables such as **customers, products, orders, sales representatives, and order items**. Each table stores information about a single entity, with relationships managed through primary and foreign keys. This design reduces redundancy, ensures consistency, and improves the overall integrity and scalability of the database.


If you'd like, I can also help you write the  1NF → 2NF → 3NF normalization section , which usually comes right after this in the assignment.
