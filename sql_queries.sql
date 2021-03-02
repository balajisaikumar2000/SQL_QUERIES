
-- A database is an organized collection of structured information, or data, typically stored electronically in a computer system.
-- A database is usually controlled by a database management system (DBMS)
-- SQL is a programming language used by nearly all relational databases to query, manipulate, and define data, and to provide access control. 
-- Relational databases,Object-oriented databases,Distributed databases,Data warehouses,NoSQL databases,Graph databases,OLTP ,
-- Document/JSON database.
-- A database typically requires a comprehensive database software program known as a database management system (DBMS).
--  A DBMS serves as an interface between the database and its end users or programs, allowing users to retrieve, update, and manage 
--  how the information is organized and optimized. A DBMS also facilitates oversight and control of databases, 
--  enabling a variety of administrative operations such as performance monitoring, tuning, and backup and recovery.
-- Some examples of popular database software or DBMSs include MySQL, Microsoft Access, Microsoft SQL Server,
--  FileMaker Pro, Oracle Database, and dBASE.
-- MySQL is an open source relational database management system based on SQL. It was designed and optimized for web applications
--  and can run on any platform.
-- MySQL is RDBMS.IN RDBMS data is stored in the form of tables and there may be so many tables in database and they have relations among them.
-- TODO:in this file there may be some table_names and databases in which there data was not given but they are mentioned for sake of clarification and better understanding purpose

--syntax for creating a database
CREATE DATABASE database_name;
-- -- A specific example:
CREATE DATABASE soap_store;
-- List available databases:
show databases;
-- To drop a database:
DROP DATABASE database_name;
-- For Example:
DROP DATABASE hello_world_db;
--  creating our own tables
-- our tables has columns in them,in which each column has a distinct datatype
CREATE TABLE tablename (
  column_name data_type,
  column_name data_type
);
CREATE TABLE cats (name VARCHAR(100), age INT);
-- will show tables in that DATABASE :
SHOW TABLES;
-- will show columns in that TABLE
SHOW COLUMNS
FROM
  tablename;
-- or we can use below command both works same
  DESC tablename;
-- Dropping Tables:
  DROP TABLE tablename;
-- A specific example:
  DROP TABLE cats;
-- Be careful with the above  command ! they will delete  table itself;

TRUNCATE TABLE table_name;      --this will delete information in the table ,leaving the table itself

TRUNCATE TABLE cats;


  -- INSERTING DATA:
  -- The "formula":
INSERT INTO
  table_name(column_name)
VALUES
  (data);
-- For example:
INSERT INTO
  cats(name, age)
VALUES
  ('Jetson', 7);
--   selecting data :
SELECT
  *
FROM
  cats;
-- CODE: Multiple Insert
INSERT INTO
  table_name (column_name, column_name)
VALUES
  (value, value),
  (value, value),
  (value, value);
--   Escape the quotes with a backslash: "This text has \"quotes\" in it"
  -- or 'This text has \'quotes\' in it' Alternate single
  -- and double quotes: "This text has 'quotes' in it"
  -- or 'This text has "quotes" in it'
  -- TODO:   (todo means its a example)
  CREATE TABLE people (
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
  );
INSERT INTO
  people(first_name, last_name, age)
VALUES('Linda', 'Belcher', 45),('Phillip', 'Frond', 38),('Calvin', 'Fischoeder', 70);
-- Try inserting a cat with incorrect data types:
INSERT INTO
  cats(name, age)
VALUES('Lima', 'dsfasdfdas');
-- then we will get warinings
  -- Then view the warning:
  SHOW WARNINGS;
-- will show the warnings
  -- then we have to recrtify the problem
  CREATE TABLE cats2 (name VARCHAR(100) NOT NULL, age INT);
INSERT INTO
  cats2(name)
VALUES('Texas');
-- then age will  be  assigned NULL value
  CREATE TABLE cats2 (name VARCHAR(100) NOT NULL, age INT NOT NULL);
INSERT INTO
  cats2(name)
VALUES('Texas');
-- we will get warning ;
  CREATE TABLE cats4 (
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
  );
INSERT INTO
  cats()
VALUES();
SELECT
  *
FROM
  cats;
-- then we won't get any warnings deafult values will be assigned to them
  -- DEFINING PRIMARY KEY:
  CREATE TABLE unique_cats (
    cat_id INT NOT NULL,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
  );
-- OR
  CREATE TABLE unique_cats (
    cat_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
  );
-- CRUD OPERATIONS
  -- CREATE READ/RETRIEVE UPDATE DELETE:
  -- 1)CREATE :
INSERT INTO
  cats(name, age)
VALUES(‘ Taco ’, 14);
-- 2)READ/RETRIEVE:-
SELECT
  *
FROM
  cats;
SELECT
  name
FROM
  cats;
SELECT
  age
FROM
  cats;
SELECT
  cat_id
FROM
  cats;
SELECT
  name,
  age
FROM
  cats;
-- etc.,
  -- WHERE CLAUSE:-
SELECT
  *
FROM
  cats
WHERE
  age = 4;
-- Select by name:
SELECT
  *
FROM
  cats
WHERE
  name = 'Egg';
-- Notice how it deals with case:
SELECT
  *
FROM
  cats
WHERE
  name = 'egG';
-- Introduction to Aliases
SELECT
  cat_id AS id,
  name
FROM
  cats;
SELECT
  name AS 'cat name',
  breed AS 'kitty breed'
FROM
  cats;
SELECT
  name AS 'cat name',
  breed AS 'kitty breed'
FROM
  cats as renamed_cats;
-- UPDATE:-
  -- Change tabby cats to shorthair:?
UPDATE
  cats
SET
  breed = 'Shorthair'
WHERE
  breed = 'Tabby';
-- Another update:
UPDATE
  cats
SET
  age = 14
WHERE
  name = 'Misty';
-- DELETE:-
  -- delete will delete the row you mentioned with specific identities
DELETE FROM
  cats
WHERE
  name = 'Egg';
-- the below command will delete entire table as we didn't mentioned specific identities
DELETE FROM
  cats;
-- if we check with below command there will be no data exist in our table but our table will still exist with no DATA:-
SELECT * FROM cats;

-- #STRING FUNCTION:-
-- TODO:lets work with book data as a example for our convenience:-
DROP DATABASE IF EXISTS book_shop;
CREATE DATABASE book_shop;
USE book_shop; 
 
CREATE TABLE books 
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
  -- insert some data into the above books table:
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
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343)

-- #CONCAT():-

-- we can do all operation mentioned below:
CONCAT(x,y,z) 
 
CONCAT(column, anotherColumn) 
 
CONCAT(author_fname, author_lname)
 
CONCAT(column, 'text', anotherColumn, 'more text')
 
CONCAT(author_fname, ' ', author_lname)
 
CONCAT(author_fname, author_lname);


-- we can select our desired string with help of CONCAT() function
SELECT
  CONCAT(author_fname, ' ', author_lname)
FROM books;
 
SELECT
  CONCAT(author_fname, ' ', author_lname)
  AS 'full name'
FROM books;
 
SELECT author_fname AS first, author_lname AS last, 
  CONCAT(author_fname, ' ', author_lname) AS full
FROM books;

-- SUBSTRING():-
--in SQL string starts from 1 unlike other languages where they start from '0';
SELECT SUBSTRING('Hello World', 1, 4);       --will return HELL
 
SELECT SUBSTRING('Hello World', 7);          --will return string from the number we mentioned onwards ans) world
  
SELECT SUBSTRING('Hello World', 3, 8);        --will return llo worl

SELECT SUBSTRING('Hello World', 3);           --llo world
 
SELECT SUBSTRING('Hello World', -3);          --will return the string from backwards 
 
SELECT SUBSTRING('Hello World', -7);          --will return o world
-- we can't mention two numbers in substring() if it is the case with negative numbers

SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
 
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;

-- we can use both functions to work with simultaneously
SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    )
FROM books;

-- REPLACE():-

SELECT REPLACE('Hello World', 'Hell', '%$#@');       --the second parameter will replaced by third parameter 

SELECT REPLACE('HellO World', 'o', '*');

SELECT
    SUBSTRING(REPLACE(title, 'e', '3'), 1, 10)
FROM books;

-- REVERSE():-
SELECT REVERSE('meow meow');                       --woem woem

SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

-- CHAR_LENGTH():-
SELECT CHAR_LENGTH('Hello World');             --11

SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;


-- UPPER() AND LOWER():-
SELECT UPPER('Hello World');        --HELLO WORLD
 
SELECT LOWER('Hello World');        --hello world

-- TODO: some examples using string functions:

SELECT
   UPPER
   (
      CONCAT(author_fname, ' ', author_lname)
   ) AS 'full name in caps'
FROM books;


SELECT
   CONCAT(title, ' was released in ', released_year) AS blurb
FROM books;
SELECT
   title,
   CHAR_LENGTH(title) AS 'character count'
FROM books;


SELECT
   CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
   CONCAT(author_lname, ',', author_fname) AS author,
   CONCAT(stock_quantity, ' in stock') AS quantity
FROM books;

-- DISTINCT:-
-- distinct name itself tells that it will give the results which are distinct;

SELECT DISTINCT column_name FROM books;

SELECT DISTINCT author_lname FROM books;

-- ORDER BY :-
--intially ORDER BY will  order in ascending order ,we can order them in desc if we place a DESC in beside order by they will sort in  desdending order

SELECT author_lname FROM books ORDER BY author_lname;

SELECT author_lname FROM books ORDER BY author_lname DESC;

-- LIMIT:-
-- when we want data limitly we have to use LIMIT in our statement
SELECT title FROM books LIMIT 3;
 
SELECT title FROM books LIMIT 1;                    --will return only one row
 
SELECT title FROM books LIMIT 10;

SELECT title, released_year FROM books              --will return first three rows
ORDER BY released_year DESC LIMIT 0,3;
 
SELECT title, released_year FROM books               --will return rows 3 rows starting from 2nd row(1+1)(note:int this case they will act as a array)
ORDER BY released_year DESC LIMIT 1,3;
 

--  WILDCARDS:-
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';     --will return author_fname if 'da' exist in them anywhere
 
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';       --will return author_fname if they  startswith 'da' 
 
SELECT title FROM books WHERE  title LIKE 'the';                       --this is same as mentioning like '%the%'
 
SELECT title FROM books WHERE  title LIKE '%the';                      --if they end with the
 
SELECT title FROM books WHERE title LIKE '%the%';

SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';    --will retrun the rows in which they contain exactly 3 terms
 
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__';      --will retrun the rows in which they contain exactly 2 terms

SELECT title FROM books WHERE title LIKE '%\%%'                              --will retrun the rows in which they contain %

-- AGGREGATE FUNCTIONS:-

SELECT COUNT(*) FROM books;                                      --will count the rows

SELECT COUNT(DISTINCT author_lname) FROM books;

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

-- GROUP BY:-
-- group by will group by the mentioned column_name (group by means collecting similar data together)

SELECT title, author_lname FROM books
GROUP BY author_lname;
 
SELECT author_lname, COUNT(*)                            --will group by author_lname and will give columns as author_lname and count of similar author_lname
FROM books GROUP BY author_lname;

SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;

-- MAX() AND MIN():
SELECT MIN(released_year)        --return minimum released_years row
FROM books;

SELECT MAX(pages)                  --return max pages row
FROM books;

-- we can mention varchar datatype  columns 

-- CODE: Using Min and Max with Group By
SELECT author_fname, 
       author_lname, 
       Min(released_year) 
FROM   books 
GROUP  BY author_lname, 
          author_fname;
 
--  SUM:-

SELECT SUM(pages) FROM books;

 
SELECT author_fname,
       author_lname,
       Sum(pages)
FROM books
GROUP BY
    author_lname,
    author_fname;

SELECT SUM(column_name) from books;          --if the column_name datatype is character then sum will be '0'

-- AVG:-
SELECT AVG(released_year)  FROM books;

SELECT released_year, AVG(stock_quantity) 
FROM books 
GROUP BY released_year;

-- WORKING WITH DATA TYPES IN SQL:-
-- common datatypes are:-
-- CHAR AND VARCHAR
-- DECIMAL
-- FLOAT AND DOUBLE
-- DATE,TIME ,DATETIME
-- CURDATE,CURTIME,NOW
-- TIMESTAMP

-- CHAR VS VARCHAR:-
-- CHAR is character and VARCHAR is variable character
-- if CHAR(10) then we enter the data as 'ball' the column will take 10 bytes storage even though our mentioned string has 4 bytes value
-- if VARCHAR(10) then  we enter the data as 'ball' the column will take 4 bytes storage so it is varying according to DATABASE 
-- SO VARCHAR is prefferable to use

-- DECIMAL:-
CREATE TABLE items(price DECIMAL(5,2));                 --parameters are only 5 digits  will be displayed and with 2 digits after decimal point
 
INSERT INTO items(price) VALUES(7);                   --7.00
 
INSERT INTO items(price) VALUES(7987654);             --out of numbers
 
INSERT INTO items(price) VALUES(34.88);              --34.88
 
INSERT INTO items(price) VALUES(298.9999);            --298.99

-- FLOAT:-
-- FLOAT will round upto near values after 7 digits

INSERT INTO thingies(price) VALUES (88.45);            --88.45

INSERT INTO thingies(price) VALUES (8877.45);          --8877.45

INSERT INTO thingies(price) VALUES (8877665544.45);      --8877670000

-- DATE,TIME,DATETIME
DATE - 'yyyy-mm-dd' ,TIME- 'hh-mm-ss',DATETIME-'yyyy-mm-dd hh-mm-ss'
CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

-- CURDATE()--->current date,CURTIME()---->current time,NOW()--->current datetime

-- DATE MATH:-
SELECT * FROM people;
 
SELECT DATEDIFF(NOW(), birthdate) FROM people;
 
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;        --now will give present datetime

SELECT birthdt FROM people;
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;             --ADDS 1 month
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;           --adds 10seconds
 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;            --adds 3 quarters
 
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
 
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;
 
SELECT birthdt, birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR FROM people;
Fullscreen

-- DATETIME AND TIMESTAMP BOTH ARE similar BUT TIMESTAMP has a range of '1970-01-01 00:00:01' to '2038-01-19 03:14:07'


-- SOME DATE formats and methods:-
SELECT CURTIME();
 
SELECT CURDATE();
 
SELECT DAYOFWEEK(CURDATE());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(NOW(), '%w') + 1;
 
SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');
 
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
 
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');
 
CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');
SELECT * FROM tweets;
 
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');
SELECT * FROM tweets;

-- LOGIC OPERATORS:-

-- != (NOT EQUAL)
SELECT title FROM books WHERE released_year != 2017;


-- NOT LIKE
 
SELECT title FROM books WHERE title LIKE 'W%';
 
SELECT title FROM books WHERE title NOT LIKE 'W%';

-- > or >=

SELECT title, released_year FROM books 
WHERE released_year > 2000 ORDER BY released_year;
 
SELECT title, released_year FROM books 
WHERE released_year >= 2000 ORDER BY released_year;

select 9 > -10   -- true
 
select 1 > 1     -- false
 
select 'a' > 'b'  -- false(c>b>a)
 
select 'A' > 'a'   -- false(because in SQL is not case-sensitive)
 
SELECT 'A' >=  'a'    -- true

--  < or <=
SELECT title, released_year FROM books
WHERE released_year < 2000;

-- AND or &&-
SELECT 1 < 5 && 7 = 9;          -- false
 
SELECT -10 > -20 && 0 <= 0;      -- true
 
SELECT -40 <= 0 AND 10 > 40;     --false
 
SELECT 54 <= 54 && 'a' = 'A';     -- true

SELECT * 
FROM books
WHERE author_lname='Eggers' 
    AND released_year > 2010 
    AND title LIKE '%novel%';

-- OR (or) ||:-
 
 SELECT title, author_lname, released_year FROM books WHERE author_lname='Eggers' || released_year > 2010;
SELECT 40 <= 100 || -2 > 0;              -- true
 
SELECT 10 > 5 || 5 = 5;                 -- true
 
SELECT 'a' = 5 || 3000 > 2000;           -- true

-- BETWEEN :-
SELECT title, released_year FROM books 
WHERE released_year BETWEEN 2004 AND 2015;

-- is similar to

SELECT title, released_year FROM books 
WHERE released_year>=2004 and released_year<=2015;

SELECT title, released_year FROM books 
WHERE released_year NOT BETWEEN 2004 AND 2015;

-- IN and NOT IN:-
SELECT 
    title, 
    author_lname 
FROM books
WHERE author_lname='Carver' OR
      author_lname='Lahiri' OR
      author_lname='Smith';
 
--  can be written as:-
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT title, released_year FROM books
WHERE released_year != 2000 AND
      released_year != 2002 AND
      released_year != 2004 AND
      released_year != 2006 AND
      released_year != 2008 AND
      released_year != 2010 AND
      released_year != 2012 AND
      released_year != 2014 AND
      released_year != 2016;
 
--  can be written as:-
SELECT title, released_year FROM books
WHERE released_year NOT IN 
(2000,2002,2004,2006,2008,2010,2012,2014,2016);

-- CASE:-
SELECT title,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;
 
-- ex-2:-
SELECT author_fname, author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books 
GROUP BY author_lname, author_fname;

-- JOINS:-
-- there are several types of joins
-- INNER JOIN
-- SELF JOIN
-- JOINING different databases tables
-- IMPLICIT JOIN 
--EXPLICIT JOIN 
-- OUTER JOIN
-- OUTER JOIN BETWEEN MULTIPLE TABLES
-- SELF OUTER JOINS
-- NATURAL JOINS
-- CROSS JOINS

-- CROSS JOIN:-
SELECT * FROM customers, orders; 
--if we run the above command then we will get rows in which customers rows are crossed joined with orders rows

-- IMPLICIT INNER JOIN:-
SELECT * FROM customers, orders 
WHERE customers.id = orders.customer_id;

-- EXPLICIT INNER JOINS:-
SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customer_id;

    --  is same as 
SELECT * FROM customers
INNER JOIN orders
    ON customers.id = orders.customer_id;

-- LEFT JOINS
--left join will give rows which are common+ all rows in customers according below problem
SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;

SELECT 
    first_name, 
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;


-- RIGHT JOINS:-
--right join will give the common rows + all rows in orders according to below problem:-
SELECT 
    first_name, 
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent;

-- TRICK:-
SELECT * FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;

    -- is same as

SELECT * FROM orders
LEFT JOIN customers
    ON customers.id = orders.customer_id;

-- USING CLAUSE:-
SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customer_id;
    --  is same as
SELECT * FROM customers
JOIN orders
    USING(customer_id);       --NOTE:they should have the same column_name

-- NATURAL JOINS:-
SELECT * FROM customers
NATURAL JOIN orders        --they will automatically see the common column names and they will attach them,but this is not recommended

-- UNIONS:-
-- with joins we can combine columns from multiple tables
-- with unions we can combine rows from multiple tables
SELECT  order_id,order_date ,'Active' as status from orders where order_date >= '2019-01-01'; ----this is one query from a TABLE
SELECT  order_id,order_date ,'Archived' as status from orders where order_date < '2019-01-01'; ----this is another query from a TABLE

-- if we execute above queries seperately the output will different in different tables 
SELECT
  order_id,
  order_date,
  'Active' as status
from
  orders
where
  order_date >= '2019-01-01'
UNION
SELECT
  order_id,
  order_date,
  'Archived' as status
from
  orders
where
  order_date < '2019-01-0';
-- the above query will give a table with combined 

-- REGEXP:-

SELECT  * FROM customers WHERE last_name REGEXP 'field'  --will give the rows that contains field in the last_name

--  ^ ---
SELECT
  *
FROM
  customers
WHERE
  last_name REGEXP '^field'  --will give the rows that contains field as starting word in the last_name

---  $  ---
SELECT
  *
FROM
  customers
WHERE
  last_name REGEXP 'field$' --will give the rows that contains field as ending  word in the last_name

---  | --- 
SELECT
  *
FROM
  customers
WHERE
  last_name REGEXP 'field|mac' --will give the rows that contains field or  mac or both if exists in the last_name

SELECT
  *
FROM
  customers
WHERE
  last_name REGEXP '^field|mac|rose';

  SELECT
  *
FROM
  customers
WHERE
  last_name REGEXP '[gim]e'   --will return rows in which there are 'e' and  before 'e' there should be 'g' or 'i' or 'm'

SELECT
  *
FROM
  customers
WHERE
  last_name REGEXP '[a-h]e';       --will return rows which contains 'e' and before 'e' there should be letters between a-h


-- What is a NULL Value?
-- A field with a NULL value is a field with no value.

-- If a field in a table is optional, it is possible to insert a new record or update a record without adding a value to this field. Then, the field will be saved with a NULL value.

-- Note: A NULL value is different from a zero value or a field that contains spaces. A field with a NULL value is one that has been left blank during record creation!

-- How to Test for NULL Values?
-- It is not possible to test for NULL values with comparison operators, such as =, <, or <>.

-- We will have to use the IS NULL and IS NOT NULL operators instead.

-- IS NULL Syntax:-
SELECT column_names
FROM table_name
WHERE column_name IS NULL;

-- IS NOT NULL Syntax:-
SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;


-- HAVING:-
-- The HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions.
-- aggreagate functions are count(),sum(),avg(),min(),max()
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;

-- the above wont work if we replace having with where

-- The EXISTS operator is used to test for the existence of any record in a subquery.

-- The EXISTS operator returns true if the subquery returns one or more records.

SELECT SupplierName                  --this query will give suppliername column if the subquery returns true and suppliername that is equal to the productname in the subquery)
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price < 20);

SELECT SupplierName              --this is same as above
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price = 22);



-- stored procedure;
DELIMITER $$                        

CREATE PROCEDURE GetCustomers()                 --here paranthesis must be ,other wise procedure won't work
BEGIN                                            --in between the BEGIN and  END the query will start and end ,we can query whatever we want like joins, group by etc.,
  SELECT 
    customerName, 
    city, 
    state, 
    postalCode, 
    country
  FROM
    customers
  ORDER BY customerName;    
END$$
DELIMITER ;

CALL GetCustomers();                              --will execute the query,

-- Create Table Using Another Table
-- all values will be copied to new table with same schema
-- we can use where statemnet to copy specific one's only
CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;
-- ex:-
CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;
-- ex2:-
CREATE TABLE TestTable2 AS
SELECT customername, contactname
FROM customers where 1=0;            --this will create new table with empty data and with the same schema

-- ALTER TABLE:-
-- The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

-- The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

-- ADD:-
ALTER TABLE table_name
ADD column_name datatype;

ALTER TABLE Customers
ADD Email varchar(255);

-- DROP:-
ALTER TABLE table_name
DROP COLUMN column_name;

ALTER TABLE Customers
DROP COLUMN Email;

-- MODIFY COLUMN:-
ALTER TABLE table_name
MODIFY COLUMN column_name datatype;

-- SQL Constraints
-- SQL constraints are used to specify rules for the data in a table.

-- NOT NULL - Ensures that a column cannot have a NULL value
-- UNIQUE - Ensures that all values in a column are different
-- PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
-- FOREIGN KEY - Uniquely identifies a row/record in another table
-- CHECK - Ensures that all values in a column satisfies a specific condition
-- DEFAULT - Sets a default value for a column when no value is specified
-- INDEX - Used to create and retrieve data from the database very quickly

-- SQL CHECK Constraint
-- The CHECK constraint is used to limit the value range that can be placed in a column.

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);

ALTER TABLE Persons
ADD CHECK (Age>=18);



-- VIEWS:-
-- SQL CREATE VIEW Statement
-- In SQL, a view is a virtual table based on the result-set of an SQL statement.

-- A view contains rows and columns, just like a real table. The fields in a view are
--  fields from one or more real tables in the database.

-- You can add SQL functions, WHERE, and JOIN statements to a view and present the data as if the data
--  were coming from one single table.

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

CREATE VIEW Brazil Customers AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';


-- if we want see the view type the below command:-
SHOW TABLES;                     --here view will also be under tables list

SHOW FULL TABLES;                 --will show the view name as 'view'

SELECT * FROM Brazil Customers;                 --will show our view(result table for our selection query)

-- insert into select:-
INSERT INTO table_name(column_list)
SELECT 
   select_list 
FROM 
   another_table
WHERE
   condition;

-- ex:-
INSERT INTO suppliers (                --suppliers table must have the all columns as same from the table it is selecting 
    supplierName, 
    phone, 
    addressLine1,
    addressLine2,
    city
)
SELECT 
    customerName,
    phone,
    addressLine1,
    addressLine2,
    city
FROM 
    customers
WHERE 
    country = 'USA' AND 
    state = 'CA';

-- FIELD():-
SELECT 
    orderNumber, 
    status
FROM
    orders
ORDER BY 
    FIELD(status,
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped');

-- returns the index of the status in the list 'In Process', 'On Hold', 'Cancelled', 'Resolved', 'Disputed', 'Shipped'



-- MySQL INSERT ON DUPLICATE KEY UPDATE example:-
CREATE TABLE devices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO devices(name)
VALUES('Router F1'),('Switch 1'),('Switch 2');

INSERT INTO 
   devices(name) 
VALUES 
   ('Printer') 
ON DUPLICATE KEY UPDATE name = 'Printer';



-- triggers in udemy;-
CREATE TRIGGER trigger_name 
    trigger_time trigger_event ON table_name FOR EACH ROW
    BEGIN
    ...
    END;

-- ex:1:-
create table users(
username varchar(100),
age int);
insert into users(username,age) values('bobby',23);

DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18                                  --NEW represents the row we are now inserting.it is like instance .it is similar to 'this' in javascript and 'self' in python
          THEN
              SIGNAL SQLSTATE '45000'                       ---this sqlstate '45000' means we created a condition which will give error if we voilate them
                    SET MESSAGE_TEXT = 'Must be an adult!';   ---the text that associated with them
          END IF;
     END;
$$

DELIMITER ;

insert into users(username,age) values('bobby',23);         ---this works fine cause here -> age is > 18

insert into users(username,age) values('balaji',13);       ---this doesn't work and will give error because  here -> age <18 

-- ex-2:-
DELIMITER $$

CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW 
BEGIN
    INSERT INTO unfollows
    SET follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
END$$

DELIMITER ;

SHOW TRIGGERS;

DROP TRIGGER trigger_name;

--testing purpose
