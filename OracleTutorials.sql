select count(*) from CONTACTS;
select count(*) from COUNTRIES;
select count(*) from CUSTOMERS;
select count(*) from EMPLOYEES;
select count(*) from INVENTORIES;
select count(*) from LOCATIONS;
select count(*) from ORDERS;
select count(*) from ORDER_ITEMS;
select count(*) from PRODUCT_CATEGORIES;
select count(*) from PRODUCTS;
select count(*) from REGIONS;
select count(*) from WAREHOUSES;


--***************************************
--Section 1 : Querying Data
--***************************************

--Oracle SELECT examples
--Let’s take some examples of using the Oracle SELECT statement to understand how it works.

--A) query data from a single column
--To get the customer names from the customers table, you use the following statement:

SELECT
  name
FROM
  customers;
  
--B) Querying data from multiple columns
--To query data from multiple columns, you specify a list of comma-separated column names.

--The following example shows how to query data from the customer_id, name, and credit_limit columns of the customer table.

SELECT
    customer_id,
    name,
    credit_limit
FROM
    customers;
	
--C) Querying data from all columns of a table
--The following example retrieves all rows from all columns of the customers table:

SELECT * FROM customers;

--***************************************
--Section 2. Sorting data
--***************************************

--The following statement retrieves customer name, address, and credit limit from the customers table:

SELECT
    name,
    address,
    credit_limit
FROM
    customers;
    
--A) Sorting rows by a column example
--To sort the customer data by names alphabetically in ascending order, you use the following statement:

SELECT
    name,
    address,
    credit_limit
FROM
    customers
ORDER BY
    name ASC;
    
--To sort customer by name alphabetically in descending order, you explicitly use DESC after the column name in the ORDER BY clause as follows:
SELECT
    name,
    address,
    credit_limit
FROM
    customers
ORDER BY
    name DESC;
    
--B) Sorting rows by multiple columns example
--To sort multiple columns, you separate each column in the ORDER BY clause by a comma.

--See the following contacts table in the sample database.
SELECT
	first_name,
	last_name
FROM
	contacts
ORDER BY
	first_name,
	last_name DESC;
    
--C) Sort rows by column’s positions example
--You don’t need to specify the column names for sorting the data. If you prefer, you can use the positions of the column in the ORDER BY clause.

--See the following statement:
SELECT
    name,
    credit_limit
FROM
    customers
ORDER BY
    2 DESC,
    1;
    
--C) Sorting rows with NULL values examples
--See the following locations table in the sample database:
SELECT
    country_id,
    city,
    state
FROM
    locations
ORDER BY
    city,
    state;

--The state column has NULL values, meaning that the state data is not relevant to some cities e.g., Beijing, Hiroshima, and London.

--When sorting mixed NULL with non-NULL values, Oracle allows you to specify which one should appear first.

--For example, the following statement sorts the locations by state in ascending order and places NULL values first.

SELECT
    country_id,
    city,
    state
FROM
    locations
ORDER BY
    state ASC NULLS FIRST;
    
--To place NULL values after the non-NULL values, you use NULLS LAST as shown in the following statement:
SELECT 
   country_id, 
   city, 
   state 
FROM 
   locations 
ORDER BY 
   state 
ASC NULLS LAST;

--D) Sorting rows by the result of a function or expression
--The ORDER BY clause allows you to apply a function e.g., string function and math function on a column and sorts the data by the result of the function.

--For example, the following statement uses the UPPER() function in the ORDER BY clause to sort the customer names case-insensitively:
SELECT
	customer_id,
	name
FROM
	customers
ORDER BY
	UPPER( name );
    
--E) Sorting by date example
--See the following orders table from the sample database:    
SELECT 
   order_id, 
   customer_id, 
   status, 
   order_date
FROM 
   orders
ORDER BY 
   order_date DESC;

--***************************************
--Section 3. Filtering data
--***************************************
--A) Oracle SELECT DISTINCT one column example
--See the contacts table in the sample database:
SELECT
  first_name
FROM
  contacts
ORDER BY
  first_name; 
  
--To get unique contact first names, you add the DISTINCT keyword to the above SELECT statement as follows:
SELECT DISTINCT
  first_name
FROM
  contacts
ORDER BY
  first_name;

--B) Oracle SELECT DISTINCT multiple columns example
--See the following order_items table:

--The following statement selects distinct product id and quantity from the order_items table:
SELECT
    DISTINCT product_id,
    quantity
FROM
    ORDER_ITEMS
ORDER BY
    product_id;
    
--C) Oracle SELECT DISTINCT and NULL

--The DISTINCT treats NULL values to be duplicates of each other. If you use the SELECT DISTINCT statement to query data from a column that has many NULL values, the result set will include only one NULL value.

--See the locations table in the sample database.
--The following statement retrieves data from the state column, which has many NULL values:

SELECT
    DISTINCT state
FROM
    locations
ORDER BY
    state NULLS FIRST;
    
--Oracle WHERE examples
--See the following products table in the sample database:    

--A) Selecting rows by using a simple equality operator
--The following example returns only products whose names are 'Kingston':
SELECT
    product_name,
    description,
    list_price,
    category_id
FROM
    products
WHERE
    product_name = 'Kingston';
    
--In this example, Oracle evaluates the clauses in the following order:FROM WHERE and SELECT

--First, the FROM clause specified the table for querying data.
--Second, the WHERE clause filtered rows based on the condition e.g., product_name = 'Kingston').
--Third, the SELECT clause chose the columns that should be returned.

--For example, to get products whose list prices are greater than 500, you use the following statement:
SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price > 500;
    
--C) Select rows that meet some conditions
--To combine conditions you can use the AND, OR and NOT logical operators.

--For example, to get all motherboards that belong to the category id 1 and have list prices greater than 500, you use the following statement:
SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price > 500
    AND category_id = 4;

--D) Selecting rows that have a value between two values
--To find rows that have a value between two values, you use the BETWEEN operator in the WHERE clause.

--For example, to get the products whose list prices are between 650 and 680, you use the following statement:

SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price BETWEEN 650 AND 680
ORDER BY
    list_price;
    
--E) Selecting rows that are in a list of values
--To query rows that are in a list of values, you use the IN operator as follows:
SELECT
    product_name,
    category_id
FROM
    products
WHERE
    category_id IN(1, 4)
ORDER BY
    product_name;

--F) Selecting rows which contain value as a part of a string
--The following statement retrieves product whose name starts with Asus:

SELECT
	product_name,
	list_price
FROM
	products
WHERE
	product_name LIKE 'Asus%'
ORDER BY
	list_price;
    
--Oracle AND operator examples
--See the following orders table in the sample database:

--A) Oracle AND to combine two Boolean expressions example
--The following example finds orders of the customer 2 with the pending status:
SELECT
	order_id,
	customer_id,
	status,
	order_date
FROM
	orders
WHERE
	status = 'Pending'
	AND customer_id = 2
ORDER BY
	order_date;


--Oracle OR operator examples
--We will use the orders table in the sample database for the demonstration.

--Using Oracle OR operator to combine two Boolean expressions example
--The following example finds orders whose status is pending or canceled:
SELECT
    order_id,
    customer_id,
    status,
    order_date
FROM
    orders
WHERE
    status = 'Pending'
    OR status = 'Canceled'
ORDER BY
    order_date DESC;

--B) Using Oracle OR operator to combine more than two Boolean expressions example
--We often use the OR operators to combine more than two Boolean expressions. 
--For example, the following statement retrieves the orders which are in charge of one of the following the salesman id 60, 61 or 62:

SELECT
    order_id,
    customer_id,
    status,
    salesman_id,
    order_date
FROM
    orders
WHERE
    salesman_id = 60
    OR salesman_id = 61
    OR salesman_id = 62
ORDER BY
    order_date DESC;

--Instead of using multiple OR operators, you can use the IN operator as shown in the following example:
SELECT
    order_id,
    customer_id,
    status,
    salesman_id,
    order_date
FROM
    orders
WHERE
    salesman_id IN(
        60,
        61,
        62
    )
ORDER BY
    order_date DESC;
    
--C) Using Oracle OR operator to combine with AND operator example
--You can combine the OR operator with other logical operators such as AND and NOT to form a condition. For example, 
--the following query returns the orders that belong to the customer id 44 and have canceled or pending status.

SELECT
    order_id,
    customer_id,
    status,
    salesman_id,
    order_date
FROM
    orders
WHERE
    (
        status = 'Canceled'
        OR status = 'Pending'
    )
    AND customer_id = 44
ORDER BY
    order_date;

--A) Oracle IN examples
--The following statement finds all orders which are in charge of the salesman id 54, 55, and 56:
SELECT
    order_id,
    customer_id,
    status,
    salesman_id
FROM
    orders
WHERE
    salesman_id IN (
        54,
        55,
        56
    )
ORDER BY
    order_id;

--B) Oracle NOT IN example
--The example shows how to find orders whose statuses are not Shipped and Canceled:
SELECT
    order_id,
    customer_id,
    status,
    salesman_id
FROM
    orders
WHERE
    status NOT IN(
        'Shipped',
        'Canceled'
    )
ORDER BY
    order_id;
    
--A) Oracle BETWEEN numeric values example
SELECT
    product_name,
    standard_cost
FROM
    products
WHERE
    standard_cost BETWEEN 500 AND 600
ORDER BY
    standard_cost;

--To query products whose standard costs are not between 500 and 600, you add the NOT operator to the above query as follows:
SELECT
    product_name,
    standard_cost
FROM
    products
WHERE
    standard_cost NOT BETWEEN 500 AND 600
ORDER BY
    product_name;

--B) Oracle BETWEEN dates example
--Let’s use the orders table in the sample database for the demonstration:
SELECT
    order_id,
    customer_id,
    status,
    order_date
FROM
    orders
WHERE
    order_date BETWEEN DATE '2016-12-01' AND DATE '2016-12-31'
ORDER BY
    order_date;
    
--Oracle LIKE examples
--Let’s take some examples of using the Oracle LIKE operator to see how it works.
--A) % wildcard character examples
--The following example uses the % wildcard to find the phones of contacts whose last names start with 'St':
SELECT
    first_name,
    last_name,
    phone
FROM
    contacts
WHERE
    last_name LIKE 'St%'
ORDER BY
    last_name;
    
--To find the phone numbers of contacts whose last names end with the string 'er', you use the following statement:
SELECT
    first_name,
    last_name,
    phone
FROM
    contacts
WHERE
    last_name LIKE '%er'
ORDER BY
    last_name;
    
--The following example uses the NOT LIKE operator to find contacts whose phone numbers do not start with '+1':
SELECT
  first_name, last_name, phone
FROM
  contacts
WHERE
  phone NOT LIKE '+1%'
ORDER BY
  first_name;
  
--B) _ wildcard character examples
--The following example finds the phone numbers and emails of contacts whose first names have the following pattern 'Je_i':
SELECT
    first_name,
    last_name,
    email,
    phone
FROM
    contacts
WHERE
    first_name LIKE 'Je_i'
ORDER BY 
    first_name;

--C) Mixed wildcard characters example
SELECT
    first_name,
    last_name,
    email,
    phone
FROM
    contacts
WHERE
    first_name LIKE 'Je_%';

--Introduction to the Oracle IS NULL operator
--The salesman_id column stores the salesman id of the salesman who is in charge of the sales order.

--The following SELECT statement attempts to return all sales orders which do not have a responsible salesman:
SELECT * FROM orders 
WHERE salesman_id = NULL
ORDER BY order_date DESC;

--It returns an empty row.

--The following query returns all sales orders that do not have a responsible salesman:
SELECT * FROM orders 
WHERE salesman_id IS NULL
ORDER BY order_date DESC;

--Oracle IS NOT NULL operator
SELECT * FROM orders
WHERE salesman_id IS NOT NULL
ORDER BY order_date DESC;

--***************************************
--Section 4. Joining tables
--***************************************
--Setting up sample tables
--We will create two new tables with the same structure for the demonstration:

CREATE TABLE palette_a (
    id INT PRIMARY KEY,
    color VARCHAR2 (100) NOT NULL
);

CREATE TABLE palette_b (
    id INT PRIMARY KEY,
    color VARCHAR2 (100) NOT NULL
);

INSERT INTO palette_a (id, color)
VALUES (1, 'Red');

INSERT INTO palette_a (id, color)
VALUES (2, 'Green');

INSERT INTO palette_a (id, color)
VALUES (3, 'Blue');

INSERT INTO palette_a (id, color)
VALUES (4, 'Purple');

-- insert data for the palette_b
INSERT INTO palette_b (id, color)
VALUES (1, 'Green');

INSERT INTO palette_b (id, color)
VALUES (2, 'Red');

INSERT INTO palette_b (id, color)
VALUES (3, 'Cyan');

INSERT INTO palette_b (id, color)
VALUES (4, 'Brown');

--Oracle inner join
--The following statement joins the left table to the right table using the values in the color column:
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
INNER JOIN palette_b b ON a.color = b.color;

--Oracle left join
--The following statement joins the left table with the right table using a left join (or a left outer join):
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
LEFT JOIN palette_b b ON a.color = b.color;


--Oracle right join
--The following example use right join to join the left table to the right table:
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
RIGHT JOIN palette_b b ON a.color = b.color;


--Oracle full outer join
SELECT
    a.id id_a,
    a.color color_a,
    b.id id_b,
    b.color color_b
FROM
    palette_a a
FULL OUTER JOIN palette_b b ON a.color = b.color;

--Oracle Cross Join example
--See the following inventories table in the sample database.

SELECT
    product_id,
    warehouse_id,
    ROUND( dbms_random.value( 10, 100 )) quantity
FROM
    products 
CROSS JOIN warehouses;

--A) Using Oracle self join to query hierarchical data example
--See the following employees table in the sample database.

SELECT
    (e.first_name || '  ' || e.last_name) employee,
    (m.first_name || '  ' || m.last_name) manager,
    e.job_title
FROM
    employees e
LEFT JOIN employees m ON
    m.employee_id = e.manager_id
ORDER BY
    manager;
    
--The following query uses a INNER JOIN clause to retrieve data from the orders and order_items tables:
SELECT
    *
FROM
    orders
INNER JOIN order_items ON
    order_items.order_id = orders.order_id
ORDER BY
    order_date DESC;
    
--Oracle INNER JOIN with USING clause
SELECT
  *
FROM
  orders
INNER JOIN order_items USING( order_id )
ORDER BY
  order_date DESC;


--The following statement retrieves all orders and employees data from both orders and employees tables:
SELECT
  order_id, 
  status, 
  first_name, 
  last_name
FROM
  orders
LEFT JOIN employees ON employee_id = salesman_id
ORDER BY
  order_date DESC;

--The following statement demonstrates how to use the LEFT JOIN with the USING statement:
SELECT
    name,
    order_id,
    status,
    order_date
FROM
    customers
LEFT JOIN orders
        USING(customer_id)
ORDER BY
    name;  
    
--Conditions in ON vs. WHERE clause
--The following statement gets the order and salesman data of the order 58.
SELECT
    order_id,
    status,
    employee_id,
    last_name
FROM
    orders
LEFT JOIN employees ON
    employee_id = salesman_id
WHERE
    order_id = 58;

--Now if you move the condition from the WHERE clause to the ON clause of the LEFT JOIN:
SELECT
    order_id,
    status,
    employee_id,
    last_name
FROM
    orders
LEFT JOIN employees ON
    employee_id = salesman_id
    AND order_id = 58;

--Right Outer Join
SELECT
    first_name,
    last_name,
    order_id,
    status
FROM
    orders
RIGHT JOIN employees ON
    employee_id = salesman_id
WHERE
    job_title = 'Sales Representative'
ORDER BY
    first_name,
    last_name;

--The following statement demonstrates how to use the RIGHT OUTER JOIN with the USING clause:
SELECT
    name,
    order_id,
    status
FROM
    orders
RIGHT JOIN customers
        USING(customer_id)
ORDER BY
    name;
    
--Oracle FULL OUTER JOIN examples
CREATE TABLE projects(
    project_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    project_name VARCHAR2(100) NOT NULL
);

CREATE TABLE members(
    member_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_name VARCHAR2(100) NOT NULL,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO projects(project_name) 
VALUES('ERP');

INSERT INTO projects(project_name) 
VALUES('Sales CRM');

INSERT INTO members(member_name, project_id)
VALUES('John Doe',1);

INSERT INTO members(member_name, project_id)
VALUES ('Jane Doe',1);

INSERT INTO members(member_name, project_id)
VALUES ('Jack Daniel',null);


--Third, use the full outer join to query data from members and projects tables:
SELECT 
    member_name, 
    project_name
FROM 
    members m
FULL OUTER JOIN projects p ON p.project_id = m.project_id
ORDER BY 
    member_name;   

--Each row in the inventories table requires data for product_id, warehouse_id, and quantity.

--To generate the test data for inserting into the inventories table, you can use the CROSS JOIN clause as shown in the following statement:
SELECT
    product_id,
    warehouse_id,
    ROUND( dbms_random.value( 10, 100 )) quantity
FROM
    products 
CROSS JOIN warehouses;

--To retrieve the employee and manager data from the employees table, you use a self join as shown in the following statement:
SELECT
    (e.first_name || '  ' || e.last_name) employee,
    (m.first_name || '  ' || m.last_name) manager,
    e.job_title
FROM
    employees e
LEFT JOIN employees m ON
    m.employee_id = e.manager_id
ORDER BY
    manager;

--***************************************
--Section 5. Grouping data
--***************************************
--Oracle GROUP BY examples
--We will use the following orders and order_items in the sample database for the demonstration:

--A) Oracle GROUP BY basic example
--The following statement uses the GROUP BY clause to find unique order statuses from the orders table:
SELECT
    status
FROM
    orders
GROUP BY
    status;
    
--B) Oracle GROUP BY with an aggregate function example
--The following statement returns the number of orders by customers:

SELECT
    customer_id,
    COUNT( order_id )
FROM
    orders
GROUP BY
    customer_id
ORDER BY
    customer_id;

--C) Oracle GROUP BY with an expression example
--The following example groups the orders by year and returns the number of orders per year.

SELECT
    EXTRACT(YEAR FROM order_date) YEAR,
    COUNT( order_id )
FROM
    orders
GROUP BY
    EXTRACT(YEAR FROM order_date)
ORDER BY
    YEAR;

--D) Oracle GROUP BY with WHERE clause example
--This example uses the GROUP BY clause with a WHERE clause to return the number of shipped orders for every customer:
SELECT 
   name, 
   COUNT( order_id ) 
FROM orders 
   INNER JOIN customers USING(customer_id) 
WHERE 
   status = 'Shipped'
GROUP BY 
   name 
ORDER BY 
   name;
   
--Oracle HAVING clause example
--We will use the order_items in the sample database for the demonstration.
--The following statement uses the GROUP BY clause to retrieve the orders and their values from the order_items table:
SELECT
    order_id,
    SUM( unit_price * quantity ) order_value
FROM
    order_items
GROUP BY
    order_id
ORDER BY
    order_value DESC;

--To find the orders whose values are greater than 1 million, you add a HAVING clause as follows:
SELECT
    order_id,
    SUM( unit_price * quantity ) order_value
FROM
    order_items
GROUP BY
    order_id
HAVING
    SUM( unit_price * quantity ) > 1000000
ORDER BY
    order_value DESC;


--B) Oracle HAVING with complex condition example
--You can use a complex filter condition in the HAVING clause to filter groups.

--For example, the following statement finds orders whose values are greater than 500,000 and the number of products in each order is between 10 and 12:

SELECT
    order_id,
    COUNT( item_id ) item_count,
    SUM( unit_price * quantity ) total
FROM
    order_items
GROUP BY
    order_id
HAVING
    SUM( unit_price * quantity ) > 500000 AND
    COUNT( item_id ) BETWEEN 10 AND 12
ORDER BY
    total DESC,
    item_count DESC;

--***************************************
--Section 6. Subquery
--***************************************
--Introduction to the Oracle subquery
--The following query uses the MAX() function to return the highest list price from the products table:
SELECT
    MAX( list_price )
FROM
    products;


--To select the detailed information of the most expensive products, you use the list price above (8867.99) in the following query:
SELECT
    product_id,
    product_name,
    list_price
FROM
    products
WHERE
    list_price = 8867.99;
    
--As you can see, we need to execute two queries separately to get the most expensive product information. By using a subquery, we can nest the first query inside the second one as shown in the following statement:
SELECT
    product_id,
    product_name,
    list_price
FROM
    products
WHERE
    list_price = (
        SELECT
            MAX( list_price )
        FROM
            products
    );

--Advantages of Oracle subqueries
--These are the main advantages of subqueries:

--Provide an alternative way to query data that would require complex joins and unions.
--Make the complex queries more readable.
--Allow a complex query to be structured in a way that it is possible to isolate each part.

--Oracle Subquery examplesOracle subquery in the FROM clause example
--A subquery in the FROM clause of a SELECT statement is called an inline view which has the following syntax:
SELECT
    order_id,
    order_value
FROM
    (
        SELECT
            order_id,
            SUM( quantity * unit_price ) order_value
        FROM
            order_items
        GROUP BY
            order_id
        ORDER BY
            order_value DESC
    )
FETCH FIRST 10 ROWS ONLY; 

--Introduction to the Oracle correlated subquery
--See the following products table in the sample database:

--The following query returns the cheapest products from the products table using a subquery in the WHERE clause.

SELECT
    product_id,
    product_name,
    list_price
FROM
    products
WHERE
    list_price =(
        SELECT
            MIN( list_price )
        FROM
            products
    );


--A) Oracle correlated subquery in the WHERE clause example
--The following query finds all products whose list price is above average for their category.
SELECT
    product_id,
    product_name,
    list_price
FROM
    products p
WHERE
    list_price > (
        SELECT
            AVG( list_price )
        FROM
            products
        WHERE
            category_id = p.category_id
    );

--Oracle EXISTS examples
--The following example uses the EXISTS operator to find all customers who have the order.
SELECT
    name
FROM
    customers c
WHERE
    EXISTS (
        SELECT
            1
        FROM
            orders
        WHERE	
            customer_id = c.customer_id
    )
ORDER BY
    name;

--Oracle NOT EXISTS examples
--The following statement finds all customers who have no order:
SELECT
    name
FROM
    customers
WHERE
    NOT EXISTS (
        SELECT
            NULL
        FROM
            orders
        WHERE
            orders.customer_id = customers.customer_id
    )
ORDER BY
    name;


--Oracle ANY
SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price > ANY(
        SELECT
            list_price
        FROM
            products
        WHERE
            category_id = 1
    )
ORDER BY
    product_name;
    
--Because the query uses a subquery with the ANY operator, Oracle performed a single transformation as shown below:
SELECT
    product_name,
    list_price
FROM
    products p1
WHERE
    EXISTS(
        SELECT
            list_price
        FROM
            products p2
        WHERE
            category_id = 1
            AND p1.list_price > p2.list_price
    )
ORDER BY
    product_name;
    
--1) col > ALL (list)
--The expression evaluates to true if the col is greater than the biggest value in the list.

--For example, the following query finds all products whose list prices are greater than the highest price of the average price list:

SELECT
    product_name,
    list_price
FROM
    products
WHERE
    list_price > ALL(
        SELECT
            AVG( list_price )
        FROM
            products
        GROUP BY
            category_id
    )
ORDER BY
    list_price ASC;
    
--***************************************
--Section 7. Set Operators
--***************************************

--Oracle UNION examples
--See the following employees and contacts tables in the sample database.


--A) Oracle UNION example
--Suppose, you have to send out emails to the email addresses from both  employees and contacts tables. 
--To accomplish this, first, you need to compose a list of email addresses of employees and contacts. 
--And then send out the emails to the list.

--The following statement uses the UNION operator to build a list of contacts from the employees and contacts tables:
SELECT
    first_name,
    last_name,
    email,
    'contact'
FROM
    contacts
UNION SELECT
    first_name,
    last_name,
    email,
    'employee'
FROM
    employees;
    
--B) Oracle UNION and ORDER BY example
--To sort the result set returned by the UNION operator, you add an ORDER BY clause to the last SELECT statement as shown below:

SELECT
    first_name || ' ' || last_name name,
    email,
    'contact'
FROM
    contacts
UNION SELECT
    first_name || ' ' || last_name name,
    email,
    'employee'
FROM
    employees
ORDER BY
    name DESC;

--C) Oracle UNION ALL example
--The following statement returns the unique last names of employees and contacts:

SELECT
    last_name
FROM
    employees
UNION SELECT
    last_name
FROM
    contacts
ORDER BY
    last_name;

--The query returned 357 unique last names.
SELECT
    last_name
FROM
    employees
UNION ALL SELECT
    last_name
FROM
    contacts
ORDER BY
    last_name;
    
--The query returns 426 rows. In addition, some rows are duplicate e.g., Atkinson, Barnett. This is because the UNION ALL operator does not remove duplicate rows.

--Oracle INTERSECT example
--See the following contacts and employees tables in the sample database.
--The following statement uses the INTERSECT operator to get the last names used by people in both contacts and employees tables:
SELECT
    last_name
FROM
    contacts
INTERSECT 
SELECT
    last_name
FROM
    employees
ORDER BY
    last_name;

--Oracle MINUS examples
--See the following contacts and employees tables in the sample database:

--The following statement returns distinct last names from the query to the left of the MINUS operator which are not also found in the right query.

SELECT
    last_name
FROM
    contacts
MINUS
SELECT
    last_name
FROM
    employees
ORDER BY
    last_name;

--See the following products and inventories tables:
--The following statement returns a list of product id from the products table, but do not exist in the inventories table:
SELECT
  product_id
FROM
  products
MINUS
SELECT
  product_id
FROM
  inventories;

--***************************************
--Section 8. Modifying data
--***************************************
drop table discounts;
--Oracle INSERT statement examples
--Let’s create a new table named discounts for inserting data:
CREATE TABLE discounts (
    discount_id NUMBER(5),
    discount_name VARCHAR2(255) NOT NULL,
    amount NUMBER(3,1) NOT NULL,
    start_date DATE NOT NULL,
    expired_date DATE NOT NULL
);

--The following statement inserts a new row into the discounts table:
INSERT INTO discounts(discount_id ,discount_name, amount, start_date, expired_date)
VALUES(1,'Summer Promotion', 9.5, DATE '2017-05-01', DATE '2017-08-31');

--The following statement retrieves data from the discounts table to verify the insertion:
SELECT
    *
FROM
    discounts;
    
--Sometimes, you want to select data from a table and insert it into another table. To do it, you use the Oracle INSERT INTO SELECT statement as follows:
--The Oracle INSERT INTO SELECTstatement requires the data type of the source and target tables match.

--If you want to copy all rows from the source table to the target table, you remove the WHERE clause.
--Otherwise, you can specify which rows from the source table should be copied to the target table.

CREATE TABLE discounts (
    discount_id NUMBER(4),
    discount_name VARCHAR2(50),
    amount NUMBER(4),
    start_date DATE,
    expired_date DATE    
);

INSERT INTO discounts values(1,'Summer Promotion',10,DATE '2021-10-10' , DATE '2021-11-10');
INSERT INTO discounts values(2,'Diwali Promotion',20,DATE '2021-11-10' , DATE '2021-11-30');
INSERT INTO discounts values(3,'X-Mas Promotion',15,DATE '2021-12-10' , DATE '2021-12-24');
INSERT INTO discounts values(4,'Holi Promotion',10,DATE '2021-04-10' , DATE '2021-05-10');

CREATE TABLE promotion_2021 (
    discount_id NUMBER(4),
    discount_name VARCHAR2(50),
    amount NUMBER(4),
    start_date DATE,
    expired_date DATE    
);

SELECT 
    *
FROM
    promotion_2021;
    
INSERT INTO promotion_2021 
select * from discounts;

DROP TABLE promotion_2021;

CREATE TABLE promotion_2021
AS
    SELECT
        *
    FROM
        discounts;
        
SELECT 
    *
FROM
    promotion_2021;
    
-----------------------------

--The following example demonstrates how to insert multiple rows into a table.

--First, create a new table named fruits:

CREATE TABLE fruits (
    fruit_name VARCHAR2(100) PRIMARY KEY,
    color VARCHAR2(100) NOT NULL
);

--Second, use the Oracle INSERT ALL statement to insert rows into the fruits table:
INSERT ALL 
    INTO fruits(fruit_name, color)
    VALUES ('Apple','Red') 

    INTO fruits(fruit_name, color)
    VALUES ('Orange','Orange') 

    INTO fruits(fruit_name, color)
    VALUES ('Banana','Yellow')
SELECT 1 FROM dual;

--Third, query data from the fruits table to verify the insertion:
SELECT 
    *
FROM 
    fruits;
    
--Update
CREATE TABLE parts (
  part_id NUMBER,
  part_name VARCHAR(50) NOT NULL,
  lead_time NUMBER(2,0) NOT NULL,
  cost NUMBER(9,2) NOT NULL,
  status NUMBER(1,0) NOT NULL
);

INSERT INTO parts VALUES (1,'sed dictum',5,134,0);
INSERT INTO parts VALUES (2,'tristique neque',3,62,1);
INSERT INTO parts VALUES (3,'dolor quam,',16,82,1);
INSERT INTO parts VALUES (4,'nec, diam.',41,10,1);
INSERT INTO parts VALUES (5,'vitae erat',22,116,0);
INSERT INTO parts VALUES (6,'parturient montes,',32,169,1);
INSERT INTO parts VALUES (7,'metus. In',45,88,1);
INSERT INTO parts VALUES (8,'at, velit.',31,182,0);
INSERT INTO parts VALUES (9,'nonummy ultricies',7,146,0);
INSERT INTO parts VALUES (10,'a, dui.',38,116,0);
INSERT INTO parts VALUES (11,'arcu et',37,72,1);
INSERT INTO parts VALUES (12,'sapien. Cras',40,197,1);
INSERT INTO parts VALUES (13,'et malesuada',24,46,0);
INSERT INTO parts VALUES (14,'mauris id',4,153,1);
INSERT INTO parts VALUES (15,'eleifend egestas.',2,146,0);
INSERT INTO parts VALUES (16,'cursus. Nunc',9,194,1);
INSERT INTO parts VALUES (17,'vivamus sit',37,93,0);
INSERT INTO parts VALUES (18,'ac orci.',35,134,0);
INSERT INTO parts VALUES (19,'arcu. Aliquam',36,154,0);
INSERT INTO parts VALUES (20,'at auctor',32,56,1);
INSERT INTO parts VALUES (21,'purus, accumsan',33,12,1);

SELECT 
    *
FROM 
    parts;
    
--Update one column of a single row
--Change the cost of part with partid 1

UPDATE
    parts
SET
    cost = 130
WHERE
    part_id = 1;
    
---------------------------    
SELECT 
    *
FROM 
    parts
WHERE
    part_id = 5;
    
--Update multiple columns of a single row
UPDATE
    parts
SET
    lead_time = 30,
    cost = 150,
    status = 1
WHERE
    part_id = 5;
    
-- Update multiple rows 
--increase the costs of all parts by 5%
UPDATE
    parts
SET
    cost = cost * 1.05;
    
    
SELECT 
    *
FROM 
    parts;    

--Oracle DELETE examples
--Delete
--Delete one row from table 
DELETE
FROM
    parts
WHERE
    part_id = 5;

--Delete multiple rows from table     
DELETE
FROM
    parts
WHERE
    status = 0;  

--Delete all rows from table     
DELETE
FROM
    parts;
    
--Oracle introduced the TRUNCATE TABLE statement that allows you to delete all rows from a big table.
TRUNCATE TABLE parts;

--***************************************
--Section 9. Data definition
--***************************************
--The ALTER TABLE statement allows you to:

--Add one or more columns
--Modify column definition
--Drop one or more columns
--Rename columns
--Rename table

drop table persons;
CREATE TABLE persons (
    person_id NUMBER(4),
    first_name VARCHAR2(20),
    last_name varchar2(20)
);


SELECT 
    *
FROM
    persons;

--Oracle ALTER TABLE ADD column examples

--For example, the following statement adds a new column named birthdate to the persons table:
ALTER TABLE persons 
ADD birthdate DATE NOT NULL;

--If you view the persons table, you will see that the birthdate column is appended at the end of the column list:
DESC persons; 

--To add multiple columns to a table at the same time, you place the new columns inside the parenthesis as follows:
ALTER TABLE persons 
ADD (
    phone VARCHAR(20),
    email VARCHAR(100)
);

DESC persons; 


--Oracle ALTER TABLE MODIFY column examples
--To modify the attributes of a column, you use the following syntax:

--For example, the following statement changes the birthdate column to a null-able column:
ALTER TABLE persons MODIFY birthdate DATE NULL;
DESC persons;


--modify multiple columns, you use the following syntax:
--the following statement changes the phone and email column to NOT NULLcolumns and extends the length of the email column to 255 characters:
ALTER TABLE persons MODIFY(
    phone VARCHAR2(20) NOT NULL,
    email VARCHAR2(255) NOT NULL
);

--Oracle ALTER TABLE DROP COLUMN example
--To remove an existing column from a table, you use the following syntax:
ALTER TABLE persons
DROP
  COLUMN birthdate;

DESC persons;

--To drop multiple columns at the same time, you use the syntax below:
--For example, the following statement removes the phone and email columns from the persons table:
ALTER TABLE persons
DROP
  ( email, phone );
  

--Oracle ALTER TABLE RENAME column example
--For example, the following statement renames the first_name column to forename column:
ALTER TABLE persons 
RENAME COLUMN first_name TO forename;

--Oracle ALTER TABLE RENAME table example
--For example, the statement below renames the persons table to people table:
ALTER TABLE persons RENAME TO people;

--Oracle virtual column examples
--Let’s take some examples of using virtual columns.

--1) Creating a table with a virtual column example
--First, create a table named parts which has a virtual column:
CREATE TABLE parts(
    part_id INT,
    part_name VARCHAR2(50) NOT NULL,
    capacity INT NOT NULL,
    cost DEC(15,2) NOT NULL,
    list_price DEC(15,2) NOT NULL,
    gross_margin AS ((list_price - cost) / cost),
    PRIMARY KEY(part_id)
);

--Second, insert some rows into the parts table:
INSERT INTO parts(part_id ,part_name, capacity, cost, list_price)
VALUES(1,'G.SKILL TridentZ RGB Series 16GB (2 x 8GB)', 16, 95,105);

INSERT INTO parts(part_id ,part_name, capacity, cost, list_price)
VALUES(2,'G.SKILL TridentZ RGB Series 32GB (4x8GB)', 32, 205,220);

INSERT INTO parts(part_id ,part_name, capacity, cost, list_price)
VALUES(3,'G.SKILL TridentZ RGB Series 16GB (1 x 8GB)', 8, 50,70);

--Third, query data from the parts table
SELECT * FROM parts;


--***************************************
--Section 10. Constraints
--***************************************

--Introduction to the primary key
--A primary key is a column of a combination of columns in a table that uniquely identifies a row in the table.

--The following are rules that make a column a primary key:

--A primary key column cannot contain a NULL value or an empty string.
--A primary key value must be unique within the entire table.
--A primary key value should not be changed over time.
--According to these rules, the following are the recommendations for the primary keys:

--First, the primary key should be meaningless. Sometimes, you may want use meaningful data, which considers being unique,
--for the primary keys e.g., social security number (SSN), vehicle identification number (VIN), email, and phone number. 
--However, you don’t know when the email or phone number changes or is reused by another person. In such cases, it will create many data problems.
--In the database world, the artificial keys are known as surrogate keys which are as opposed to natural primary keys.
--Second, the primary keys should be compact. The primary keys typically are numeric because Oracle typically processes numbers faster than any other data types.

--Oracle PRIMARY KEY constraint examples
--Typically, you create a primary key for a table when you create that table. 
--In addition, you can add a primary key to a table after the fact by using the ALTER TABLE statement.

--Creating a primary key that consists of one column
--The following CREATE TABLE statement creates the purchase_orderstable:

CREATE TABLE purchase_orders (
    po_nr NUMBER PRIMARY KEY,
    vendor_id NUMBER NOT NULL,
    po_status NUMBER(1,0) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL 
);

DROP TABLE purchase_orders;

CREATE TABLE purchase_orders (
    po_nr NUMBER,
    vendor_id NUMBER NOT NULL,
    po_status NUMBER(1,0) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    CONSTRAINT pk_purchase_orders PRIMARY KEY(po_nr)
);


--Creating a primary key that consists of multiple columns
CREATE TABLE purchase_order_items (
    po_nr NUMBER NOT NULL,
    item_nr NUMBER NOT NULL,
    product_id NUMBER NOT NULL,  
    quantity NUMBER NOT NULL,
    purchase_unit NUMBER NOT NULL,
    buy_price NUMBER (9,2) NOT NULL,
    delivery_date DATE,
    PRIMARY KEY (po_nr, item_nr)
);

--Adding a primary key to a table
--Sometimes, you may want to add a primary key constraint to an existing table. 
--To do it, you use the ALTER TABLE statement as follows:

--The following example creates the vendors table first and then adds a primary key constraint to it:
CREATE TABLE vendors (
    vendor_id NUMBER,
    vendor_name VARCHAR2(255) NOT NULL,
    address VARCHAR2(255) NOT NULL
);

ALTER TABLE vendors 
ADD CONSTRAINT pk_vendors PRIMARY KEY (vendor_id);


--Dropping an Oracle PRIMARY KEY constraint
--You will rarely drop a PRIMARY KEY constraint from a table. 
--If you have to do so, you use the following ALTER TABLE statement.

--For example, you can drop the primary key constraint of the vendors table as follows:

ALTER TABLE vendors
DROP CONSTRAINT pk_vendors;


--It is possible to use the following statement to drop the primary key of a table:
ALTER TABLE vendors
DROP PRIMARY KEY;

--Enable / Disable an Oracle PRIMARY KEY constraint
--To improve the performance when loading a large amount of data into a table or updating mass data, you can temporarily disable the PRIMARY KEY constraint.

--To disable a PRIMARY KEYconstraint of a table, you use the ALTER TABLE statement:
--For example, to disable the primary key constraint of the purchase_orders table, you use the following statement:
ALTER TABLE purchase_orders
DISABLE CONSTRAINT pk_purchase_orders;

--or

ALTER TABLE purchase_orders
DISABLE PRIMARY KEY;


--To enable a primary key constraint, you use the following ALTER TABLE statement:
--The following example enables the PRIMARY KEY constraint of the purchase_orders table:
ALTER TABLE purchase_orders
ENABLE CONSTRAINT pk_purchase_orders;

--or

ALTER TABLE purchase_orders
ENABLE PRIMARY KEY;

--Introduction to Oracle foreign key constraint
--A foreign key is all about the relationship. Let’s start with an example to clearly understand its concept.

--Suppose, we have two tables supplier_groups and suppliers:
CREATE TABLE supplier_groups(
    group_id NUMBER(5),
    group_name VARCHAR2(255) NOT NULL,
    PRIMARY KEY (group_id)  
);

INSERT INTO supplier_groups 
VALUES(1,'One-time Supplier');

INSERT INTO supplier_groups 
VALUES(2,'Third-party Supplier');

INSERT INTO supplier_groups 
VALUES(3,'Inter-co Supplier');

drop table suppliers;  
CREATE TABLE suppliers (
    supplier_id NUMBER(5),
    supplier_name VARCHAR2(255) NOT NULL,
    group_id NUMBER NOT NULL,
    PRIMARY KEY(supplier_id),
    FOREIGN KEY(group_id) REFERENCES supplier_groups(group_id)
);

INSERT INTO suppliers
VALUES(101 ,'Toshiba',1);

INSERT INTO suppliers
VALUES(102,'WD',4);

--Create a foreign key constraint
--use the ON DELETE clause to specify consequence when the rows in the parent table are deleted.

-- ON DELETE CASCADE: if a row in the parent is deleted, then all the rows in the child table that reference the removed row will be deleted.
-- ON DELETE SET NULL: if a row in the parent is deleted, 
-- then all the rows in the child table reference the removed row will be set to NULL for the foreign key columns.
-- Unlike the primary key constraint, a table may have more than one foreign key constraint.

--Add a foreign key constraint to a table
--If you want to add a foreign key constraint to an existing table, you use the ALTER TABLE statement as follows:

ALTER TABLE child_table 
ADD CONSTRAINT fk_name
FOREIGN KEY (col1,col2) REFERENCES parent_table(col1,col2);

--Drop a foreign key constraint
--To drop a foreign key constraint, you use the ALTER TABLE statement below:
ALTER TABLE child_table
DROP CONSTRAINT fk_name;


--Disable a foreign key constraint
--To temporarily disable a foreign constraint, you use the following ALTER TABLE statement:
ALTER TABLE child_table
DISABLE CONSTRAINT fk_name;

--Oracle unique constraint examples

--Let’s create a table named clients for the demonstration:
CREATE TABLE clients (
    client_id NUMBER(5),
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    company_name VARCHAR2(255) NOT NULL,
    email VARCHAR2(255) NOT NULL UNIQUE,
    phone VARCHAR(25)
);

--The email column has a unique constraint that ensures there will be no duplicate email.

--The following statement inserts a row into the clients table:
INSERT INTO clients(first_name,last_name, email, company_name, phone)
VALUES('Christene','Snider','christene.snider@abc.com', 'ABC Inc', '408-875-6075');

INSERT INTO clients(first_name,last_name, email, company_name, phone)
VALUES('Sherly','Snider','christene.snider@abc.com', 'ABC Inc', '408-875-6076');

--If you want to add a unique constraint for the company_nameand phone columns, you can use the following ALTER TABLE statement:
ALTER TABLE clients
ADD CONSTRAINT unique_company_phone UNIQUE(company_name, phone);

--As the result, the combination of values in the company_name and phone columns is unique among the rows in the clients table.

--The following statement attempts to insert a new client with the company and phone that already exist:
--Oracle issued the following error message:
INSERT INTO clients(first_name,last_name, email, company_name, phone)
VALUES('Sherly',    'Snider','sherly.snider@abc.com', 'ABC Inc', '408-875-6075');

--However, you can add the client who is in the company that already exists in the clients table but has a different phone:
INSERT INTO clients(first_name,last_name, email, company_name, phone)
VALUES('Sherly','Snider','sherly.snider@abc.com', 'ABC Inc', '408-875-6076');

--To disable the unique constraint UNIQUE_COMPANY_PHONE, you use the following statement:
ALTER TABLE clients
DISABLE CONSTRAINT unique_company_phone;

--And to enable it:
ALTER TABLE clients
ENABLE CONSTRAINT unique_company_phone;

--drop it permanently:
ALTER TABLE clients
DROP CONSTRAINT unique_company_phone;

--Creating Oracle Check constraint examples
--The following example creates the parts table whose buy prices are positive:

CREATE TABLE parts (
    part_id NUMBER(5),
    part_name VARCHAR2(255) NOT NULL,
    buy_price NUMBER(9,2) CHECK(buy_price > 0),
    PRIMARY KEY(part_id)
);

INSERT INTO parts(part_name, buy_price)
VALUES('HDD',0);

--To better analyzing the error message and to refer to the constraint later, you can give a check constraint an explicit name:
DROP TABLE parts;

CREATE TABLE parts (
    part_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
    part_name VARCHAR2(255) NOT NULL,
    buy_price NUMBER(9,2) CONSTRAINT check_positive_buy_price CHECK(buy_price > 0),
    PRIMARY KEY(part_id)
);

INSERT INTO parts(part_name, buy_price)
VALUES('Screen',-100);  

--Add Check constraint to a table
ALTER TABLE parts
ADD cost NUMBER(9,2);

--Suppose the cost must be positive and it is also greater or equal to the buy price. To enforce these rules, you add two check constraints to the parts table:
ALTER TABLE parts
ADD CONSTRAINT check_positive_cost CHECK (cost > 0);

--Drop checking constraint
ALTER TABLE parts
DROP CONSTRAINT check_positive_cost;

--Disable / Enable check constraint
--The following statements disable and enable a check constraint:
--For example, to temporarily disable the check_positive_buy_price constraint, you use the following statement:
ALTER TABLE table_name
DISABLE CONSTRAINT check_positive_buy_price;


--And to enable the check_positive_buy_price constraint:

ALTER TABLE table_name
ENABLE CONSTRAINT check_positive_buy_price;


--***************************************
--Section 11. Oracle Functions
--***************************************

--String Functions
--The following statement returns characters code value of charater A, B and C:
SELECT
  ASCII( 'A' ),
  ASCII( 'B' ),
  ASCII( 'C' )
FROM
  dual;
  
--The following statement returns characters of the ASCII code 65 and 97:
SELECT
  CHR( 83 ),
  CHR( 115 )
FROM
  dual;

--The following statement concatenates two strings 'Happy' and ' coding':
SELECT
    CONCAT('Happy',' coding')
FROM
    dual;

--The following statement uses the concatenation operator to construct the full name of employees from the first name, space, and the last name:
SELECT
  first_name  || ' '  || last_name
FROM
  employees;

--The following example uses the DUMP() function to display the type, length, and internal representation of the string 'Oracle DUMP':
SELECT 
    DUMP('Oracle DUMP') AS result
FROM 
    DUAL;
    
--This example uses the DUMP() function to shows the data type, length, and internal representation of the customer names from the customers table:
SELECT 
    name, 
    DUMP(name) result
FROM 
    customers
ORDER BY 
    name;

--The following statement uses the INITCAP() function to convert a string to proper case:
SELECT
  INITCAP( 'hi john' )
FROM
  DUAL;


--The following statement selects the first name and last name from the contacts table. In addition, it constructs the full name and converts them to the proper case using the INITCAP() function.
SELECT
  INITCAP( first_name || ' ' || last_name ) full_name
FROM
  contacts
ORDER BY
  full_name; 

--1) Search from the start of the string
SELECT
  INSTR( 'This is a playlist', 'is' ) substring_location
FROM
  dual;

--2) Search for the 2nd and 3nd occurrence of a substring
SELECT
  INSTR( 'This is a playlist', 'is', 1, 2 ) second_occurrence,
  INSTR( 'This is a playlist', 'is', 1, 3 ) third_occurrence
FROM
  dual;


--The following statement uses the LENGTH() function to calculate the number of characters of the string 'Oracle LENGTH' using a single-byte database character set:
SELECT 
  'Oracle LENGTH' string,
  LENGTH('Oracle LENGTH') Len
FROM 
  dual;


--The following statement sorts the employees by the lengths of their first names. It uses the LENGTH() function in the ORDER BY clause:
SELECT
  first_name,
  LENGTH(first_name)
FROM
  employees
ORDER BY   
  LENGTH(first_name) DESC;

--The following example converts the string 'LOWER Function' to lowercase:
SELECT
  LOWER( 'LOWER Function' )
FROM
  dual;

--We often use the LPAD() function to add leading zeros to format numeric strings. See the following statement:
SELECT
  LPAD( '123', 8, '0' ) RESULT
FROM
  dual;
  
SELECT
  RPAD( '123', 8, '0' ) RESULT
FROM
  dual;

--Substring
SELECT
  SUBSTR( 'Oracle Substring', 0, 6 ) SUBSTRING
FROM
  dual;


--Date Functions
--A) Add a number of months to a date
SELECT
  ADD_MONTHS( DATE '2016-02-29', 1 )
FROM
  dual;
  
--B) Add a negative number of months to a date
SELECT
  ADD_MONTHS( SYSDATE, -1 )
FROM
  dual;

--B) Return the current date and time in the session time zone
SELECT CURRENT_DATE FROM dual

--B) Return the current date and time with time zone in the session time zone
SELECT CURRENT_TIMESTAMP FROM dual

--B) Get the current database time zone 

  
--C) Get the last day of the last month
--The following statement returns the last day of the last month.
SELECT
  LAST_DAY( ADD_MONTHS(SYSDATE , - 1 ) )
FROM
  dual;

-- Convert a date which is in the character string to a DATE value.
TO_DATE( '01 Jan 2017', 'DD MON YYYY' )

--ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';

--To find out the session time zone, you use the SESSIONTIMEZONE function as follows:
SELECT
  SESSIONTIMEZONE
FROM
  DUAL;

SELECT
  CURRENT_DATE
FROM
  DUAL;

--A) Extracting fields from DATE values
SELECT
  EXTRACT( YEAR FROM TO_DATE( '31-Dec-1999 15:30:20 ',  'DD-Mon-YYYY HH24:MI:SS' ) ) YEAR
FROM
  DUAL;
  
--Extracting month from a date:
SELECT
  EXTRACT( MONTH FROM TO_DATE( '31-Dec-1999 15:30:20 ',  'DD-Mon-YYYY HH24:MI:SS' ) ) MONTH
FROM
  DUAL;
  
--Extracting day from a date:
SELECT
  EXTRACT( DAY FROM TO_DATE( '31-Dec-1999 15:30:20 ',  'DD-Mon-YYYY HH24:MI:SS' ) ) DAY
FROM
  DUAL;

--For example, to extract hour, minute, and second of a current system date, you use the following statement:
SELECT
  TO_CHAR( SYSDATE, 'HH24' ) hour, 
  TO_CHAR( SYSDATE, 'MI' ) minute,
  TO_CHAR( SYSDATE, 'SS' ) second
FROM
  DUAL;
  
--A) Get the difference in months of dates with the same day
SELECT
  MONTHS_BETWEEN( DATE '2017-07-01', DATE '2017-01-01' ) MONTH_DIFF
FROM
  DUAL;


--B) Both date arguments are the last days of the months
SELECT
  MONTHS_BETWEEN( DATE '2017-03-31', DATE '2017-02-28' ) MONTH_DIFF
FROM
  DUAL;

--C) Both date arguments are not the same day
SELECT
  MONTHS_BETWEEN( DATE '2017-07-31', DATE '2017-08-15' ) MONTH_DIFF
FROM
  DUAL;


--A) Get the next weekday later than a date
SELECT
  NEXT_DAY( SYSDATE, 'MONDAY' )
FROM
  dual;

--***************************************
--Oracle Views
--***************************************
--Oracle Views
--Oracle CREATE VIEW examples
--Let’s look at some examples of creating new views based on the tables in the sample database.

--A) Creating a view example
--See the following employees table from the sample database.
CREATE VIEW employee_yos AS
SELECT
    employee_id,
    first_name || ' ' || last_name full_name,
    FLOOR( months_between( CURRENT_DATE, hire_date )/ 12 ) yos
FROM
    employees;
    

--The following query returns employees whose years of service 

SELECT
    *
FROM
    employee_yos;

--B) Creating a read-only view example
--The following example creates a read-only view named customer_credits, which is based on the customers table. 
--The view contains three columns: customer id, customer name and credit limit:

CREATE OR REPLACE VIEW customer_credits(
        customer_id,
        name,
        credit
    ) AS 
SELECT
        customer_id,
        name,
        credit_limit
    FROM
        customers WITH READ ONLY;

SELECT
    *
FROM
    customer_credits;
    
UPDATE customer_credits
SET
    credit = 100
WHERE 
    customer_id = 124;
    
--The following SQL statements create the cars and brands tables; and also insert sample data into these tables.
CREATE TABLE brands(
	brand_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
	brand_name VARCHAR2(50) NOT NULL,
	PRIMARY KEY(brand_id)
);

CREATE TABLE cars (
	car_id NUMBER GENERATED BY DEFAULT AS IDENTITY,
	car_name VARCHAR2(255) NOT NULL,
	brand_id NUMBER NOT NULL,
	PRIMARY KEY(car_id),
	FOREIGN KEY(brand_id) 
	REFERENCES brands(brand_id) ON DELETE CASCADE
);

INSERT INTO brands(brand_name)
VALUES('Audi');


INSERT INTO brands(brand_name)
VALUES('BMW');


INSERT INTO brands(brand_name)
VALUES('Ford');


INSERT INTO brands(brand_name)
VALUES('Honda');


INSERT INTO brands(brand_name)
VALUES('Toyota');


INSERT INTO cars (car_name,brand_id)
VALUES('Audi R8 Coupe',
       1);


INSERT INTO cars (car_name,brand_id)
VALUES('Audi Q2',
       1);


INSERT INTO cars (car_name,brand_id)
VALUES('Audi S1',
       1);


INSERT INTO cars (car_name,brand_id)
VALUES('BMW 2-serie Cabrio',
       2);


INSERT INTO cars (car_name,brand_id)
VALUES('BMW i8',
       2);


INSERT INTO cars (car_name,brand_id)
VALUES('Ford Edge',
       3);


INSERT INTO cars (car_name,brand_id)
VALUES('Ford Mustang Fastback',
       3);


INSERT INTO cars (car_name,brand_id)
VALUES('Honda S2000',
       4);


INSERT INTO cars (car_name,brand_id)
VALUES('Honda Legend',
       4);


INSERT INTO cars (car_name,brand_id)
VALUES('Toyota GT86',
       5);


INSERT INTO cars (car_name,brand_id)
VALUES('Toyota C-HR',
       5);

SELECT 
    *
FROM
    brands;
    
SELECT 
    *
FROM
    cars;

--Oracle updatable view example
--The following statement creates a new view named cars_master:
CREATE VIEW cars_master AS 
SELECT
    car_id,
    car_name
FROM
    cars;
    
--It’s possible to delete a row from the cars table via the cars_master view, for example:
DELETE
FROM
    cars_master
WHERE
    car_id = 1;

--And you can update any column values exposed to the cars_master view:
UPDATE
    cars_master
SET
    car_name = 'Audi RS7 Sportback'
WHERE
    car_id = 2;

--Oracle updatable join view example
CREATE VIEW all_cars AS 
SELECT
    car_id,
    car_name,
    c.brand_id,
    brand_name
FROM
    cars c
INNER JOIN brands b ON
    b.brand_id = c.brand_id; 

--Find updatable columns of a join view
SELECT
    *
FROM
    USER_UPDATABLE_COLUMNS
WHERE
    TABLE_NAME = 'ALL_CARS';
    
--Oracle WITH CHECK OPTION clause
--The WITH CHECK OPTION clause is used for an updatable view to prohibits 
--the changes to the view that would produce rows which are not included in the defining query.

--To prevent the invisible rows from being updated to non-visible rows, you use the WITH CHECK OPTION clause:
--Oracle WITH CHECK OPTION example

SELECT
	*
FROM
	brands;

SELECT
	*
FROM
	cars;


--The following statement creates audi_cars view that returns only Audi cars:
CREATE
    VIEW audi_cars AS SELECT
        car_id,
        car_name,
        brand_id
    FROM
        cars
    WHERE
        brand_id = 1;

--The following query returns the data from the audi_cars view:
SELECT
    *
FROM
    audi_cars;

---The audi_cars is an updatable view so you can insert a new row into the cars table through it:
INSERT INTO audi_cars(car_name,brand_id)
VALUES('BMW Z3 coupe',2); 

INSERT INTO audi_cars(car_name,brand_id)
VALUES('Audi A5',1); 

SELECT
    *
FROM
    audi_cars;
    
--Let’s create another updatable view named ford_cars that has the WITH CHECK OPTION clause:
CREATE
    VIEW ford_cars AS SELECT
        car_id,
        car_name,
        brand_id
    FROM
        cars
    WHERE
        brand_id = 3 WITH CHECK OPTION;

--The following statement inserts an Audi car into the cars table through the ford_cars view:
INSERT
    INTO
        ford_cars(
            car_name,
            brand_id
        )
    VALUES(
        'Audi RS6 Avant',
        1
    );
INSERT
    INTO
        ford_cars(
            car_name,
            brand_id
        )
    VALUES(
        'Eco Sports',
        2
    );
--Similarly, the following UPDATE statement also fails to update because of the where-clause violation.
UPDATE
    ford_cars
SET
    brand_id = 4,
    car_name = 'Honda NSX'
WHERE
    car_id = 6;

--Oracle DROP VIEW examples
CREATE VIEW salesman AS 
SELECT
    *
FROM
    employees
WHERE
    job_title = 'Sales Representative';

SELECT
    *
FROM
    salesman;
    
DROP VIEW salesman;

--***************************************
--Section 12.Index
--***************************************

--Section 12.Index
--Oracle CREATE INDEX examples
--The following statement creates a new table named members that stores members’ data:
drop table members;
CREATE TABLE members(
    member_id INT GENERATED BY DEFAULT AS IDENTITY,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR2(255) NOT NULL,
    PRIMARY KEY(member_id)
);

--To load data into the  members table, you use the following script:

--Download load_member_data Script


--The members table has a primary key column, therefore,member_id Oracle created a new index for this column.
--To view all indexes of a table, you query from the all_indexes view:
SELECT 
    index_name, 
    index_type, 
    visibility, 
    status 
FROM 
    all_indexes
WHERE 
    table_name = 'MEMBERS';
    
--Creating an index on one column example
--Suppose, you often want to look up members by the last name and you find that the query is quite slow. 
--To speed up the lookup, you create an index for the last_name column:

CREATE INDEX members_last_name_i 
ON members(last_name);

--Now, showing the indexes again, you will find that the members table has two indexes:
SELECT 
    index_name, 
    index_type, 
    visibility, 
    status 
FROM 
    all_indexes
WHERE 
    table_name = 'MEMBERS';

--The following statement finds members whose last name is Harse:
SELECT * FROM members
WHERE last_name = 'Harse';


--To check if a query uses the index for lookup or not, you follow these steps:

--First, add the EXPLAIN PLAN FOR clause immediately before the SQL statement:
EXPLAIN PLAN FOR
SELECT * FROM members
WHERE last_name = 'Harse';

--This explains the execution plan into the plan_table table.

--Then, use the DBMS_XPLAN.DISPLAY() procedure to show the content of the plan_table:

SELECT 
    PLAN_TABLE_OUTPUT 
FROM 
    TABLE(DBMS_XPLAN.DISPLAY());
    
--Removing an index
--To remove an index, you use the DROP INDEX statement:
DROP INDEX members_last_name_i;


--Oracle UNIQUE index on one column example
CREATE UNIQUE INDEX members_email_i
ON members(email);


INSERT INTO members(first_name, last_name, gender, dob, email)
VALUES('Pegpa','Elce','F',DATE '1990-01-02','pelce0@trellian.com');


--***************************************
--Section 13.Sequence
--***************************************

--Creating a sequence
--The CREATE SEQUENCE statement allows you to create a new sequence object in your own schema.

--For example, this statement uses the CREATE SEQUENCE statement to create a new sequence object named item_seq:

CREATE SEQUENCE item_seq;


--Using a sequence
--To access the next available value for a sequence, you use the NEXTVAL pseudo-column:
SELECT item_seq.NEXTVAL
FROM dual;


--Once, you acquire the sequence number through the NEXTVAL pseudo-column, you can access it repeatedly using the CURRVAL pseudo-column:
SELECT item_seq.CURRVAL
FROM dual;

--The following statement uses the item_seq sequence repeatedly in an SQL statement:
SELECT item_seq.NEXTVAL
FROM   dual
CONNECT BY level <= 5;


--This example uses the item_seq sequence in the INSERT statements to populate values for the item_id column of the items table:
CREATE TABLE items(
    item_id NUMBER
);

INSERT INTO items(item_id) VALUES(item_seq.NEXTVAL);
INSERT INTO items(item_id) VALUES(item_seq.NEXTVAL);

COMMIT;

SELECT item_id FROM items;


--Removing a sequence
DROP SEQUENCE item_seq;


--Modifying a sequence
ALTER SEQUENCE item_seq MAXVALUE 100;

ALTER SEQUENCE item_seq RESTART START WITH 1;


--Oracle Database Administration
ALTER SESSION SET "_ORACLE_SCRIPT"=true;  

--1) Using Oracle CREATE USER statement to create a new local user example
CREATE USER john IDENTIFIED BY abcd1234;

--To find a list of users with the OPEN status, you query the information from the dba_users:
SELECT 
    username, 
    default_tablespace, 
    profile, 
    authentication_type
FROM
    dba_users
WHERE 
    account_status = 'OPEN';

--Let’s use the john account to log in the database.

--ERROR: ORA-01045: 

--user JOHN lacks CREATE SESSION privilege; logon denied

--To enable the user john to log in, 
--you need to grant the CREATE SESSION system privilege to the user john  by using the following statement:
GRANT CREATE SESSION TO john;

--Try connecting john


--2) Using Oracle CREATE USER statement to create a new local user with password expired example
CREATE USER jane IDENTIFIED BY abcd1234 
PASSWORD EXPIRE;

--Second, verify if the user has been created successfully:
SELECT 
    username, 
    default_tablespace, 
    profile, 
    authentication_type
FROM
    dba_users
WHERE 
    account_status = 'OPEN';


--Third, grant the CREATE SESSION privilege to the user jane so that you can use this user to log in the Oracle database.
GRANT CREATE SESSION TO jane;

--Check by doing login

--Change the password
ALTER USER jane IDENTIFIED BY newpassword;


--Oracle GRANT
--Oracle GRANT statement examples
--Let’s practice with the GRANT statement to get a better understanding.

--1) Use Oracle GRANT to grant system and object privileges to a user example

CREATE USER john IDENTIFIED BY abcd1234;

GRANT CREATE SESSION TO john;

--Second, use the user john to log in to the Oracle Database and create a new table:
CREATE TABLE t1(id NUMBER PRIMARY KEY);

--Oracle issued the following error:
ORA-01031: insufficient privileges

--To allow the user john to create the table, you need to grant the CREATE TABLE system privilege to the user as shown in the following statement:
GRANT CREATE TABLE TO john;

--Now, the user john can create a new table:
CREATE TABLE t1(id NUMBER PRIMARY KEY);


--The following statement shows the privileges of the current user:
SELECT * FROM session_privs;


--Third, use the user john to insert a new row into the t1 table:
INSERT INTO t1(id) VALUES(10);


--Oracle issued the following error:
--ORA-01950: no privileges on tablespace 'USERS'

--To fix this, you use the ALTER USER command to change the quota of the user john on the USERS tablespace:
ALTER USER john QUOTA UNLIMITED ON USERS;


--Now, the user john should be able to insert a row into the t1 table:
INSERT INTO t1(id) VALUES(10);

--And query data from the t1 table as well:
SELECT * FROM t1;


--Oracle DROP USER statement examples
DROP USER john CASCADE;

--***************************************
--Section 14 PL/SQL
--***************************************

--PL/SQL anonymous block example
--The following example shows a simple PL/SQL anonymous block with one executable section.
BEGIN
   DBMS_OUTPUT.put_line ('Hello World!');
END;

SET SERVEROUTPUT ON

--More PL/SQL anonymous block examples
DECLARE
  l_message VARCHAR2( 255 ) := 'Hello World!';
BEGIN
  DBMS_OUTPUT.PUT_LINE( l_message );
END;


--The next anonymous block example adds an exception-handling section which catches ZERO_DIVIDE exception raised in the executable section and displays an error message.
DECLARE
      v_result NUMBER;
BEGIN
   v_result := 1 / 0;
   EXCEPTION
      WHEN ZERO_DIVIDE THEN
         DBMS_OUTPUT.PUT_LINE( SQLERRM );
END;

--Declaring variables
--The following example declares three variables l_total_sales, l_credit_limit, and l_contact_name:
DECLARE
    l_total_sales NUMBER(15,2);
    l_credit_limit NUMBER (10,0);    
    l_contact_name VARCHAR2(255);
BEGIN
    NULL;
END;


--Default values

DECLARE
  l_product_name VARCHAR2( 100 ) := 'Laptop';
BEGIN
  NULL;
END;

--It is equivalent to the following block:

DECLARE 
   l_product_name VARCHAR2(100) DEFAULT 'Laptop';
BEGIN 
   NULL; 
END;

--NOT NULL constraint
DECLARE
  l_shipping_status VARCHAR2( 25 ) NOT NULL := 'Shipped';
BEGIN
  l_shipping_status := '';
END;

--Variable assignments
--To assign a value to a variable, you use the assignment operator (:=), for example:
DECLARE
    l_customer_group VARCHAR2(100) := 'Silver';
BEGIN
    l_customer_group := 'Gold';
    DBMS_OUTPUT.PUT_LINE(l_customer_group);
END;

--You can assign a value of a variable to another as shown in the following example:
DECLARE
    l_business_parter VARCHAR2(100) := 'Distributor';
    l_lead_for VARCHAR2(100);
BEGIN
    l_lead_for := l_business_parter; 
    DBMS_OUTPUT.PUT_LINE(l_lead_for);
END;

--Anchored declarations
--Typically, you declare a variable and select a value from a table column to this variable. If the data type of the table column changes, you must adjust the program to make it work with the new type.

--PL/SQL allows you to declare a variable whose data type anchor to a table column or another variable. Consider the following example:
DECLARE
  l_customer_name customers.name%TYPE;
  l_credit_limit customers.credit_limit%TYPE;
BEGIN
  SELECT
    name, credit_limit
  INTO
    l_customer_name, l_credit_limit
  FROM
    customers
  WHERE
    customer_id = 38;

  DBMS_OUTPUT.PUT_LINE(l_customer_name || ':' || l_credit_limit );
END;

--This example illustrates how to declare variables that anchor to another variable:
DECLARE
    l_credit_limit   customers.credit_limit%TYPE;
    l_average_credit l_credit_limit%TYPE;
    l_max_credit     l_credit_limit%TYPE;
    l_min_credit     l_credit_limit%TYPE;
BEGIN
    -- get credit limits
    SELECT 
        MIN(credit_limit), 
        MAX(credit_limit), 
        AVG(credit_limit)
    INTO 
        l_min_credit,
        l_max_credit, 
        l_average_credit
    FROM customers;
    
    
    SELECT 
        credit_limit
    INTO 
        l_credit_limit
    FROM 
        customers
    WHERE 
        customer_id = 100;

    -- show the credits     
    dbms_output.put_line('Min Credit: ' || l_min_credit);
    dbms_output.put_line('Max Credit: ' || l_max_credit);
    dbms_output.put_line('Avg Credit: ' || l_average_credit);

    -- show customer credit    
    dbms_output.put_line('Customer Credit: ' || l_credit_limit);
END;

--PL/SQL constant examples
--The following example declares two constants co_payment_term and co_payment_status:
DECLARE
    co_payment_term   CONSTANT NUMBER   := 45; -- days 
    co_payment_status CONSTANT BOOLEAN  := FALSE; 
BEGIN
    NULL;
END;


--If you attempt to change the co_payment_term in the execution section, PL/SQL will issue an error, for example:
DECLARE
    co_payment_term   CONSTANT NUMBER   := 45; -- days 
    co_payment_status CONSTANT BOOLEAN  := FALSE; 
BEGIN
    co_payment_term := 30; -- error
END;

--Here is the error message:
--PLS-00363: expression 'CO_PAYMENT_TERM' cannot be used as an assignment target

--The following illustrates how to declare a constant whose value is derived from an expression:
DECLARE 
    co_pi     CONSTANT REAL := 3.14159;
    co_radius CONSTANT REAL := 10;
    co_area   CONSTANT REAL := (co_pi * co_radius**2);
BEGIN
    DBMS_OUTPUT.PUT_LINE(co_area);
END;

--***************************************
--Section 15. Conditional control
--***************************************

--PL/SQL IF Statement

--The IF statement allows you to either execute or skip a sequence of statements, depending on a condition. The IF statement has the three forms:

--– IF THEN
--– IF THEN ELSE
--– IF THEN ELSIF

--PL/SQL IF THEN statement example
--In the following example, the statements between THEN and END IF execute because the sales revenue is greater than 100,000.
DECLARE n_sales NUMBER := 2000000; 
BEGIN 
   IF n_sales > 100000 THEN 
      DBMS_OUTPUT.PUT_LINE( 'Sales revenue is greater than 100K ' ); 
   END IF; 
END;


--IF THEN ELSE statement example
--The following example sets the sales commission to 10% if the sales revenue is greater than 200,000. Otherwise, the sales commission is set to 5%.
DECLARE
  n_sales NUMBER := 300000;
  n_commission NUMBER( 10, 2 ) := 0;
BEGIN
  IF n_sales > 200000 THEN
    n_commission := n_sales * 0.1;
  ELSE
    n_commission := n_sales * 0.05;
  END IF;
  DBMS_OUTPUT.PUT_LINE( 'commission is  '|| n_commission ); 
END;


--IF THEN ELSIF statement example
DECLARE
  n_sales NUMBER := 300000;
  n_commission NUMBER( 10, 2 ) := 0;
BEGIN
  IF n_sales > 200000 THEN
    n_commission := n_sales * 0.1;
  ELSIF n_sales <= 200000 AND n_sales > 100000 THEN 
    n_commission := n_sales * 0.05;
  ELSIF n_sales <= 100000 AND n_sales > 50000 THEN 
    n_commission := n_sales * 0.03;
  ELSE
    n_commission := n_sales * 0.02;
  END IF;
END;

--PL/SQL CASE Statement
--Simple CASE statement example
--The following example compares single value (c_grade) with many possible values ‘A’, ‘B’,’C’,’D’, and ‘F’:
DECLARE
  c_grade CHAR( 1 );
  c_rank  VARCHAR2( 20 );
BEGIN
  c_grade := 'B';
  CASE c_grade
  WHEN 'A' THEN
    c_rank := 'Excellent' ;
  WHEN 'B' THEN
    c_rank := 'Very Good' ;
  WHEN 'C' THEN
    c_rank := 'Good' ;
  WHEN 'D' THEN
    c_rank := 'Fair' ;
  WHEN 'F' THEN
    c_rank := 'Poor' ;
  ELSE
    c_rank := 'No such grade' ;
  END CASE;
  DBMS_OUTPUT.PUT_LINE( c_rank );
END;

--Searched CASE statement example
--The following example illustrates how to use the searched CASE statement to calculate sales commission based on sales revenue.
DECLARE
  n_sales      NUMBER;
  n_commission NUMBER;
BEGIN
  n_sales := 150000;
  CASE
  WHEN n_sales    > 200000 THEN
    n_commission := 0.2;
  WHEN n_sales   >= 100000 AND n_sales < 200000 THEN
    n_commission := 0.15;
  WHEN n_sales   >= 50000 AND n_sales < 100000 THEN
    n_commission := 0.1;
  WHEN n_sales    > 30000 THEN
    n_commission := 0.05;
  ELSE
    n_commission := 0;
  END CASE;

  DBMS_OUTPUT.PUT_LINE( 'Commission is ' || n_commission * 100 || '%'
  );
END;

--PL/SQL GOTO statement example
BEGIN
  GOTO second_message;

  <<first_message>>
  DBMS_OUTPUT.PUT_LINE( 'Hello' );
  GOTO the_end;

  <<second_message>>
  DBMS_OUTPUT.PUT_LINE( 'PL/SQL GOTO Demo' );
  GOTO first_message;

  <<the_end>>
  DBMS_OUTPUT.PUT_LINE( 'and good bye...' );

END;

--PL/SQL GOTO statement restrictions
--The GOTO statement is subject to the following restrictions.

--First, you cannot use a GOTO statement to transfer control into an IF, CASE or LOOP statement, the same for sub-block.

--Iterative processing with loops

--***************************************
--Section 16. . Iterative processing with loops
--***************************************
--PL/SQL LOOP
--The following example illustrates how to use the LOOP statement to execute a sequence of code and EXIT statement to terminate the loop.
DECLARE
  l_counter NUMBER := 0;
BEGIN
  LOOP
    l_counter := l_counter + 1;
    IF l_counter > 3 THEN
      EXIT;
    END IF;
    dbms_output.put_line( 'Inside loop: ' || l_counter )  ;
  END LOOP;
  -- control resumes here after EXIT
  dbms_output.put_line( 'After loop: ' || l_counter );
END;


--Nested loops
DECLARE
  l_i NUMBER := 0;
  l_j NUMBER := 0;
BEGIN
  <<outer_loop>>
  LOOP
    l_i := l_i + 1;
    EXIT outer_loop WHEN l_i > 2;    
    dbms_output.put_line('Outer counter ' || l_i);
    -- reset inner counter
    l_j := 0;
      <<inner_loop>> LOOP
      l_j := l_j + 1;
      EXIT inner_loop WHEN l_j > 3;
      dbms_output.put_line(' Inner counter ' || l_j);
    END LOOP inner_loop;
  END LOOP outer_loop;
END;

--PL/SQL FOR LOOP
--A) Simple PL/SQL FOR LOOP example
--In this example, the loop index is l_counter, lower_bound is one, and upper_bound is five. The loop shows a list of integers from 1 to 5.
BEGIN
  FOR l_counter IN 1..5
  LOOP
    DBMS_OUTPUT.PUT_LINE( l_counter );
  END LOOP;
END;

--B) Simulating STEP clause in FOR LOOP statement
DECLARE
  l_step  PLS_INTEGER := 2;
BEGIN
  FOR l_counter IN 1..5 
  LOOP
    dbms_output.put_line (l_counter*l_step);
  END LOOP;
END;

--C) Referencing variable with the same name as the loop index
DECLARE
  l_counter PLS_INTEGER := 10;
BEGIN
  FOR l_counter IN 1.. 5 loop
    DBMS_OUTPUT.PUT_LINE (l_counter);
  end loop;
  -- after the loop
  DBMS_OUTPUT.PUT_LINE (l_counter);
END; 

--FOR LOOP with REVERSE keyword
BEGIN
  FOR l_counter IN REVERSE 1..3
  LOOP
    DBMS_OUTPUT.PUT_LINE( l_counter );
  END LOOP;
END;

--The WHILE loop syntax

--A) Simple WHILE loop example
--The following example illustrates how to use the WHILE loop statement:
SET SERVEROUTPUT ON;
DECLARE
  n_counter NUMBER := 1;
BEGIN
  WHILE n_counter <= 5
  LOOP
    DBMS_OUTPUT.PUT_LINE( 'Counter : ' || n_counter );
    n_counter := n_counter + 1;
  END LOOP;
END;

--B) WHILE loop example terminated by EXIT WHEN statement
DECLARE
   n_counter NUMBER := 1;
BEGIN
   WHILE n_counter <= 5
      LOOP
        DBMS_OUTPUT.PUT_LINE( 'Counter : ' || n_counter );
        n_counter := n_counter + 1;
        EXIT WHEN n_counter = 3;
      END LOOP;
   END;
   
--PL/SQL CONTINUE statement
--PL/SQL CONTINUE statement example
BEGIN
  FOR n_index IN 1 .. 10
  LOOP
    -- skip odd numbers
    IF MOD( n_index, 2 ) = 1 THEN
      CONTINUE;
    END IF;
    DBMS_OUTPUT.PUT_LINE( n_index );
  END LOOP;
END;


BEGIN
  FOR n_index IN 1 .. 10
  LOOP
    -- skip even numbers
    CONTINUE
  WHEN MOD( n_index, 2 ) = 0;
    DBMS_OUTPUT.PUT_LINE( n_index );
  END LOOP;
END;

--***************************************
--Section 17.  Select Into
--***************************************
--A) PL/SQL  SELECT INTO – selecting one column example
--The following example uses a SELECT INTO statement to get the name of a customer based on the customer id, which is the primary key of the customers table.

DECLARE
  l_customer_name customers.name%TYPE;
BEGIN
  -- get name of the customer 100 and assign it to l_customer_name
  SELECT name INTO l_customer_name
  FROM customers
  WHERE customer_id = 100;
  -- show the customer name
  dbms_output.put_line( l_customer_name );
END;

--B) PL/SQL SELECT INTO – selecting a complete row example
--The following example fetches the entire row from the customers table for a specific customer ID:
DECLARE
  r_customer customers%ROWTYPE;
BEGIN
  -- get the information of the customer 100
  SELECT * INTO r_customer
  FROM customers
  WHERE customer_id = 100;
  -- show the customer info
  dbms_output.put_line( r_customer.name || ', website: ' || r_customer.website );
END;

--C) PL/SQL SELECT INTO – selecting data into multiple variables example
--The following example fetches the names of customer and contact from the customers and contacts tables for a specific customer id.
DECLARE
  l_customer_name customers.name%TYPE;
  l_contact_first_name contacts.first_name%TYPE;
  l_contact_last_name contacts.last_name%TYPE;
BEGIN
  -- get customer and contact names
  SELECT
    name, 
    first_name, 
    last_name
  INTO
    l_customer_name, 
    l_contact_first_name, 
    l_contact_last_name
  FROM
    customers
  INNER JOIN contacts USING( customer_id )
  WHERE
    customer_id = 100;
  -- show the information  
  dbms_output.put_line( 
    l_customer_name || ', Contact Person: ' ||
    l_contact_first_name || ' ' || l_contact_last_name );
END;

--***************************************
--Section 18.  Exception handlers
--***************************************
--PL/SQL exception examples
--Let’s take some examples of handling exceptions.

--PL/SQL NO_DATA_FOUND exception example
--The following block accepts a customer id as an input and returns the customer name :
DECLARE
    l_name customers.NAME%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    -- get the customer name by id
    SELECT name INTO l_name
    FROM customers
    WHERE customer_id = l_customer_id;

    -- show the customer name   
    dbms_output.put_line('Customer name is ' || l_name);
    
END;

-- Exception for customer id = 0
-- No data found 
SET SERVEROUTPUT ON;

--To issue a more meaningful message, you can add an exception-handling section as follows:
DECLARE
    l_name customers.NAME%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    -- get the customer
    SELECT NAME INTO l_name
    FROM customers
    WHERE customer_id = l_customer_id;
    
    -- show the customer name   
    dbms_output.put_line('customer name is ' || l_name);

    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Customer ' || l_customer_id ||  ' does not exist');
END;
--If you execute this code block and enter the customer id 0, you will get the following message:
--Customer 0 does not exist


--PL/SQL TOO_MANY_ROWS exception example
DECLARE
    l_name customers.name%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    -- get the customer
    SELECT name INTO l_name
    FROM customers
    WHERE customer_id <= l_customer_id;
    
    -- show the customer name   
    dbms_output.put_line('Customer name is ' || l_name);

    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Customer ' || l_customer_id ||  ' does not exist');
END;
--exact fetch returns more than requested number of rows

--Third, add the exception handler for the TOO_MANY_ROWS exception:
DECLARE
    l_name customers.NAME%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    -- get the customer
    SELECT NAME INTO l_name
    FROM customers
    WHERE customer_id > l_customer_id;
    
    -- show the customer name   
    dbms_output.put_line('Customer name is ' || l_name);
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Customer ' || l_customer_id ||  ' does not exist');
        WHEN TOO_MANY_ROWS THEN
            dbms_output.put_line('The database returns more than one customer');    
END;
--Finally, if you execute the code, enter 10 as the customer id. You will see that the code will not raise any exception and issue the following message:
--The database returns more than one customer

--PL/SQL Raise Exceptions

--To raise an exception explicitly, you use the RAISE statement. The RAISE statement allows you to:

--Raise a user-defined exception.
--Raise an internally defined exception.
--Reraising the current exception.

--Raising a user-defined exception example
--The following example illustrates how to declare a user-defined exception and associate it with an error code.
DECLARE
    e_credit_too_high EXCEPTION;
    PRAGMA exception_init( e_credit_too_high, -20001 );
    l_max_credit customers.credit_limit%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
    l_credit customers.credit_limit%TYPE := &credit_limit;
BEGIN
    -- get the meax credit limit
    SELECT MAX(credit_limit) 
    INTO l_max_credit
    FROM customers;
    
    -- check if input credit is greater than the max credit
    IF l_credit > l_max_credit THEN 
        RAISE e_credit_too_high;
    END IF;
    
    -- if not, update credit limit
    UPDATE customers 
    SET credit_limit = l_credit
    WHERE customer_id = l_customer_id;
    
    COMMIT;
END;

--Here is the output if you enter customer id 100 and credit limit 20000:

--ORA-20001:
--If you want to include a custom message, you can replace the line:
RAISE e_credit_too_high;
--by the following line:
raise_application_error(-20001,'Credit is too high');

DECLARE
    e_credit_too_high EXCEPTION;
    PRAGMA exception_init( e_credit_too_high, -20001 );
    l_max_credit customers.credit_limit%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
    l_credit customers.credit_limit%TYPE := &credit_limit;
BEGIN
    -- get the meax credit limit
    SELECT MAX(credit_limit) 
    INTO l_max_credit
    FROM customers;
    
    -- check if input credit is greater than the max credit
    IF l_credit > l_max_credit THEN 
        raise_application_error(-20001,'Credit is too high');
    END IF;
    
    -- if not, update credit limit
    UPDATE customers 
    SET credit_limit = l_credit
    WHERE customer_id = l_customer_id;
    
    COMMIT;
END;

--Reraising the current exception
--In this example:

--First, get the max credit limit from the customers table.
--Second, compare the max credit with the user-input credit. If the user-input credit is greater than the max credit, then raise the e_credit_too_high exception.
--Third, display a message and reraise the exception in the exception-handling section in the inner block.
--Finally, in the outer block, reassign the average credit to the l_credit variable and update the customer with the newly adjusted credit.
--If you enter the customer id 100 and credit limit 10000, the credit limit of the customer will be updated to the average credit.
DECLARE
    e_credit_too_high EXCEPTION;
    PRAGMA exception_init( e_credit_too_high, -20001 );
    l_max_credit customers.credit_limit%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
    l_credit customers.credit_limit%TYPE     := &credit_limit;
BEGIN
    BEGIN
        -- get the max credit limit
        SELECT MAX(credit_limit) 
        INTO l_max_credit
        FROM customers;
        
        -- check if input credit is greater than the max credit
        IF l_credit > l_max_credit THEN 
            RAISE e_credit_too_high;
        END IF;
        EXCEPTION
            WHEN e_credit_too_high THEN
                dbms_output.put_line('The credit is too high' || l_credit);
                RAISE; -- reraise the exception
    END;
EXCEPTION
    WHEN e_credit_too_high THEN
        -- get average credit limit
        SELECT avg(credit_limit) 
        into l_credit
        from customers;
        
        -- adjust the credit limit to the average
        dbms_output.put_line('Adjusted credit to ' || l_credit);
    
        --  update credit limit
        UPDATE customers 
        SET credit_limit = l_credit
        WHERE customer_id = l_customer_id;
   
        COMMIT;
END;

--If you enter the customer id 100 and credit limit 10000, the credit limit of the customer will be updated to the average credit.
SELECT * FROM customers 
WHERE customer_id = 100;



--Oracle RAISE_APPLICATION_ERROR
--Oracle raise_application_error example
--Let’s take a look at some examples of using the raise_application_error procedure to raise exceptions.

--This example uses the raise_application_error procedure to raise an exception with id -20111 and message 'Credit Limit Exceeded':
--In this example:

--First, declare a user-defined exception credit_limit_exceed associated with the error number -20111.
--Second, declare two variables l_customer_id and l_credit_limit to store customer id and credit limit entered by users.
--Third, get the customer credit limit based on the customer id.
--Finally, check the input credit with the customer credit and use the raise_application_error to raise an exception.

DECLARE
    credit_limit_exceed EXCEPTION;
    PRAGMA exception_init(credit_limit_exceed, -20111);

    l_customer_id     customers.customer_id%TYPE := &customer_id;
    l_credit_limit    customers.credit_limit%TYPE := &credit_limit;

    l_customer_credit customers.credit_limit%TYPE;
    
BEGIN
    -- get customer credit limit
    SELECT credit_limit INTO l_customer_credit
    FROM customers
    WHERE customer_id = l_customer_id;
    
    -- raise an exception if the credit limit is exceeded
    IF l_customer_credit > l_credit_limit THEN
        raise_application_error(-20111,'Credit Limit Exceeded');
    END IF;
    
    dbms_output.put_line('Credit Limit is checked and passed');
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('Customer with id ' || l_customer_id || ' does not exist.');
END;


--***************************************
--Section 19.  Cursors
--***************************************

--PL/SQL Cursor

--PL/SQL cursor example
create table Employee
(
      ID                 VARCHAR2(4 BYTE)         NOT NULL primary key,
      First_Name         VARCHAR2(10 BYTE),
      Last_Name          VARCHAR2(10 BYTE),
      Start_Date         DATE,
      End_Date           DATE,
      Salary             Number(8,2),
      City               VARCHAR2(10 BYTE),
      Description        VARCHAR2(15 BYTE)
);

insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary,  City,       Description)
values ('01','Jason',    'Martin',  to_date('19960725','YYYYMMDD'), to_date('20060725','YYYYMMDD'), 1234.56, 'Toronto',  'Programmer')
  



 insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary,  City,       Description)
                  values('02','Alison',   'Mathews', to_date('19760321','YYYYMMDD'), to_date('19860221','YYYYMMDD'), 6661.78, 'Vancouver','Tester')
  



 insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary,  City,       Description)
                  values('03','James',    'Smith',   to_date('19781212','YYYYMMDD'), to_date('19900315','YYYYMMDD'), 6544.78, 'Vancouver','Tester')
  



 insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary,  City,       Description)
                  values('04','Celia',    'Rice',    to_date('19821024','YYYYMMDD'), to_date('19990421','YYYYMMDD'), 2344.78, 'Vancouver','Manager')



insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary,  City,       Description)
                  values('05','Robert',   'Black',   to_date('19840115','YYYYMMDD'), to_date('19980808','YYYYMMDD'), 2334.78, 'Vancouver','Tester')
  


insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary, City,        Description)
                  values('06','Linda',    'Green',   to_date('19870730','YYYYMMDD'), to_date('19960104','YYYYMMDD'), 4322.78,'New York',  'Tester')
  

insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary, City,        Description)
                  values('07','David',    'Larry',   to_date('19901231','YYYYMMDD'), to_date('19980212','YYYYMMDD'), 7897.78,'New York',  'Manager')
  


insert into Employee(ID,  First_Name, Last_Name, Start_Date,                     End_Date,                       Salary, City,        Description)
                  values('08','James',    'Cat',     to_date('19960917','YYYYMMDD'), to_date('20020415','YYYYMMDD'), 1232.78,'Vancouver', 'Tester')
  


SELECT 
    *
FROM
    employee;
    
DECLARE
    -- step 1: declare the variables
    v_id employee. id%TYPE;
    v_name employee.first_name%TYPE;
    v_salary employee.salary%TYPE;
    
    -- step 2: declare the cursor
    CURSOR cv_employee_cursor IS
    SELECT id, first_name, salary
    FROM employee
    ORDER BY id;
    BEGIN
    -- step 3: open the cursor
    OPEN cv_employee_cursor;
    LOOP
    -- step 4: fetch the rows from the cursor
    FETCH cv_employee_cursor
    INTO v_id, v_name, v_salary;
    -- exit the loop when there are no more rows, as indicated by
    -- the Boolean variable NOTFOUND (= true when
    -- there are no more rows)
    EXIT WHEN cv_employee_cursor%NOTFOUND;
    -- use DBMS_OUTPUT.PUT_LINE() to display the variables
    DBMS_OUTPUT.PUT_LINE('v_id = ' || v_id || ', v_name = ' || v_name ||', v_salary = ' || v_salary);
    END LOOP;
    
     -- step 5: close the cursor
     CLOSE cv_employee_cursor;
 END;

declare
        cursor c_countEmps is 
        select count(*) from employee;
        v_out NUMBER;
    begin
        open c_countEmps;
        fetch c_countEmps into v_out;
        close c_countEmps;
        DBMS_OUTPUT.put_line('number of emps is:'||v_out);
    end;
    
CREATE TABLE product (
         product_name     VARCHAR2(25) PRIMARY KEY,
         product_price    NUMBER(4,2),
         quantity_on_hand NUMBER(5,0),
         last_stock_date  DATE
);
INSERT INTO product VALUES ('Product 1', 99,  1,    '15-JAN-03');
INSERT INTO product VALUES ('Product 2', 75,  1000, '15-JAN-02');
INSERT INTO product VALUES ('Product 3', 50,  100,  '15-JAN-03');
INSERT INTO product VALUES ('Product 4', 25,  10000, null);
INSERT INTO product VALUES ('Product 5', 9.95,1234, '15-JAN-04');
INSERT INTO product VALUES ('Product 6', 45,  1,   '15-JAN-04');


SELECT * FROM product;

declare
        cursor c_countEmps is select count(*) from employee;
        v_out NUMBER;
    begin
        open c_countEmps;
        fetch c_countEmps into v_out;
        close c_countEmps;
        DBMS_OUTPUT.put_line('number of emps is:'||v_out);
    end;
 



--The following statement creates a view that returns the sales revenues by customers:
CREATE VIEW sales AS
SELECT customer_id,
       SUM(unit_price * quantity) total,
       ROUND(SUM(unit_price * quantity) * 0.05) credit
FROM order_items
INNER JOIN orders USING (order_id)
WHERE status = 'Shipped'
GROUP BY customer_id;

--The values of the credit column are 5% of the total sales revenues.

--Suppose you need to develop a anonymous block that:

--Reset credit limits of all customers to zero.
--Fetch customers sorted by sales in descending order and gives them new credit limits from a budget of 1 million.
--The following anonymous block illustrates the logic:
DECLARE
  l_budget NUMBER := 1000000;
   -- cursor
  CURSOR c_sales IS
  SELECT  *  FROM sales  
  ORDER BY total DESC;
   -- record    
   r_sales c_sales%ROWTYPE;
BEGIN

  -- reset credit limit of all customers
  UPDATE customers SET credit_limit = 0;

  OPEN c_sales;

  LOOP
    FETCH  c_sales  INTO r_sales;
    EXIT WHEN c_sales%NOTFOUND;

    -- update credit for the current customer
    UPDATE 
        customers
    SET  
        credit_limit = 
            CASE WHEN l_budget > r_sales.credit 
                        THEN r_sales.credit 
                            ELSE l_budget
            END
    WHERE 
        customer_id = r_sales.customer_id;

    --  reduce the budget for credit limit
    l_budget := l_budget - r_sales.credit;

    DBMS_OUTPUT.PUT_LINE( 'Customer id: ' ||r_sales.customer_id || 
' Credit: ' || r_sales.credit || ' Remaining Budget: ' || l_budget );

    -- check the budget
    EXIT WHEN l_budget <= 0;
  END LOOP;

  CLOSE c_sales;
END;

--PL/SQL Cursor FOR LOOP

--A) PL/SQL cursor FOR LOOP example
--The following example declares an explicit cursor and uses it in the cursor FOR LOOP statement.
--In this example, the SELECT statement of the cursor retrieves data from the products table. The FOR LOOP statement opened, fetched each row in the result set, displayed the product information, and closed the cursor.
DECLARE
  CURSOR c_product
  IS
    SELECT 
        product_name, list_price
    FROM 
        products 
    ORDER BY 
        list_price DESC;
BEGIN
  FOR r_product IN c_product
  LOOP
    dbms_output.put_line( r_product.product_name || ': $' ||  r_product.list_price );
  END LOOP;
END;

--B) Cursor FOR LOOP with a SELECT statement example
BEGIN
  FOR r_product IN (
        SELECT 
            product_name, list_price 
        FROM 
            products
        ORDER BY list_price DESC
    )
  LOOP
     dbms_output.put_line( r_product.product_name ||
        ': $' || 
        r_product.list_price );
  END LOOP;
END;

--PL/SQL cursor with parameters example

DECLARE
    r_product products%rowtype;
    CURSOR c_product (low_price NUMBER, high_price NUMBER)
    IS
        SELECT *
        FROM products
        WHERE list_price BETWEEN low_price AND high_price;
BEGIN
    -- show mass products
    dbms_output.put_line('Mass products: ');
    OPEN c_product(50,100);
    LOOP
        FETCH c_product INTO r_product;
        EXIT WHEN c_product%notfound;
        dbms_output.put_line(r_product.product_name || ': ' ||r_product.list_price);
    END LOOP;
    CLOSE c_product;

    -- show luxury products
    dbms_output.put_line('Luxury products: ');
    OPEN c_product(800,1000);
    LOOP
        FETCH c_product INTO r_product;
        EXIT WHEN c_product%notfound;
        dbms_output.put_line(r_product.product_name || ': ' ||r_product.list_price);
    END LOOP;
    CLOSE c_product;

END;
/

--PL/SQL parameterized cursor with default values

DECLARE
    CURSOR c_revenue (in_year NUMBER :=2017 , in_customer_id NUMBER := 1)
    IS
        SELECT SUM(quantity * unit_price) revenue
        FROM order_items
        INNER JOIN orders USING (order_id)
        WHERE status = 'Shipped' AND EXTRACT( YEAR FROM order_date) = in_year
        GROUP BY customer_id
        HAVING customer_id = in_customer_id;
        
    r_revenue c_revenue%rowtype;
BEGIN
    OPEN c_revenue;
    LOOP
        FETCH c_revenue INTO r_revenue;
        EXIT    WHEN c_revenue%notfound;
        -- show the revenue
        dbms_output.put_line(r_revenue.revenue);
    END LOOP;
    CLOSE c_revenue;
END;

--PL/SQL cursor variable examples
--The following function gets all direct reports of a manager based on the manager id from the employees table in the sample database. The function returns a weak typed REF CURSOR variable:
CREATE OR REPLACE FUNCTION get_direct_reports(
      in_manager_id IN employees.manager_id%TYPE)
   RETURN SYS_REFCURSOR
AS
   c_direct_reports SYS_REFCURSOR;
BEGIN

   OPEN c_direct_reports FOR 
   SELECT 
      employee_id, 
      first_name, 
      last_name, 
      email
   FROM 
      employees 
   WHERE 
      manager_id = in_manager_id 
   ORDER BY 
         first_name,   
         last_name;

   RETURN c_direct_reports;
END;

--The following anonymous block calls the get_direct_reports() function and processes the cursor variable to display the direct reports of the manager with id of 46.
DECLARE
   c_direct_reports SYS_REFCURSOR;
   l_employee_id employees.employee_id%TYPE;
   l_first_name  employees.first_name%TYPE;
   l_last_name   employees.last_name%TYPE;
   l_email       employees.email%TYPE;
BEGIN
   -- get the ref cursor from function
   c_direct_reports := get_direct_reports(46); 
   
   -- process each employee
   LOOP
      FETCH
         c_direct_reports
      INTO
         l_employee_id,
         l_first_name,
         l_last_name,
         l_email;
      EXIT
   WHEN c_direct_reports%notfound;
      dbms_output.put_line(l_first_name || ' ' || l_last_name || ' - ' ||    l_email );
   END LOOP;
   -- close the cursor
   CLOSE c_direct_reports;
END;

--PL/SQL Procedure
--Creating a PL/SQL procedure example
--The following procedure accepts a customer id and prints out the customer’s contact information including first name, last name, and email:
CREATE OR REPLACE PROCEDURE print_contact(
    in_customer_id NUMBER 
)
IS
  r_contact contacts%ROWTYPE;
BEGIN
  -- get contact based on customer id
  SELECT *
  INTO r_contact
  FROM contacts
  WHERE customer_id = in_customer_id;

  -- print out contact's information
  dbms_output.put_line( r_contact.first_name || ' ' ||
  r_contact.last_name || '<' || r_contact.email ||'>' );

EXCEPTION
   WHEN OTHERS THEN
      dbms_output.put_line( SQLERRM );
END;

EXEC print_contact(100);

DROP PROCEDURE print_contact;

--Oracle Implicit Statement Results
--Returning a single result set
--The following statement creates a stored procedure that returns customers who have credit limits are greater than a specific credit:

CREATE OR REPLACE PROCEDURE get_customer_by_credit(
    min_credit NUMBER
)
AS 
    c_customers SYS_REFCURSOR;
BEGIN
    -- open the cursor
    OPEN c_customers FOR
        SELECT customer_id, credit_limit, name
        FROM customers
        WHERE credit_limit > min_credit
        ORDER BY credit_limit;
    -- return the result set
    dbms_sql.return_result(c_customers);
END;

EXEC get_customer_by_credit(5000);

--PL/SQL function example
CREATE OR REPLACE FUNCTION get_total_sales(
    in_year PLS_INTEGER
) 
RETURN NUMBER
IS
    l_total_sales NUMBER := 0;
BEGIN
    -- get total sales
    SELECT SUM(unit_price * quantity)
    INTO l_total_sales
    FROM order_items
    INNER JOIN orders USING (order_id)
    WHERE status = 'Shipped'
    GROUP BY EXTRACT(YEAR FROM order_date)
    HAVING EXTRACT(YEAR FROM order_date) = in_year;
    
    -- return the total sales
    RETURN l_total_sales;
END;

--Calling a PL/SQL function
--You use a function anywhere that you use an expression of the same type. You can call a function in various places such as:
DECLARE
    l_sales_2017 NUMBER := 0;
BEGIN
    l_sales_2017 := get_total_sales (2017);
    DBMS_OUTPUT.PUT_LINE('Sales 2017: ' || l_sales_2017);
END;

--2) in a Boolean expression
BEGIN
    IF get_total_sales (2017) > 10000000 THEN
        DBMS_OUTPUT.PUT_LINE('Sales 2017 is above target');
    END IF;
END;
--3) in an SQL statement
SELECT
    get_total_sales(2017)
FROM
    dual;

--PL/SQL Cursor Variables with REF CURSOR
--PL/SQL cursor variable examples
CREATE OR REPLACE FUNCTION get_direct_reports(
      in_manager_id IN employees.manager_id%TYPE)
   RETURN SYS_REFCURSOR
AS
   c_direct_reports SYS_REFCURSOR;
BEGIN

   OPEN c_direct_reports FOR 
   SELECT 
      employee_id, 
      first_name, 
      last_name, 
      email
   FROM 
      employees 
   WHERE 
      manager_id = in_manager_id 
   ORDER BY 
         first_name,   
         last_name;

   RETURN c_direct_reports;
END;


--The following anonymous block calls the get_direct_reports() function and processes the cursor variable to display the direct reports of the manager with id of 46.

DECLARE
   c_direct_reports SYS_REFCURSOR;
   l_employee_id employees.employee_id%TYPE;
   l_first_name  employees.first_name%TYPE;
   l_last_name   employees.last_name%TYPE;
   l_email       employees.email%TYPE;
BEGIN
   -- get the ref cursor from function
   c_direct_reports := get_direct_reports(46); 
   
   -- process each employee
   LOOP
      FETCH
         c_direct_reports
      INTO
         l_employee_id,
         l_first_name,
         l_last_name,
         l_email;
      EXIT
   WHEN c_direct_reports%notfound;
      dbms_output.put_line(l_first_name || ' ' || l_last_name || ' - ' ||    l_email );
   END LOOP;
   -- close the cursor
   CLOSE c_direct_reports;
END;

--Creating an Oracle trigger example


--Suppose we want to record actions against the customers table whenever a customer is updated or deleted. In order to do this:
--First, create a new table for recording the UPDATE and DELETE events:
CREATE TABLE audits (
      audit_id         NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
      table_name       VARCHAR2(255),
      transaction_name VARCHAR2(10),
      by_user          VARCHAR2(30),
      transaction_date DATE
);

--Second, create a new trigger associated with the customers table:
CREATE OR REPLACE TRIGGER customers_audit_trg
    AFTER 
    UPDATE OR DELETE 
    ON customers
    FOR EACH ROW    
DECLARE
   l_transaction VARCHAR2(10);
BEGIN
   -- determine the transaction type
   l_transaction := CASE  
         WHEN UPDATING THEN 'UPDATE'
         WHEN DELETING THEN 'DELETE'
   END;

   -- insert a row into the audit table   
   INSERT INTO audits (table_name, transaction_name, by_user, transaction_date)
   VALUES('CUSTOMERS', l_transaction, USER, SYSDATE);
END;

--The following statement updates the credit limit of the customer 10 to 2000.
UPDATE
   customers
SET
   credit_limit = 2000
WHERE
   customer_id =10;

--Now, check the contents of the table audits to see if the trigger was fired:
SELECT * FROM audits;

--As you can see clearly from the output, the trigger customers_audit_trg was fired so that we have a new row inserted into the audits table.

--This DELETE statement deletes a row from the customers table.
DELETE FROM customers
WHERE customer_id = 10;

--This DELETE statement deletes a row from the customers table.
SELECT * FROM audits;

--Oracle Statement-level Trigger example
--We’ll use the table customers from the sample database for the demonstration:

CREATE OR REPLACE TRIGGER customers_credit_trg
    BEFORE UPDATE OF credit_limit  
    ON customers
DECLARE
    l_day_of_month NUMBER;
BEGIN
    -- determine the transaction type
    l_day_of_month := EXTRACT(DAY FROM sysdate);

    IF l_day_of_month BETWEEN 28 AND 31 THEN
        raise_application_error(-20100,'Cannot update customer credit from 28th to 31st');
    END IF;
END;

--Testing the Oracle statement-level trigger
--The following statement uses the UPDATE statement to increase the credit limit of all customer 10%:

UPDATE 
    customers 
SET 
    credit_limit = credit_limit * 0.10;

--Oracle row-level trigger example
--The following example creates a row-level trigger that prevents users from updating credit for a customer if the new credit increases to more than double:
CREATE OR REPLACE TRIGGER customers_update_credit_trg 
    BEFORE UPDATE OF credit_limit
    ON customers
    FOR EACH ROW
    WHEN (NEW.credit_limit > 0)
BEGIN
    -- check the credit limit
    IF :NEW.credit_limit >= 2 * :OLD.credit_limit THEN
        raise_application_error(-20101,'The new credit ' || :NEW.credit_limit || 
            ' cannot increase to more than double, the current credit ' || :OLD.credit_limit);
    END IF;
END;

--Testing the trigger
--First, find the credit limit of the customer id 10:

SELECT * 
FROM customers 
WHERE customer_id = 1232;


UPDATE customers
SET credit_limit = 5000
WHERE customer_id = 10;


--Disable all triggers of a table
ALTER TABLE customers DISABLE ALL TRIGGERS;

--Enable all triggers of a table
ALTER TABLE customers
ENABLE ALL TRIGGERS;


CREATE TABLE temp_table(
    temp_id NUMBER(5) PRIMARY KEY,
    name VARCHAR(20),
    amount VARCHAR(20)
);

--Insert Procedure

CREATE OR REPLACE PROCEDURE insert_temp(
	   n_temp_id temp_table.temp_id%TYPE,
	   name temp_table.name%TYPE,
	   amount temp_table.amount%TYPE)
AS
BEGIN
  INSERT INTO temp_table 
  VALUES (n_temp_id, name,amount);
  COMMIT;
END;

BEGIN
   insert_temp(1001,'Vivek Gohil',1000);
END;

select * from temp_table;

--delete procedure
CREATE OR REPLACE PROCEDURE delete_temp(n_temp_id IN temp_table.temp_id%TYPE)
IS
BEGIN
  DELETE temp_table where temp_id = n_temp_id;
  COMMIT;
END;
/

BEGIN
   delete_temp(1001);
END;


--update procedure
CREATE OR REPLACE PROCEDURE update_temp(
	   n_temp_id IN temp_table.temp_id%TYPE,
	   l_name IN temp_table.name%TYPE)
IS
BEGIN

  UPDATE temp_table SET name = l_name where temp_id = n_temp_id;
  COMMIT;
END;
/

BEGIN
   update_temp(1001,'new_Vivek');
END;

select * from temp_table;