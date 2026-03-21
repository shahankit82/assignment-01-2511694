# Architecture Choice

## Architecture Recommendation

For a fast-growing food delivery startup handling GPS logs, text reviews, payment transactions, and menu images, a **Data Lakehouse** is the right architecture.

A traditional Data Warehouse is eliminated immediately: it only handles structured, schema-defined data. GPS streams, free-text reviews, and JPEG menu images cannot be stored there without lossy transformation — precisely the kind of multi-modal, semi-structured data this startup generates at high velocity.

A pure Data Lake would store everything cheaply, but it offers no transactional guarantees and no query performance optimisations. Payment data in particular demands ACID compliance; a lake alone cannot reliably enforce consistency across concurrent writes or support fast analytical queries without significant additional tooling layered on top.

The Lakehouse combines the openness of a lake with warehouse-grade capabilities, and three properties make it the clear winner here:

**1. Unified multi-modal storage.** A single platform stores raw GPS coordinates, unstructured review text, structured payment records, and binary image files in their native formats — no forced schema at ingestion.

**2. ACID transactions on critical data.** Table formats such as Delta Lake or Apache Iceberg bring transactional semantics to the payment and order tables, ensuring financial records remain consistent even under high-concurrency writes.

**3. Scalable, cost-effective growth.** Object storage underpins the lake layer, keeping costs proportional to data volume. As the startup expands cities, the architecture scales horizontally without re-platforming — a significant operational advantage at growth stage.
