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

If you'd like, I can also help you write the  1NF → 2NF → 3NF normalization section , which usually comes right after this in the assignment.
