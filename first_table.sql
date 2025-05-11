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