-- Question 2: Departmental Spending Overview Scenario: 
-- Your company wants to analyze spending across different departments on various projects. You need to identify departments that have spent a significant amount.

-- Step 1: Create a new database
-- CREATE DATABASE CompanyDB;
-- USE CompanyDB;

-- -- Step 3: Create Departments table
-- CREATE TABLE Departments (
--     dept_id INT PRIMARY KEY,
--     dept_name VARCHAR(100)
-- );

-- -- Insert sample data into Departments
-- INSERT INTO Departments (dept_id, dept_name) VALUES
-- (1, 'Engineering'),
-- (2, 'Marketing'),
-- (3, 'HR'),
-- (4, 'Sales');

-- -- Step 4: Create Projects table
-- CREATE TABLE Projects (
--     project_id INT PRIMARY KEY,
--     project_name VARCHAR(100),
--     dept_id INT,
--     FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
-- );

-- -- Insert sample data into Projects
-- INSERT INTO Projects (project_id, project_name, dept_id) VALUES
-- (101, 'Alpha', 1),
-- (102, 'Beta', 1),
-- (103, 'Gamma', 2),
-- (104, 'Delta', 3),
-- (105, 'Epsilon', 1);

-- -- Step 5: Create Expenses table
-- CREATE TABLE Expenses (
--     expense_id INT PRIMARY KEY,
--     project_id INT,
--     amount DECIMAL(10,2),
--     expense_date DATE,
--     FOREIGN KEY (project_id) REFERENCES Projects(project_id)
-- );

-- -- Insert sample data into Expenses
-- INSERT INTO Expenses (expense_id, project_id, amount, expense_date) VALUES
-- (1, 101, 2000.00, '2024-03-01'),
-- (2, 102, 3500.00, '2024-03-05'),
-- (3, 103, 1000.00, '2024-03-10'),
-- (4, 101, 1500.00, '2024-03-12'),
-- (5, 104, 500.00, '2024-03-15'),
-- (6, 105, 2000.00, '2024-03-18'),
-- (7, 103, 2000.00, '2024-03-20');
select sub.dept_name as department,sum(e.amount) as total_amount from 
(select p.dept_id,p.project_id,d.dept_name from projects as p left join departments d on p.dept_id=d.dept_id) as sub
left join expenses as e on sub.project_id=e.project_id
group by sub.dept_id 
having total_amount>5000 
order by total_amount desc,department asc;
