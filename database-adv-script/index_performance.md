# Implement Indexes for Optimization

```sql

    CREATE INDEX idx_bookings_start_date
    ON bookings (start_date);

    CREATE INDEX idx_bookings_status 
    ON bookings (status);

    CREATE INDEX idx_bookings_user_id 
    ON bookings (user_id);

    CREATE INDEX idx_properties_host_id
    ON properties (host_id);

    CREATE INDEX idx_properties_country
    ON properties (country);

    CREATE INDEX idx_properties_state
    ON properties (state);

    CREATE INDEX idx_properties_pricepernight
    ON properties (pricepernight);
```

## Query to get booking price above 1900 without indexing

```sql
    SELECT * 
    FROM bookings 
    WHERE start_date = '2025-07-01';
```

![query_result_BEFORE_indexing_for_bookings(total_price)](image.png)

## Query to get booking price above 1900 with indexing

```sql
    EXPLAIN (ANALYZE, VERBOSE, BUFFERS) SELECT * 
    FROM bookings
    WHERE total_price > 1900;
```

![query_result_AFTER_indexing_for_bookings(total_price](image-1.png)

## Query to get bookings at start_date without indexing

```sql
    EXPLAIN ANALYZE SELECT *
    FROM bookings
    WHERE start_date = '2025-07-01';
```

![query_result_BEFORE_indexing_for_bookings(start_date)](image-2.png)

![query_result_AFTER_indexing_for_bookings(start_date)](image-3.png)
