# CRUD

CRUD: **Create Read Update Delete** \
link: <http://webdev.slides.com/coltsteele/mysql-99-100>

## 1. Create

<pre>SHOW databases;
USE cat_app;
SHOW tables;</pre>

<pre>CREATE TABLE cats
  (
     cat_id INT NOT NULL AUTO_INCREMENT,
     name   VARCHAR(100),
     breed  VARCHAR(100),
     age    INT,
     PRIMARY KEY (cat_id)
  );
  
INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
</pre>

## 2. Read

<pre># * means all columns
SELECT * FROM cats;
# order matters
SELECT age, breed, name, cat_id FROM cats;
SELECT cat_id, name, age, breed FROM cats;

# WHERE
SELECT * FROM cats WHERE age=4;
# case insensitive
SELECT * FROM cats WHERE name='Egg';
SELECT * FROM cats WHERE name='egG';

# Aliases (change displayed column name)
SELECT cat_id AS id, name FROM cats;
SELECT name AS 'cat name', breed AS 'kitty breed' FROM cats;</pre>

## 3. Update

<pre># Update
UPDATE cats SET breed="shorthair" WHERE breed="Tabby";
UPDATE cats SET age=14 WHERE name="Misty";

# Challenge
UPDATE cats SET name="Jack" WHERE name="Jackson";
UPDATE cats SET breed="British shorthair" WHERE name="Ringo";
UPDATE cats SET age=12 WHERE breed="Maine Coon";</pre>

## 4. Delete

<pre># DELETE
DELETE FROM cats WHERE name='Egg';
DELETE FROM cats;</pre>
