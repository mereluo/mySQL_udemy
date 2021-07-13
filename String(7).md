# String functions

Functions include: **CONCAT, CONCAT_WS, SUBSTRING, REPLACE, REVERSE, CHAR_LENGTH, UPPER, LOWER**

## 0. Datasets Preparation

<pre>CREATE TABLE books
(
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY(book_id)
);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
</pre>

## 1. CONCAT and CONCAT_WS

<pre>
# 1. CONCAT
SELECT
    CONCAT(author_fname, ' ', author_lname)
FROM books;
#Change the output column names
# (1)
SELECT
    CONCAT(author_fname, ' ', author_lname)
    AS "full name"
FROM books;
# (2)
SELECT author_fname AS first, author_lname AS last, 
  CONCAT(author_fname, ' ', author_lname) AS full
FROM books;

# CONCAT_WS (with separator)
SELECT 
    CONCAT_WS(' - ', title, author_fname, author_lname)
FROM books;
</pre>

## 2. SUBSTRING

<pre># 2. Substring
SELECT SUBSTRING("hello world", 1, 4); #hell
SELECT SUBSTRING("hello world", 7); #world (from 7 to the last)
SELECT SUBSTRING('Hello World', -3); #rld (last 3 letters)
# Select from table
SELECT SUBSTRING(title, 1, 10)
    AS "short title"
FROM books;
# Combine CONCAT and Substring
SELECT CONCAT(
    SUBSTRING(title, 1, 10),
    "...")
    AS "short title"
FROM books;
</pre>

## 3. REPLACE

<pre># 3. Replace
SELECT REPLACE('HellO World', 'o', '*'); # case sensitive
SELECT REPLACE(title, "e", "3")
FROM books;
SELECT REPLACE(
    SUBSTRING(title, 1, 10), "e", "3")
    AS "weird string"
FROM books;
# Use cmd + / to comment multiple lines</pre>

## 4. REVERSE

<pre># 4. Reverse
SELECT REVERSE('woof');
SELECT CONCAT('woof', REVERSE('woof'));
SELECT CONCAT(author_fname, REVERSE(author_fname))
FROM books;
</pre>

## 5. CHAR_LENGTH

<pre>
SELECT CONCAT_WS(
    ' ',
    author_lname,
    "is",
    CHAR_LENGTH(author_lname),
    "characters long"
    )
    AS "name length"
FROM books;
</pre>

## 6. UPPER and LOWER

<pre>
# 6. Upper and Lower case
SELECT UPPER(title) FROM books;
SELECT LOWER(title) FROM books;
</pre>

## Exercise

<pre>
SELECT author_lname AS "forwards",
    REVERSE(author_lname) AS "backwards"
FROM books;

SELECT CONCAT(
    UPPER(author_fname),
    ' ',
    UPPER(author_lname))
    AS "full name in caps"
FROM books;

SELECT CONCAT(
    title,
    " was released in ",
    released_year
    ) AS "blurb"
FROM books;

SELECT title,
    CHAR_LENGTH(title) AS "Character count"
FROM books;

SELECT
    CONCAT(SUBSTRING(title, 1, 10),"...") AS "short title",
    CONCAT(author_lname, ",", author_fname) AS "author",
    CONCAT(stock_quantity, " in stock") AS "quantity"
FROM books;
</pre>
