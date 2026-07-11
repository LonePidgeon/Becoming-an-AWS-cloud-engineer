# Insert, Update, and Delete Data in a Database

Part of my **Becoming an AWS Cloud Engineer** learning journey.

## Overview

This lab covers core SQL data manipulation operations — `INSERT`, `UPDATE`, and `DELETE` — against a `world` database on a MySQL instance running on AWS EC2 (the "Command Host"). It also covers restoring a database from a `.sql` backup file.

**Duration:** ~45 minutes
**Tools used:** AWS EC2, AWS Systems Manager (Session Manager), MySQL CLI

## Objectives

By completing this lab, I practiced how to:

- Insert rows into a table
- Update rows in a table
- Delete rows from a table
- Import rows from a database backup file

## Environment Setup

Connected to the EC2 "Command Host" via AWS Systems Manager Session Manager, then connected to MySQL:

```bash
sudo su
cd /home/ec2-user/
mysql -u root --password='********'
```

> Note: credentials redacted — never commit real database passwords to a public repo.

Checked the existing databases:

```sql
SHOW DATABASES;
```

## Task 1: Insert Data into a Table

Confirmed the `country` table existed:

```sql
SELECT * FROM world.country;
```

Inserted two rows:

```sql
INSERT INTO world.country VALUES ('IRL','Ireland','Europe','British Islands',70273.00,1921,3775100,76.8,75921.00,73132.00,'Ireland/Éire','Republic',1447,'IE');

INSERT INTO world.country VALUES ('AUS','Australia','Oceania','Australia and New Zealand',7741220.00,1901,18886000,79.8,351182.00,392911.00,'Australia','Constitutional Monarchy, Federation',135,'AU');
```

Verified the insert:

```sql
SELECT * FROM world.country WHERE Code IN ('IRL', 'AUS');
```

Resulting rows:

| Code | Name | Continent | Region | SurfaceArea | IndepYear | Population | LifeExpectancy | GNP | GNPOld | LocalName | GovernmentForm | Capital | Code2 |
|------|------|-----------|--------|-------------|-----------|------------|-----------------|-----|--------|-----------|----------------|---------|-------|
| AUS | Australia | Oceania | Australia and New Zealand | 7741220 | 1901 | 18886000 | 79.8 | 351182 | 392911 | Australia | Constitutional Monarchy, Federation | 135 | AU |
| IRL | Ireland | Europe | British Islands | 70273 | 1921 | 3775100 | 76.8 | 75921 | 73132 | Ireland/Éire | Republic | 1447 | IE |

## Task 2: Update Rows in a Table

Updated `Population` for **all** rows (no `WHERE` clause):

```sql
UPDATE world.country SET Population = 0;
SELECT * FROM world.country;
```

Updated both `Population` and `SurfaceArea` for all rows:

```sql
UPDATE world.country SET Population = 100, SurfaceArea = 100;
SELECT * FROM world.country;
```

> Key takeaway: an `UPDATE` without a `WHERE` clause modifies every row in the table — this is a common and costly mistake in production databases.

## Task 3: Delete Rows from a Table

Deleted all rows from `country`:

```sql
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM world.country;
SELECT * FROM world.country;
```

> Just like `UPDATE`, a `DELETE` without a `WHERE` clause removes every row in the table. Both operations are destructive and generally not reversible without a backup — hence the caution.

## Task 4: Import Data Using a SQL File

Exited MySQL and confirmed the backup file was present:

```sql
QUIT;
```

```bash
ls /home/ec2-user/world.sql
```

Loaded the full `world` dataset from the backup script in one command instead of inserting rows individually:

```bash
mysql -u root --password='********' < /home/ec2-user/world.sql
```

Reconnected and verified the import:

```sql
mysql -u root --password='********'
USE world;
SHOW TABLES;
```

This restored all three tables — `city`, `country`, and `countrylanguage` — populated with data:

```sql
SELECT * FROM country;
SELECT * FROM city;
SELECT * FROM countrylanguage;
```

## Key Takeaways

- `INSERT INTO table VALUES (...)` adds new rows; values must match the column order defined by the schema.
- `UPDATE table SET column = value` modifies existing rows — **always** pair with a `WHERE` clause unless you intend to affect every row.
- `DELETE FROM table` removes rows — again, a missing `WHERE` clause means every row is deleted.
- Loading data from a `.sql` script file (`mysql ... < file.sql`) is far more efficient than manual row-by-row inserts, especially for restoring backups or seeding a database.

## Source

Lab dataset sourced from Statistics Finland, general regional statistics (February 4, 2022), used as part of an AWS training course.
