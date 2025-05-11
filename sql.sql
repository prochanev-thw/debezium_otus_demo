CREATE TABLE example_table (
    name VARCHAR(100),
    age INTEGER,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO example_table (name, age) VALUES
('Петр Петров', 25),
('Анна Сидорова', 28),
('Мария Кузнецова', 35);


select * from example_table


CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,  -- Primary key that won't auto-generate
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2)
);

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, salary)
VALUES (101, 'John', 'Doe', 'john.doe@example.com', '2023-01-15', 75000.00);

INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, salary)
VALUES (102, 'Jane', 'Smith', 'jane.smith@example.com', '2023-03-22', 82000.00);


delete from employees where employee_id = 101;


update employees set employee_id = 103 where employee_id = 102;
update employees set first_name = 'Otus' where employee_id = 101;

ALTER TABLE employees REPLICA IDENTITY FULL;


select c.relname , CASE c.relreplident
    WHEN 'd' THEN 'DEFAULT'
    WHEN 'n' THEN 'NOTHING'
    WHEN 'f' THEN 'FULL'
    WHEN 'i' THEN 'USING INDEX'
    end AS replica_identity
    from pg_class c
    where c.relname in('example_table', 'employees')

