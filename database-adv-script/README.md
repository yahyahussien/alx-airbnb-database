# 📘 SQL Join Mastery: Querying Across Multiple Tables

This project demonstrates mastery of SQL JOINs by writing and executing queries using `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN` to extract meaningful relational data from multiple tables.

## 📌 Objective

Gain a deep understanding of how different types of SQL joins work by crafting real-world queries that highlight how data is connected across tables—even when that connection is partial or missing.

---

## 1️⃣ INNER JOIN — Bookings with Their Users

**Purpose:** Retrieve only bookings that are linked to an existing user.

```sql
SELECT a.user_id, a.first_name, b.booking_id 
FROM users a
INNER JOIN bookings b ON a.user_id = b.user_id;
```

✅ Returns: Only bookings that have a matching user in the users table.

---

## 2️⃣ LEFT JOIN — All Properties with Their Reviews (if any)

**Purpose:** List all properties and include any associated reviews. If a property has no reviews, it should still appear with NULL values for review fields.

```sql
SELECT * 
FROM properties a
LEFT JOIN reviews b ON a.property_id = b.property_id
ORDER BY b.rating;
```

✅ Returns: Every property, reviewed or not.

---

## 3️⃣ FULL OUTER JOIN — All Users and All Bookings

**Purpose:**  Retrieve all users and all bookings, including users with no bookings and bookings with no linked user.

```sql
SELECT * 
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id;
```

✅ Returns:

Users with bookings

Users without bookings

Bookings without a valid user

---