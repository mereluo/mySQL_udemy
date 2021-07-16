# Section 3 and 4 Table

A database is just a bunch of tables

slide link: <http://webdev.slides.com/coltsteele/mysql-97-98#/68/0/0>

## Section 3: Create/Drop Table

### 3.1 Create Table

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

### 3.2 Drop Table

<pre>
DROP TABLE tablename;
</pre>

## Section 4: Insert values

### 4.1 basic syntax

The "formula":
<pre>INSERT INTO table_name(column_name) VALUES (data);
</pre>

For example:
<pre>INSERT INTO cats(name, age) VALUES ('Jetson', 7);
</pre>

Know if I did it right:
<pre>SELECT * FROM cats;</pre>

Multiple insertion:
<pre>
INSERT INTO table_name
            (column_name, column_name)
VALUES      (value, value),
            (value, value),
            (value, value);
</pre>

If you're wondering how to insert a string (VARCHAR) value that contains **quotations**, then here's how.

* Escape the quotes with a backslash: "This text has \\"quotes\\" in it" or 'This text has \\'quotes\\' in it'

* Alternate single and double quotes: "This text has 'quotes' in it" or 'This text has "quotes" in it'

### 4.2 Warnings

Try Inserting a cat with a super long name:

<pre>INSERT INTO cats(name, age)
VALUES('This is some text blah blah blah blah blah text text text something about cats lalalalal meowwwwwwwwwww', 10);
SHOW WARNINGS;</pre>

Try inserting a cat with incorrect data types:

<pre>INSERT INTO cats(name, age) VALUES('Lima', 'dsfasdfdas');
SHOW WARNINGS;</pre>

If it is an error:
<pre> set sql_mode='';</pre>

### 4.3 NULL and NOT NULL Code

**Null: The value is unknown.**

(1) Try inserting an ageless cat:

<pre>INSERT INTO cats(name) VALUES('Alabama');
SELECT * FROM cats;
</pre>

(2) Try inserting a nameless and ageless cat:

<pre>INSERT INTO cats() VALUES();</pre>

(3) Define a new **cats2** table with **NOT NULL** constraints:

<pre>CREATE TABLE cats2
  (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
  );
DESC cats2;</pre>

(4) Now try inserting an ageless cat:

<pre>INSERT INTO cats2(name) VALUES('Texas');</pre>

<pre>SHOW WARNINGS;
SELECT * FROM cats2;</pre>

(5) Do the same for a nameless cat:

<pre>INSERT INTO cats2(age) VALUES(7);
SHOW WARNINGS;</pre>

### 4.4 Setting Default Values

**Define a table with a DEFAULT name specified:**

<pre>CREATE TABLE cats3
(
    name VARCHAR(20) DEFAULT 'no name provided',
    age INT DEFAULT 99
)
</pre>

**Combine NOT NULL and DEFAULT:**
<pre>CREATE TABLE cats4
(
    name VARCHAR(20) NOT NULL DEFAULT "unnamed",
    age INT NOT NULL DEFAULT 99
)
</pre>

**Notice The Difference:**

<pre>INSERT INTO cats() VALUES();
SELECT * FROM cats;

INSERT INTO cats3() VALUES();
SELECT * FROM cats3;

INSERT INTO cats3(name, age) VALUES('Montana', NULL);
SELECT * FROM cats3;

INSERT INTO cats4(name, age) VALUES('Cali', NULL);
</pre>

### 4.5 Primary key

<pre>
CREATE TABLE unique_cats (cat_id INT NOT NULL
                      ,name VARCHAR(100)
                      ,age INT
                      ,PRIMARY KEY (cat_id));
DESC unique_cats;

INSERT INTO unique_cats(cat_id, name, age) VALUES(1, "Fred", 23);
SELECT * FROM unique_cats;

INSERT INTO unique_cats(cat_id, name, age) VALUES(2, "Fred", 23);
SELECT * FROM unique_cats;
</pre>

**Auto increment for primary key:**

<pre>
CREATE TABLE unique_cats2 (cat_id INT NOT NULL AUTO_INCREMENT
                      ,name VARCHAR(100)
                      ,age INT
                      ,PRIMARY KEY (cat_id));

INSERT INTO unique_cats2(name, age) VALUES("Fred", 23);
INSERT INTO unique_cats2(name, age) VALUES("Sally", 3);
SELECT * FROM unique_cats2;
</pre>
