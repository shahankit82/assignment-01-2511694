// Use the products collection
// db.products is assumed as the MongoDB collection name


// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    order_id: "ORD1027",
    order_date: "2023-11-02",
    product: {
      product_id: "P004",
      product_name: "Notebook",
      category: "Stationery",
      unit_price: 120,
      quantity: 4
    },
    customer: {
      customer_id: "C002",
      name: "Priya Sharma",
      email: "priya@gmail.com",
      city: "Delhi"
    },
    sales_rep: {
      sales_rep_id: "SR02",
      name: "Anita Desai",
      email: "anita@corp.com",
      office_address: "Delhi Office, Connaught Place, New Delhi - 110001"
    }
  },
  {
    order_id: "ORD1002",
    order_date: "2023-01-17",
    product: {
      product_id: "P005",
      product_name: "Headphones",
      category: "Electronics",
      unit_price: 32000,
      quantity: 1
    },
    customer: {
      customer_id: "C002",
      name: "Priya Sharma",
      email: "priya@gmail.com",
      city: "Delhi"
    },
    sales_rep: {
      sales_rep_id: "SR02",
      name: "Anita Desai",
      email: "anita@corp.com",
      office_address: "Delhi Office, Connaught Place, New Delhi - 110001"
    }
  },
  {
    order_id: "ORD1075",
    order_date: "2023-04-18",
    product: {
      product_id: "P003",
      product_name: "Organic Milk",
      category: "Groceries",
      unit_price: 120,
      quantity: 2
    },
    expiry_date: ISODate("2024-12-20"),
    customer: {
      customer_id: "C005",
      name: "Vikram Singh",
      email: "vikram@gmail.com",
      city: "Mumbai"
    },
    sales_rep: {
      sales_rep_id: "SR03",
      name: "Ravi Kumar",
      email: "ravi@corp.com",
      office_address: "South Zone, MG Road, Bangalore - 560001"
    }
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  "product.category": "Electronics",
  "product.unit_price": { $gt: 20000 }
});


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  "product.category": "Groceries",
  expiry_date: { $lt: ISODate("2025-01-01") }
});


// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { "product.product_id": "P005" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field
db.products.createIndex({ "product.category": 1 });

// Explanation:
// Creating an index on the category field improves query performance
// when filtering products by category (e.g., Electronics or Groceries).
// MongoDB can quickly locate matching documents without scanning
// the entire collection, which is especially beneficial for large datasets.
