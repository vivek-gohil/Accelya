ALTER SESSION SET "_ORACLE_SCRIPT" = true;

CREATE USER borntocode IDENTIFIED BY borntocode;

GRANT connect, dba TO borntocode;
-- ***************************************************
-- Slide 9 : Writing PL/SQL anonymous block example
-- ***************************************************
-- PL/SQL anonymous block example

-- The following example shows a simple PL/SQL anonymous block with one executable section.
BEGIN
    dbms_output.put_line('Hello World!');
END;

SET SERVEROUTPUT ON;

-- More PL/SQL anonymous block examples
-- In this example, we first declare a variable l_message that holds the greeting message. And then, in the execution section, we use the DBMS_OUTPUT.PUTLINE procedure to show the content of this variable instead of using a literal string.
DECLARE
    l_message VARCHAR2(255) := 'Hello World!';
BEGIN
    dbms_output.put_line(l_message);
END;

-- The next anonymous block example adds an exception-handling section which catches ZERO_DIVIDE exception raised in the executable section and displays an error message.
DECLARE
    v_result NUMBER;
BEGIN
    v_result := 1 / 0;
EXCEPTION
    WHEN zero_divide THEN
        dbms_output.put_line(sqlerrm);
END;

-- ***************************************************
-- Slide 13 : PL/SQL Variables
-- ***************************************************
-- The following example declares three variables l_total_sales, l_credit_limit, and l_contact_name:

DECLARE
    l_total_sales  NUMBER(
                        15,
                        2
    );
    l_credit_limit NUMBER(
                         10,
                         0
    );
    l_contact_name VARCHAR2(255);
BEGIN
    NULL;
END;

-- ***************************************************
-- Slide 15 : PL/SQL Variables
-- ***************************************************
-- The following example declares a variable named l_product_name with an initial value 'Laptop’:

DECLARE
    l_product_name VARCHAR2(100) := 'Laptop';
BEGIN
    NULL;
END;

-- It is equivalent to the following block:

DECLARE
    l_product_name VARCHAR2(100) DEFAULT 'Laptop';
BEGIN
    NULL;
END;

-- ***************************************************
-- Slide 17 : PL/SQL Variables
-- ***************************************************
-- The following example first declares a variable named l_shipping_status with the NOT NULL constraint. Then, it assigns the variable a zero-length string.
DECLARE
    l_shipping_status VARCHAR2(25) NOT NULL := 'Shipped';
BEGIN
    l_shipping_status := '';
END;

-- ***************************************************
-- Slide 18 : PL/SQL Variables
-- ***************************************************
-- To assign a value to a variable, you use the assignment operator (:=), for example:
DECLARE
    l_customer_group VARCHAR2(100) := 'Silver';
BEGIN
    l_customer_group := 'Gold';
    dbms_output.put_line(l_customer_group);
END;

-- ***************************************************
-- Slide 20 : PL/SQL Variables
-- ***************************************************
DECLARE
    l_customer_name customers.name%TYPE;
    l_credit_limit  customers.credit_limit%TYPE;
BEGIN
    SELECT
        name,
        credit_limit
    INTO
        l_customer_name,
        l_credit_limit
    FROM
        customers
    WHERE
        customer_id = 38;

    dbms_output.put_line(l_customer_name
                         || ':'
                         || l_credit_limit);
END;
/
-- This example illustrates how to declare variables that anchor to another variable:
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
    FROM
        customers;

    SELECT
        credit_limit
    INTO l_credit_limit
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
/
-- ***************************************************
-- Slide 22 : PL/SQL Constants
-- ***************************************************
-- The following example declares two constants co_payment_term and co_payment_status:

DECLARE
    co_payment_term   CONSTANT NUMBER := 45; -- days 
    co_payment_status CONSTANT BOOLEAN := false;
BEGIN
    NULL;
END;

--If you attempt to change the co_payment_term in the execution section, PL/SQL will issue an error, for example:

DECLARE
    co_payment_term   CONSTANT NUMBER := 45; -- days 
    co_payment_status CONSTANT BOOLEAN := false;
BEGIN
    co_payment_term := 30; -- error
END;
/
-- Here is the error message:
-- PLS-00363: expression 'CO_PAYMENT_TERM' cannot be used as an assignment target

-- ***************************************************
-- Slide 23 : PL/SQL Constants
-- ***************************************************
-- The following illustrates how to declare a constant whose value is derived from an expression:

DECLARE
    co_pi     CONSTANT REAL := 3.14159;
    co_radius CONSTANT REAL := 10;
    co_area   CONSTANT REAL := ( co_pi * co_radius * * 2 );
BEGIN
    dbms_output.put_line(co_area);
END;

-- ***************************************************
-- Slide 27 : PL/SQL IF Statement
-- ***************************************************
-- In the following example, the statements between THEN and END IF execute because the sales revenue is greater than 100,000.
-- PL/SQL IF THEN 
DECLARE
    n_sales NUMBER := 2000000;
BEGIN
    IF n_sales > 100000 THEN
        dbms_output.put_line('Sales revenue is greater than 100K ');
    END IF;
END;

-- ***************************************************
-- Slide 29 : PL/SQL IF Statement
-- ***************************************************
-- IF THEN ELSE statement example
-- The following example sets the sales commission to 10% if the sales revenue is greater than 200,000. Otherwise, the sales commission is set to 5%.

DECLARE
    n_sales      NUMBER := 300000;
    n_commission NUMBER(
                       10,
                       2
    ) := 0;
BEGIN
    IF n_sales > 200000 THEN
        n_commission := n_sales * 0.1;
    ELSE
        n_commission := n_sales * 0.05;
    END IF;

    dbms_output.put_line('Commission : ' || n_commission);
END;

-- ***************************************************
-- Slide 30 : PL/SQL IF Statement
-- ***************************************************
-- IF THEN ELSIF statement example
-- The following example uses the IF THEN ELSIF statement to set the sales commission based on the sales revenue.

DECLARE
    n_sales      NUMBER := 300000;
    n_commission NUMBER(
                       10,
                       2
    ) := 0;
BEGIN
    IF n_sales > 200000 THEN
        n_commission := n_sales * 0.1;
    ELSIF
        n_sales <= 200000
        AND n_sales > 100000
    THEN
        n_commission := n_sales * 0.05;
    ELSIF
        n_sales <= 100000
        AND n_sales > 50000
    THEN
        n_commission := n_sales * 0.03;
    ELSE
        n_commission := n_sales * 0.02;
    END IF;

    dbms_output.put_line('Commission : ' || n_commission);
END;

-- ***************************************************
-- Slide 32 : PL/SQL GOTO Statement
-- ***************************************************
BEGIN
    GOTO second_message;
    << first_message >> dbms_output.put_line('Hello');
    GOTO the_end;
    << second_message >> dbms_output.put_line('PL/SQL GOTO Demo');
    GOTO first_message;
    << the_end >> dbms_output.put_line('and good bye...');
END;


-- ***************************************************
-- Slide 33 : PL/SQL GOTO Statement
-- ***************************************************
-- First, you cannot use a GOTO statement to transfer control into an IF, CASE or LOOP statement, the same for sub-block.
-- The following example attempts to transfer control into an IF statement using a GOTO statement:
DECLARE
    n_sales NUMBER;
    n_tax   NUMBER;
BEGIN
    GOTO inside_if_statement;
    IF n_sales > 0 THEN
        << inside_if_statement >> n_tax := n_sales * 0.1;
    END IF;

END;

-- ***************************************************
-- Slide 34 : PL/SQL NULL Statement
-- ***************************************************
DECLARE
    l_total_sales  NUMBER(
                        15,
                        2
    );
    l_credit_limit NUMBER(
                         10,
                         0
    );
    l_contact_name VARCHAR2(255);
BEGIN
    NULL;
END;

-- ***************************************************
-- Slide 38 : PL/SQL LOOP
-- ***************************************************
-- The following example illustrates how to use the LOOP statement to execute a sequence of code and EXIT statement to terminate the loop.
DECLARE
    l_counter NUMBER := 0;
BEGIN
    LOOP
        l_counter := l_counter + 1;
        IF l_counter > 3 THEN
            EXIT;
        END IF;
        dbms_output.put_line('Inside loop: ' || l_counter);
    END LOOP;
  -- control resumes here after EXIT
    dbms_output.put_line('After loop: ' || l_counter);
END;

-- ***************************************************
-- Slide 40 : PL/SQL LOOP
-- ***************************************************
DECLARE
    l_counter NUMBER := 0;
BEGIN
    LOOP
        l_counter := l_counter + 1;
        EXIT WHEN l_counter > 3;
        dbms_output.put_line('Inside loop: ' || l_counter);
    END LOOP;

  -- control resumes here after EXIT
    dbms_output.put_line('After loop: ' || l_counter);
END;

-- ***************************************************
-- Slide 41 : PL/SQL LOOP
-- ***************************************************
-- Nested loops
-- It is possible to nest a LOOP statement within another LOOP statement as shown in the following example:

DECLARE
    l_i NUMBER := 0;
    l_j NUMBER := 0;
BEGIN
    << outer_loop >> LOOP
        l_i := l_i + 1;
        EXIT outer_loop WHEN l_i > 2;
        dbms_output.put_line('Outer counter ' || l_i);
    -- reset inner counter
        l_j := 0;
        << inner_loop >> LOOP
            l_j := l_j + 1;
            EXIT inner_loop WHEN l_j > 3;
            dbms_output.put_line(' Inner counter ' || l_j);
        END LOOP inner_loop;

    END LOOP outer_loop;
END;

-- ***************************************************
-- Slide 43 : PL/SQL FOR LOOP
-- ***************************************************
-- In this example, the loop index is l_counter, lower_bound is one, and upper_bound is five. The loop shows a list of integers from 1 to 5.
BEGIN
    FOR l_counter IN 1..5 LOOP
        dbms_output.put_line(l_counter);
    END LOOP;
END;

-- ***************************************************
-- Slide 43 : PL/SQL FOR LOOP
-- ***************************************************
-- Reverse For Loop
BEGIN
    FOR l_counter IN REVERSE 1..3 LOOP
        dbms_output.put_line(l_counter);
    END LOOP;
END;

-- ***************************************************
-- Slide 47 : PL/SQL WHILE Loop
-- ***************************************************
-- A) Simple WHILE loop example
-- The following example illustrates how to use the WHILE loop statement:
DECLARE
    n_counter NUMBER := 1;
BEGIN
    WHILE n_counter <= 5 LOOP
        dbms_output.put_line('Counter : ' || n_counter);
        n_counter := n_counter + 1;
    END LOOP;
END;

-- ***************************************************
-- Slide 48 : PL/SQL WHILE Loop
-- ***************************************************
-- The following example is the same as the one above except that it has an additional EXITWHEN statement.
DECLARE
    n_counter NUMBER := 1;
BEGIN
    WHILE n_counter <= 5 LOOP
        dbms_output.put_line('Counter : ' || n_counter);
        n_counter := n_counter + 1;
        EXIT WHEN n_counter = 3;
    END LOOP;
END;

-- ***************************************************
-- Slide 50 : PL/SQL CONTINUE
-- ***************************************************
-- The following is a simple example of using the CONTINUE statement to skip over loop body execution for odd numbers:

BEGIN
    FOR n_index IN 1..10 LOOP
    -- skip odd numbers
        IF MOD(
              n_index,
              2
           ) = 1 THEN
            CONTINUE;
        END IF;
        dbms_output.put_line(n_index);
    END LOOP;
END;

-- ***************************************************
-- Slide 52 : PL/SQL CONTINUE
-- ***************************************************

BEGIN
    FOR n_index IN 1..10 LOOP
    -- skip even numbers
        CONTINUE WHEN MOD(
                         n_index,
                         2
                      ) = 0;
        dbms_output.put_line(n_index);
    END LOOP;
END;

-- ***************************************************
-- Slide 55 : PL/SQL SELECT INTO
-- ***************************************************
-- The following example uses a SELECT INTO statement to get the name of a customer based on the customer id, which is the primary key of the customers table.

DECLARE
    l_customer_name customers.name%TYPE;
BEGIN
  -- get name of the customer 100 and assign it to l_customer_name
    SELECT
        name
    INTO l_customer_name
    FROM
        customers
    WHERE
        customer_id = 100;
  -- show the customer name
    dbms_output.put_line(l_customer_name);
END;

-- ***************************************************
-- Slide 56 : PL/SQL SELECT INTO
-- ***************************************************
-- The following example fetches the entire row from the customers table for a specific customer ID:
DECLARE
    r_customer customers%rowtype;
BEGIN
  -- get the information of the customer 100
    SELECT
        *
    INTO r_customer
    FROM
        customers
    WHERE
        customer_id = 100;
  -- show the customer info
    dbms_output.put_line(r_customer.name
                         || ', website: '
                         || r_customer.website);
END;

-- ***************************************************
-- Slide 60 : PL/SQL Exception
-- ***************************************************
DECLARE
    l_name        customers.name%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    -- get the customer name by id
    SELECT
        name
    INTO l_name
    FROM
        customers
    WHERE
        customer_id = l_customer_id;

    -- show the customer name   
    dbms_output.put_line('Customer name is ' || l_name);
END;

-- ***************************************************
-- Slide 61 : PL/SQL Exception
-- ***************************************************
-- To issue a more meaningful message, you can add an exception-handling section as follows:
DECLARE
    l_name        customers.name%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    -- get the customer
    SELECT
        name
    INTO l_name
    FROM
        customers
    WHERE
        customer_id = l_customer_id;
    
    -- show the customer name   
    dbms_output.put_line('customer name is ' || l_name);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Customer '
                             || l_customer_id
                             || ' does not exist');
END;

-- ***************************************************
-- Slide 63 : PL/SQL Exception
-- ***************************************************

DECLARE
    l_name        customers.name%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
BEGIN
    -- get the customer
    SELECT
        name
    INTO l_name
    FROM
        customers
    WHERE
        customer_id > l_customer_id;
    
    -- show the customer name   
    dbms_output.put_line('Customer name is ' || l_name);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Customer '
                             || l_customer_id
                             || ' does not exist');
    WHEN too_many_rows THEN
        dbms_output.put_line('The database returns more than one customer');
END;

-- ***************************************************
-- Slide 68 : PL/SQL Raise Exceptions 
-- ***************************************************

DECLARE
    e_credit_too_high EXCEPTION;
    PRAGMA exception_init ( e_credit_too_high, -20001 );
    l_max_credit  customers.credit_limit%TYPE;
    l_customer_id customers.customer_id%TYPE := &customer_id;
    l_credit      customers.credit_limit%TYPE := &credit_limit;
BEGIN
    -- get the meax credit limit
    SELECT
        MAX(credit_limit)
    INTO l_max_credit
    FROM
        customers;
    
    -- check if input credit is greater than the max credit
    IF l_credit > l_max_credit THEN 
        -- RAISE e_credit_too_high;
        raise_application_error(
                               -20001,
                               'Credit is too high'
        );
    END IF;
    
    -- if not, update credit limit
    UPDATE customers
    SET
        credit_limit = l_credit
    WHERE
        customer_id = l_customer_id;

    COMMIT;
END;
/

-- Here is the output if you enter customer id 100 and credit limit 20000:
-- ***************************************************
-- Slide 71 : PL/SQL Exception Propagation 
-- ***************************************************
DECLARE
    e1 EXCEPTION;
    PRAGMA exception_init ( e1, -20001 );
    e2 EXCEPTION;
    PRAGMA exception_init ( e2, -20002 );
    e3 EXCEPTION;
    PRAGMA exception_init ( e2, -20003 );
    l_input NUMBER := &input_number;
BEGIN
    -- inner block
    BEGIN
        IF l_input = 1 THEN
            raise_application_error(
                                   -20001,
                                   'Exception: the input number is 1'
            );
        ELSIF l_input = 2 THEN
            raise_application_error(
                                   -20002,
                                   'Exception: the input number is 2'
            );
        ELSE
            raise_application_error(
                                   -20003,
                                   'Exception: the input number is not 1 or 2'
            );
        END IF;
    -- exception handling of the inner block
    EXCEPTION
        WHEN e1 THEN
            dbms_output.put_line('Handle exception when the input number is 1');
    END;
    -- exception handling of the outer block
EXCEPTION
    WHEN e2 THEN
        dbms_output.put_line('Handle exception when the input number is 2');
END;
/

-- ***************************************************
-- Slide 76 : Handling Other Unhandled Exceptions
-- ***************************************************
DECLARE
    l_code     NUMBER;
    r_customer customers%rowtype;
BEGIN
    SELECT
        *
    INTO r_customer
    FROM
        customers;

EXCEPTION
    WHEN OTHERS THEN
        l_code := sqlcode;
        dbms_output.put_line('Error code:' || l_code);
END;
/

-- ***************************************************
-- Slide 78 : Handling Other Unhandled Exceptions
-- ***************************************************
DECLARE
    l_msg      VARCHAR2(255);
    r_customer customers%rowtype;
BEGIN
    SELECT
        *
    INTO r_customer
    FROM
        customers;

EXCEPTION
    WHEN OTHERS THEN
        l_msg := sqlerrm;
        dbms_output.put_line(l_msg);
END;
/

-- Using SQLCODE and SQLERRM functions example
-- The following example inserts a new contact into the contacts table in the sample database. It has an exception handler in the WHERE OTHERS  clause of  the exception handling section.
DECLARE
    l_first_name  contacts.first_name%TYPE := 'Flor';
    l_last_name   contacts.last_name%TYPE := 'Stone';
    l_email       contacts.email%TYPE := 'flor.stone@raytheon.com';
    l_phone       contacts.phone%TYPE := '+1 317 123 4105';
    l_customer_id contacts.customer_id%TYPE := -1;
BEGIN
    -- insert a new contact
    INSERT INTO contacts (
        first_name,
        last_name,
        email,
        phone,
        customer_id
    ) VALUES (
        l_first_name,
        l_last_name,
        l_email,
        l_phone,
        l_customer_id
    );

EXCEPTION
    WHEN OTHERS THEN
        DECLARE
            l_error PLS_INTEGER := sqlcode;
            l_msg   VARCHAR2(255) := sqlerrm;
        BEGIN
            CASE l_error
                WHEN -1 THEN
                    -- duplicate email
                    dbms_output.put_line('duplicate email found ' || l_email);
                    dbms_output.put_line(l_msg);
                WHEN -2291 THEN
                    -- parent key not found
                    dbms_output.put_line('Invalid customer id ' || l_customer_id);
                    dbms_output.put_line(l_msg);
            END CASE;
                -- reraise the current exception
            RAISE;
        END;
END;
/

-- ***************************************************
-- Slide 85 : PL/SQL Record
-- ***************************************************
DECLARE
  -- define a record type
    TYPE r_employee_details_t IS RECORD (
        employee_id employee_details.employee_id%TYPE,
        first_name  employee_details.first_name%TYPE,
        last_name   employee_details.last_name%TYPE
    );
  -- declare a record
    r_employee_details r_employee_details_t;
BEGIN
    SELECT
        employee_id,
        first_name,
        last_name
    INTO r_employee_details
    FROM
        employee_details
    WHERE
        employee_id = 101;

    dbms_output.put_line(r_employee_details.employee_id);
    dbms_output.put_line(r_employee_details.first_name);
    dbms_output.put_line(r_employee_details.last_name);
END;
/


-- ***************************************************
-- Slide 97 : PL/SQL Cursor
-- ***************************************************

DECLARE
    CURSOR c_employee IS
    SELECT
        *
    FROM
        employee;

    r_employee c_employee%rowtype;
BEGIN
	-- open the cursor if it is not open
    IF NOT c_employee%isopen THEN
        OPEN c_employee;
    END IF;
	
	-- fetch data from curso into the rowtype variable
    FETCH c_employee INTO r_employee;
	
	-- keep fetching until no more records are found
    WHILE c_employee%found LOOP
        dbms_output.put_line('Just fetched record number ' || to_char(c_employee%rowcount));
		-- fetch data from curso into the rowtype variable
        FETCH c_employee INTO r_employee;
    END LOOP;

END;
/

DECLARE
    CURSOR c_employee IS
    SELECT
        *
    FROM
        employee;

    r_employee c_employee%rowtype;
BEGIN
	-- open the cursor if it is not open
    IF NOT c_employee%isopen THEN
        OPEN c_employee;
    END IF;
	
	-- fetch data from curso into the rowtype variable
    FETCH c_employee INTO r_employee;
	
	-- keep fetching until no more records are found
    WHILE c_employee%found LOOP
		-- DBMS_OUTPUT.put_line('Just fetched record number '|| to_char(c_employee%ROWCOUNT));
        dbms_output.put_line(r_employee.id);
		-- fetch data from curso into the rowtype variable
        FETCH c_employee INTO r_employee;
    END LOOP;

END;
/




-- ***************************************************
-- Slide 99 : PL/SQL Cursor
-- ***************************************************




CREATE TABLE employee (
    id          VARCHAR2(4 BYTE) NOT NULL,
    first_name  VARCHAR2(10 BYTE),
    last_name   VARCHAR2(10 BYTE),
    start_date  DATE,
    end_date    DATE,
    salary      NUMBER(8, 2),
    city        VARCHAR2(10 BYTE),
    description VARCHAR2(15 BYTE)
);

-- prepare data
INSERT INTO employee (
    id,
    first_name,
    last_name,
    start_date,
    end_date,
    salary,
    city,
    description
) VALUES (
    '01',
    'Jason',
    'Martin',
    TO_DATE('19960725', 'YYYYMMDD'),
    TO_DATE('20060725', 'YYYYMMDD'),
    1234.56,
    'Toronto',
    'Programmer'
);

INSERT INTO employee (
    id,
    first_name,
    last_name,
    start_date,
    end_date,
    salary,
    city,
    description
) VALUES (
    '02',
    'Alison',
    'Mathews',
    TO_DATE('19760321', 'YYYYMMDD'),
    TO_DATE('19860221', 'YYYYMMDD'),
    6661.78,
    'Vancouver',
    'Tester'
);

INSERT INTO employee (
    id,
    first_name,
    last_name,
    start_date,
    end_date,
    salary,
    city,
    description
) VALUES (
    '03',
    'James',
    'Smith',
    TO_DATE('19781212', 'YYYYMMDD'),
    TO_DATE('19900315', 'YYYYMMDD'),
    6544.78,
    'Vancouver',
    'Tester'
);

INSERT INTO employee (
    id,
    first_name,
    last_name,
    start_date,
    end_date,
    salary,
    city,
    description
) VALUES (
    '04',
    'Celia',
    'Rice',
    TO_DATE('19821024', 'YYYYMMDD'),
    TO_DATE('19990421', 'YYYYMMDD'),
    2344.78,
    'Vancouver',
    'Manager'
);

INSERT INTO employee (
    id,
    first_name,
    last_name,
    start_date,
    end_date,
    salary,
    city,
    description
) VALUES (
    '05',
    'Robert',
    'Black',
    TO_DATE('19840115', 'YYYYMMDD'),
    TO_DATE('19980808', 'YYYYMMDD'),
    2334.78,
    'Vancouver',
    'Tester'
);

INSERT INTO employee (
    id,
    first_name,
    last_name,
    start_date,
    end_date,
    salary,
    city,
    description
) VALUES (
    '06',
    'Linda',
    'Green',
    TO_DATE('19870730', 'YYYYMMDD'),
    TO_DATE('19960104', 'YYYYMMDD'),
    4322.78,
    'New York',
    'Tester'
);

INSERT INTO employee (
    id,
    first_name,
    last_name,
    start_date,
    end_date,
    salary,
    city,
    description
) VALUES (
    '07',
    'David',
    'Larry',
    TO_DATE('19901231', 'YYYYMMDD'),
    TO_DATE('19980212', 'YYYYMMDD'),
    7897.78,
    'New York',
    'Manager'
);

INSERT INTO employee (
    id,
    first_name,
    last_name,
    start_date,
    end_date,
    salary,
    city,
    description
) VALUES (
    '08',
    'James',
    'Cat',
    TO_DATE('19960917', 'YYYYMMDD'),
    TO_DATE('20020415', 'YYYYMMDD'),
    1232.78,
    'Vancouver',
    'Tester'
);

SELECT
    *
FROM
    employee;

DECLARE
    l_employeeid employee.id%TYPE;
    l_firstname  employee.first_name%TYPE;
    l_lastname   employee.last_name%TYPE;
    l_city       employee.city%TYPE := 'Vancouver';
    CURSOR c_employee IS
    SELECT
        id,
        first_name,
        last_name
    FROM
        employee
    WHERE
        city = l_city;

BEGIN
    OPEN c_employee;
    LOOP
        FETCH c_employee INTO
            l_employeeid,
            l_firstname,
            l_lastname;
        dbms_output.put_line(l_employeeid);
        dbms_output.put_line(l_firstname);
        dbms_output.put_line(l_lastname);
        EXIT WHEN c_employee%notfound;
    END LOOP;

    CLOSE c_employee;
END;
/

DECLARE
    CURSOR c_employee IS
    SELECT
        id,
        first_name,
        last_name
    FROM
        employee;

BEGIN
    FOR r_employee IN c_employee LOOP
        dbms_output.put_line(r_employee.id);
        dbms_output.put_line(r_employee.first_name);
        dbms_output.put_line(r_employee.last_name);
    END LOOP;
END;
/

-- ***************************************************
-- Slide 101 : PL/SQL Cursor with Parameters
-- ***************************************************

DECLARE
    CURSOR c_employee (
        p_description employee.description%TYPE
    ) IS
    SELECT
        *
    FROM
        employee
    WHERE
        description = p_description;

    r_employee c_employee%rowtype;
BEGIN
	-- open the cursor if it is not open
    IF NOT c_employee%isopen THEN
        OPEN c_employee('&description');
    END IF;
	
	-- fetch data from curso into the rowtype variable
    FETCH c_employee INTO r_employee;
	
	-- keep fetching until no more records are found
    WHILE c_employee%found LOOP
		-- DBMS_OUTPUT.put_line('Just fetched record number '|| to_char(c_employee%ROWCOUNT));
        dbms_output.put_line(r_employee.id);
		-- fetch data from curso into the rowtype variable
        FETCH c_employee INTO r_employee;
    END LOOP;

END;
/


-- ***************************************************
-- Slide 101 :PL/SQL Cursor Variables with REF CURSOR
-- ***************************************************


CREATE TABLE product (
    product_id          NUMBER(4) NOT NULL,
    product_description VARCHAR2(20) NOT NULL
);

INSERT INTO product VALUES (
    1,
    'Java'
);

INSERT INTO product VALUES (
    2,
    'Oracle'
);

INSERT INTO product VALUES (
    3,
    'C#'
);

INSERT INTO product VALUES (
    4,
    'Javascript'
);

INSERT INTO product VALUES (
    5,
    'Python'
);

CREATE OR REPLACE FUNCTION getallproducts RETURN SYS_REFCURSOR IS
    refcursorvalue SYS_REFCURSOR;
BEGIN
    OPEN refcursorvalue FOR SELECT * FROM product;
    RETURN ( refcursorvalue );
END;
/

DECLARE
    refcursorvalue SYS_REFCURSOR;
    myrecord       product%rowtype;
BEGIN
    refcursorvalue := getallproducts;
    LOOP
        FETCH refcursorvalue INTO myrecord;
        EXIT WHEN refcursorvalue%notfound;
        dbms_output.put_line(to_char(myrecord.product_id) || ' '|| myrecord.product_description);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(to_char(sqlcode)|| ' '|| sqlerrm);
END;
/


-- ***************************************************
-- Slide 109 :PL/SQL Procedure
-- ***************************************************


CREATE OR REPLACE PROCEDURE print_employee(in_employee_id NUMBER )
IS
  r_employee employee_details%ROWTYPE;
BEGIN
  -- get employee based on employee id
  SELECT *
  INTO r_employee 
  FROM employee_details
  WHERE employee_id = in_employee_id;

  -- print out employee's information
  dbms_output.put_line( r_employee.first_name || ' ' || r_employee.last_name || '<' || r_employee.salary ||'>' );
EXCEPTION
   WHEN OTHERS THEN
      dbms_output.put_line( SQLERRM );
END;
/

EXEC print_employee(1);

-- ***************************************************
-- Slide 111 :PL/SQL Procedure
-- ***************************************************
CREATE OR REPLACE PROCEDURE get_employee_by_salary(
    min_salary NUMBER
)
AS 
    c_employee SYS_REFCURSOR;
BEGIN
    -- open the cursor
    OPEN c_employee FOR
        SELECT employee_id, salary, first_name
        FROM employee_details
        WHERE salary > min_salary 
        ORDER BY salary;
    -- return the result set
    dbms_sql.return_result(c_employee);
END;
/
SELECT * FROM employee_details;
-- To test the stored procedure, you can execute it as follows:
EXEC get_employee_by_salary(500);

CREATE OR REPLACE PROCEDURE get_employees(
    page_no NUMBER, 
    page_size NUMBER
)
AS
    c_employees SYS_REFCURSOR;
    c_total_row SYS_REFCURSOR;
BEGIN
    -- return the total of employees
    OPEN c_total_row FOR
        SELECT COUNT(*)
        FROM employee_details;
    
    dbms_sql.return_result(c_total_row);
    
    -- return the customers 
    OPEN c_employees FOR
        SELECT employee_id, first_name FROM employee_details
        ORDER BY first_name
        OFFSET page_size * (page_no - 1) ROWS
        FETCH NEXT page_size ROWS ONLY;
        
    dbms_sql.return_result(c_employees);    
END;
/

EXEC GET_EMPLOYEES(1,5);

-- ***************************************************
-- Slide 116 :PL/SQL Procedure
-- ***************************************************

CREATE OR REPLACE FUNCTION get_total_salary(in_designation VARCHAR) 
RETURN NUMBER
IS
    l_total_salary NUMBER := 0;
BEGIN
    -- get total sales
    SELECT SUM(salary)
    INTO l_total_salary 
    FROM employee_details
    WHERE designation = in_designation;
    
    -- return the total sales
    RETURN l_total_salary ;
END;
/

-- ***************************************************
-- Slide 117 :PL/SQL Procedure
-- ***************************************************

-- Calling a PL/SQL function
-- 1) in an assignment statement:
DECLARE
    l_total_salary_manager NUMBER := 0;
BEGIN
    l_total_salary_manager := get_total_salary ('manager');
    DBMS_OUTPUT.PUT_LINE('Total Salary of Managers: ' || l_total_salary_manager);
END;
/

-- 2) in a Boolean expression
BEGIN
    IF get_total_salary ('manager') > 2000 THEN
        DBMS_OUTPUT.PUT_LINE('Your message');
    END IF;
END;
/

-- 3) in an SQL statement
SELECT
    get_total_salary('manager')
FROM
    dual;

-- ***************************************************
-- Slide 122 :PL/SQL Procedure
-- ***************************************************

-- First, create a new table for recording the UPDATE and DELETE events:
CREATE TABLE audits (
      audit_id         NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
      table_name       VARCHAR2(255),
      transaction_name VARCHAR2(10),
      by_user          VARCHAR2(30),
      transaction_date DATE
);

-- Second, create a new trigger associated with the employee_details table:
CREATE OR REPLACE TRIGGER employee_details_audit_trg
    AFTER 
    UPDATE OR DELETE 
    ON employee_details
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
   VALUES('EMPLOYEE_DETAILS', l_transaction, USER, SYSDATE);
END;
/

-- The following statement updates the salary of the employee 1000 to 2000.

UPDATE
   employee_details
SET
   salary = 2000
WHERE
   employee_id =1;

-- Now, check the contents of the table audits to see if the trigger was fired:
SELECT * FROM audits;


-- This DELETE statement deletes a row from the customers table.
DELETE FROM employee_details
WHERE employee_id = 1;


-- ***************************************************
-- Slide 124 :PL/SQL Procedure
-- ***************************************************
--Suppose, you want to restrict users to update salary of customers from 28th to 31st of every month 
--so that you can close the financial month.

-- To enforce this rule, you can use this statement-level trigger:
CREATE OR REPLACE TRIGGER employee_salary_trg
    BEFORE UPDATE OF salary  
    ON employee_details
DECLARE
    l_day_of_month NUMBER;
BEGIN
    -- determine the transaction type
    l_day_of_month := EXTRACT(DAY FROM sysdate);

    IF l_day_of_month BETWEEN 28 AND 31 THEN
        raise_application_error(-20100,'Cannot update employee salary from 28th to 31st');
    END IF;
END;
/

-- Testing the Oracle statement-level trigger
UPDATE 
    employee_details 
SET 
    salary = salary * 0.5 ;


CREATE OR REPLACE TRIGGER employee_update_salary_trg 
    BEFORE UPDATE OF salary
    ON employee_details
    FOR EACH ROW
    WHEN (NEW.salary > 0)
BEGIN
    -- check the credit limit
    IF :NEW.salary >= 2 * :OLD.salary THEN
        raise_application_error(-20101,'The new salary ' || :NEW.salary || 
            ' cannot increase to more than double, the current salary ' || :OLD.salary);
    END IF;
END;
/

-- Testing the trigger
-- First, find the salary of the employee id 2:
SELECT salary 
FROM employee_details 
WHERE employee_id = 2;

--Second, update the salary of the employee 10 to 5000:
UPDATE employee_details
SET salary = 5000
WHERE employee_id = 2;



SELECT ADD_MONTHS( DATE '2016-02-29', 1) FROM DUAL;

-- Return the current date and time in the session time zone
SELECT CURRENT_DATE FROM dual;

-- Return the current date and time with time zone in the session time zone
SELECT CURRENT_TIMESTAMP FROM dual;

-- Get the current database time zone
 SELECT DBTIMEZONE FROM dual;
 
 SELECT EXTRACT(YEAR FROM SYSDATE) FROM dual;
 
 SELECT LAST_DAY(DATE '2016-02-01') FROM dual;
 
 SELECT MONTHS_BETWEEN( DATE '2017-07-01', DATE '2017-01-01' ) FROM DUAL;
 
 SELECT SESSIONTIMEZONE FROM dual;
 -- Return the current system date and time of the operating system where the Oracle Database resides.
 SELECT SYSDATE FROM DUAL;
 
 SELECT TO_DATE( '01 Jan 2017', 'DD MON YYYY' ) FROM DUAL;
 
 -- varray
 DECLARE 
    TYPE v_array_type IS VARRAY(7) OF VARCHAR(20);
    v_day v_array_type := v_array_type(NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    
 BEGIN
    v_day(1) := 'Monday';
    v_day(2) := 'Tuesday';
    v_day(3) := 'Wednesday';
    v_day(4) := 'Thursday';
    v_day(5) := 'Friday';
    v_day(6) := 'Saturday';
    v_day(7) := 'Sunday';
    
    dbms_output.put_line(v_day(1));
    dbms_output.put_line(v_day(2));
    dbms_output.put_line(v_day(3));
    dbms_output.put_line(v_day(4));
    dbms_output.put_line(v_day(5));
    dbms_output.put_line(v_day(6));
    dbms_output.put_line(v_day(7));
    
    dbms_output.new_line;
    
     FOR l_counter IN 1..7 LOOP
        dbms_output.put_line(v_day(l_counter));
    END LOOP;
    
 END;
 /
 
  DECLARE 
    TYPE v_array_type IS VARRAY(7) OF VARCHAR(20);
    v_day v_array_type := v_array_type(NULL);
    
 BEGIN
    v_day(1) := 'Monday';
    v_day.EXTEND();
    v_day(2) := 'Tuesday';
    v_day.EXTEND();
    v_day(3) := 'Wednesday';
    v_day.EXTEND();
    v_day(4) := 'Thursday';
    v_day.EXTEND();
    v_day(5) := 'Friday';
    v_day.EXTEND();
    v_day(6) := 'Saturday';
    v_day.EXTEND();
    v_day(7) := 'Sunday';
    v_day.EXTEND();
    v_day(8) := 'New Day'; -- error
    
    dbms_output.put_line(v_day(1));
    dbms_output.put_line(v_day(2));
    dbms_output.put_line(v_day(3));
    dbms_output.put_line(v_day(4));
    dbms_output.put_line(v_day(5));
    dbms_output.put_line(v_day(6));
    dbms_output.put_line(v_day(7));
    
    dbms_output.new_line;
    
     FOR l_counter IN 1..7 LOOP
        dbms_output.put_line(v_day(l_counter));
    END LOOP;
    
 END;
 /
 
 -- Collection methods
 -- Limit
 -- Count
 -- First
 -- Last
 -- Trim(n)
 -- delete
 -- extend(n)
 -- prior(n)
 -- next(n)
   DECLARE 
    TYPE v_array_type IS VARRAY(7) OF VARCHAR(20);
    v_day v_array_type := v_array_type(NULL);
    
 BEGIN
    dbms_output.put_line(v_day.COUNT);
    v_day(1) := 'Monday';
    v_day.EXTEND();
    v_day(2) := 'Tuesday';
    v_day.EXTEND();
    v_day(3) := 'Wednesday';
    v_day.EXTEND();
    v_day(4) := 'Thursday';
    v_day.EXTEND();
    v_day(5) := 'Friday';
    v_day.EXTEND();
    v_day(6) := 'Saturday';
    v_day.EXTEND();
    v_day(7) := 'Sunday';
    
    dbms_output.put_line(v_day.COUNT);
    dbms_output.put_line(v_day(1));
    dbms_output.put_line(v_day(2));
    dbms_output.put_line(v_day(3));
    dbms_output.put_line(v_day(4));
    dbms_output.put_line(v_day(5));
    dbms_output.put_line(v_day(6));
    dbms_output.put_line(v_day(7));
    
    dbms_output.new_line;
    
     FOR l_counter IN 1..v_day.LIMIT  LOOP
        dbms_output.put_line(v_day(l_counter));
    END LOOP;
    
 END;
 /
 
 -- Nested Table example
 DECLARE 
    -- TYPE v_array_type IS VARRAY(7) OF VARCHAR(20);
    TYPE nested_table IS TABLE OF VARCHAR(20);
    v_day nested_table := nested_table(NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    
 BEGIN
    v_day(1) := 'Monday';
    v_day(2) := 'Tuesday';
    v_day(3) := 'Wednesday';
    v_day(4) := 'Thursday';
    v_day(5) := 'Friday';
    v_day(6) := 'Saturday';
    v_day(7) := 'Sunday';
    
    dbms_output.put_line(v_day(1));
    dbms_output.put_line(v_day(2));
    dbms_output.put_line(v_day(3));
    dbms_output.put_line(v_day(4));
    dbms_output.put_line(v_day(5));
    dbms_output.put_line(v_day(6));
    dbms_output.put_line(v_day(7));
    
    dbms_output.new_line;
    
     FOR l_counter IN 1..7 LOOP
        dbms_output.put_line(v_day(l_counter));
    END LOOP;
    
 END;
 /
 
 
 DECLARE 
    -- TYPE v_array_type IS VARRAY(7) OF VARCHAR(20);
    TYPE nested_table IS TABLE OF VARCHAR(20);
    v_day nested_table;
    
 BEGIN
    v_day(1) := 'Monday';
    v_day(2) := 'Tuesday';
    v_day(3) := 'Wednesday';
    v_day(4) := 'Thursday';
    v_day(5) := 'Friday';
    v_day(6) := 'Saturday';
    v_day(7) := 'Sunday';
    
    dbms_output.put_line(v_day(1));
    dbms_output.put_line(v_day(2));
    dbms_output.put_line(v_day(3));
    dbms_output.put_line(v_day(4));
    dbms_output.put_line(v_day(5));
    dbms_output.put_line(v_day(6));
    dbms_output.put_line(v_day(7));
    
    dbms_output.new_line;
    
     FOR l_counter IN 1..7 LOOP
        dbms_output.put_line(v_day(l_counter));
    END LOOP;
    
 END;
 /
 
 -- Bulk Collect
 DECLARE
    CURSOR c_employee IS
    SELECT
        first_name
    FROM
        employee;

    TYPE names_table IS TABLE OF VARCHAR2(20);
    l_first_name names_table;
BEGIN
	-- open the cursor if it is not open
    IF NOT c_employee%isopen THEN
        OPEN c_employee;
    END IF;
	
	-- fetch data from curso into the rowtype variable
    FETCH c_employee BULK COLLECT INTO l_first_name;
	
	-- keep fetching until no more records are found
    FOR i IN 1 .. l_first_name.COUNT LOOP 
      dbms_output.put_line(l_first_name(i)); 
    END LOOP; 

--    WHILE c_employee%found LOOP
--        dbms_output.put_line('Just fetched record number ' || to_char(c_employee%rowcount));
--		-- fetch data from curso into the rowtype variable
--        FETCH c_employee INTO r_employee;
--    END LOOP;
END;
/
 
 