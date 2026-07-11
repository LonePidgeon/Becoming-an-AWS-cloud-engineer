# Database Table Operations Lab

Part of my **Becoming an AWS Cloud Engineer** learning journey.

## Overview

This lab covers fundamental relational database operations using MySQL on an AWS EC2 instance ("Command Host"). The goal was to practice creating, altering, and dropping databases and tables using standard SQL commands.

**Duration:** ~45 minutes
**Tools used:** AWS EC2, AWS Systems Manager (Session Manager), MySQL CLI

## Objectives

By completing this lab, I practiced how to:

- Use the `CREATE` statement to create databases and tables
- Use the `SHOW` statement to view available databases and tables
- Use the `ALTER` statement to modify a table's structure
- Use the `DROP` statement to delete databases and tables

## Environment Setup

Connected to an EC2 "Command Host" instance via AWS Systems Manager Session Manager, then accessed the MySQL client:

```bash
sudo su
cd /home/ec2-user/
mysql -u root --password='********'
```

> Note: credentials redacted — never commit real database passwords to a public repo.

## Task 1: Connecting to the Database

Verified the database client connection and listed existing databases:

```sql
SHOW DATABASES;
```

## Task 2: Creating a Database and Table

Created a new database called `world`:

```sql
CREATE DATABASE world;
SHOW DATABASES;
```

Created a `country` table with a full schema (country code, name, continent, region, population, GNP, etc.):

```sql
CREATE TABLE world.country (
  `Code` CHAR(3) NOT NULL DEFAULT '',
  `Name` CHAR(52) NOT NULL DEFAULT '',
  `Conitinent` enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL DEFAULT 'Asia',
  `Region` CHAR(26) NOT NULL DEFAULT '',
  `SurfaceArea` FLOAT(10,2) NOT NULL DEFAULT '0.00',
  `IndepYear` SMALLINT(6) DEFAULT NULL,
  `Population` INT(11) NOT NULL DEFAULT '0',
  `LifeExpectancy` FLOAT(3,1) DEFAULT NULL,
  `GNP` FLOAT(10,2) DEFAULT NULL,
  `GNPOld` FLOAT(10,2) DEFAULT NULL,
  `LocalName` CHAR(45) NOT NULL DEFAULT '',
  `GovernmentForm` CHAR(45) NOT NULL DEFAULT '',
  `HeadOfState` CHAR(60) DEFAULT NULL,
  `Capital` INT(11) DEFAULT NULL,
  `Code2` CHAR(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`Code`)
);
```

Verified the table and inspected its columns:

```sql
USE world;
SHOW TABLES;
SHOW COLUMNS FROM world.country;
```

### Fixing a schema typo

The `Continent` column was misspelled as `Conitinent` in the original schema. Used `ALTER TABLE` to rename it:

```sql
ALTER TABLE world.country RENAME COLUMN Conitinent TO Continent;
SHOW COLUMNS FROM world.country;
```

### Challenge 1: Create a `city` table

Created a `city` table with `Name` and `Region` columns using the `CHAR` data type:

```sql
CREATE TABLE world.city (
  `Name` CHAR(35) NOT NULL DEFAULT '',
  `Region` CHAR(26) NOT NULL DEFAULT ''
);
```

## Task 3: Deleting Databases and Tables

Dropped the `city` table:

```sql
DROP TABLE world.city;
```

### Challenge 2: Drop the `country` table

```sql
DROP TABLE world.country;
```

Verified both tables were removed:

```sql
SHOW TABLES;
```

Finally, dropped the entire `world` database:

```sql
DROP DATABASE world;
SHOW DATABASES;
```

## Key Takeaways

- `CREATE DATABASE` / `CREATE TABLE` define new database objects and schemas.
- `SHOW DATABASES` / `SHOW TABLES` / `SHOW COLUMNS` are essential for inspecting the current state of a database.
- `ALTER TABLE` allows schema changes (like renaming a column) without recreating the table.
- `DROP TABLE` / `DROP DATABASE` are destructive and irreversible without a backup — tables must generally be dropped before the containing database if manually cleaning up.

## Source

Lab dataset sourced from Statistics Finland, general regional statistics (February 4, 2022), used as part of an AWS training course.
