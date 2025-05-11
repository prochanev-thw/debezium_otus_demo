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

