# Query Plan Analysis

## 1. Sequential Scans

🚨 PostgreSQL is scanning all rows in payments, users, bookings, and properties with no indexes being used.

This can be very inefficient for large tables. It means the database is reading every row instead of jumping directly to the relevant ones.

## 2. Hash Joins

PostgreSQL uses hash joins when it can't use an index or expects to handle a small number of rows.

Hash joins are okay for small datasets but can get memory-intensive and slow on bigger tables.

## 3. Join Order

The planner chooses a bottom-up strategy:

Joins bookings to users.

Adds in properties using LEFT JOIN.

Then adds in payments with a Right Hash Join, meaning payments are the outer source.