-- Aggregate functions: SUM, COUNT, AVG

SELECT departments.department_name, COUNT(employees.employee_id) AS NumberOfEmployees
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
GROUP BY departments.department_name;

-- ALTER TABLE

ALTER TABLE employees 
ADD COLUMN date_of_birth DATE;

-- ALTER TABLE to ADD CONSTRAINT

ALTER TABLE employees 
ADD CONSTRAINT fk_department 
FOREIGN KEY (department_id) REFERENCES departments(department_id);

-- BETWEEN

SELECT * FROM employees 
WHERE salary BETWEEN 30000 AND 60000;

-- CREATE INDEX

CREATE INDEX idx_last_name 
ON employees (last_name);

-- CREATE TABLE

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- DELETE

DELETE FROM employees 
WHERE employee_id = 1;

-- DISTINCT

SELECT DISTINCT department 
FROM employees;

-- DROP TABLE

DROP TABLE departments;

-- GROUP BY

SELECT department, COUNT(*) 
FROM employees 
GROUP BY department;

-- HAVING

SELECT department, COUNT(*)
FROM employees 
GROUP BY department 
HAVING COUNT(*) > 10;

-- IN

SELECT * FROM employees 
WHERE department IN ('HR', 'IT', 'Sales');

-- INSERT

INSERT INTO employees (first_name, last_name, department, salary) 
VALUES ('John', 'Doe', 'HR', 50000);

-- JOINS - combine rows from two or more tables, based on a related column
-- between them.

SELECT employees.first_name, employees.last_name, departments.department_name 
FROM employees 
JOIN departments ON employees.department_id = departments.department_id;

-- -- CROSS JOIN - returns the Cartesian product of the two tables. This means
-- -- that it will return all possible combinations of rows from the tables.

SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
CROSS JOIN departments;

-- -- FULL OUTER JOIN - returns all records when there is a match in either
-- -- left (employees) or right (departments) table records. If there is no
-- -- match, the result is NULL on the side that does not have a match.

SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
FULL OUTER JOIN departments ON employees.department_id = departments.department_id;

-- -- INNER JOIN - selects records that have matching values in both tables.

SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;

-- -- LEFT JOIN - returns all records from the left table (employees), and the 
-- -- matched records from the right table (departments). The result is NULL 
-- -- from the right side if there is no match.

SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id;

-- -- Multiple joins

SELECT employees.first_name, employees.last_name, departments.department_name, locations.location_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id
INNER JOIN locations ON departments.location_id = locations.location_id;

-- -- NATURAL JOIN - selects rows with equal values in the relevant columns.

SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
NATURAL JOIN departments;

-- -- RIGHT JOIN - returns all records from the right table (departments), and
-- -- the matched records from the left table (employees). The result is NULL
-- -- from the left side when there is no match.

SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id;

-- -- SELF JOIN - regular join but the table is joined with itself.

SELECT a.employee_id AS EmployeeID, a.first_name AS EmployeeFirstName, b.first_name AS ManagerFirstName
FROM employees a
INNER JOIN employees b ON a.manager_id = b.employee_id;

-- LIKE

SELECT * FROM employees 
WHERE first_name LIKE 'J%';

-- LIMIT

SELECT * FROM employees 
LIMIT 5;

-- ORDER BY

SELECT * FROM employees 
ORDER BY salary DESC;

-- SELECT

SELECT first_name, last_name FROM employees;

-- Subquery

SELECT first_name, last_name 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- UPDATE

UPDATE employees 
SET salary = 55000 
WHERE employee_id = 1;

-- USING - specify the column to be used for the join when the columns have the
-- same name.

SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
INNER JOIN departments USING (department_id);

-- WHERE

SELECT * FROM employees WHERE department = 'Sales';
