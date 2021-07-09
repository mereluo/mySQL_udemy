# Section 3

## 1. Table

### 1.1 Create Table

<pre> CREATE TABLE tablename
(
    column_name data_type,
    column_name data_type
);</pre>

For example:

<pre> CREATE TABLE cats
(
    name VARCHAR(100),
    age  INT
);
USE cats
</pre>

How to check your table:
<pre>
 SHOW TABLES;
 SHOW COLUMNS FROM cats;
 #a similar shortcut
 DESC cats;
</pre>

### 1.2 Drop Table

<pre>
DROP TABLE tablename;
</pre>

### 1.3 Worked Out Example

<pre>
SELECT database() # select the intended database
CREATE TABLE pastries
(
    name VARCHAR(50),
    quantity INT
);
SHOW TABLES
DESC pastries
DROP TABLE pastries
</pre>
