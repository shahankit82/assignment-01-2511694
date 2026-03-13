## ETL Decisions

### Decision 1 — Standardising Date Formats

**Problem:**
The raw `retail_transactions.csv` dataset contained dates in multiple formats, such as `29/08/2023`, `12-12-2023`, and `2023-02-05`. This inconsistency makes it difficult to perform time-based analysis because SQL databases expect a consistent date format for sorting, filtering, and aggregations. If these formats were loaded directly into the warehouse, queries such as monthly sales trends or year-based reporting could produce incorrect results or fail to execute properly.

**Resolution:**
All dates were converted into the **ISO standard format (YYYY-MM-DD)** during the transformation stage of the ETL process. This ensured compatibility with SQL `DATE` data types and allowed the creation of the `dim_date` table with clearly defined attributes such as `day`, `month`, and `year`. Standardising the date format ensures that analytical queries, such as month-over-month sales trends, can be executed reliably and consistently.

---

### Decision 2 — Standardising Product Category Casing

**Problem:**
The raw data contained inconsistent casing for product categories. For example, categories appeared as `electronics`, `Electronics`, and `ELECTRONICS`. Such inconsistencies can cause duplicate categories to appear in reports and dashboards. For instance, a revenue report grouped by category might treat these values as separate groups, resulting in inaccurate analytics.

**Resolution:**
During data transformation, all category values were standardised to **Title Case** (e.g., `Electronics`, `Furniture`, `Groceries`). This ensured that each category appeared only once in the `dim_product` table. By normalising the text values before loading them into the warehouse, reporting tools can correctly aggregate sales data by category.

---

### Decision 3 — Handling Missing or NULL Values

**Problem:**
Some records in the raw dataset contained **NULL or missing values** for important fields such as product category or store information. Loading incomplete records directly into the warehouse could lead to broken foreign key relationships and inaccurate reporting.

**Resolution:**
Missing values were addressed during the transformation phase by either **filling them with valid default values or removing incomplete records where necessary**. For example, records missing required dimension attributes were cleaned before being inserted into the dimension tables. This ensured that all rows inserted into the `fact_sales` table referenced valid keys in `dim_date`, `dim_store`, and `dim_product`, maintaining referential integrity and improving the reliability of analytical queries.
