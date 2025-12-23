create database tests;
use tests;

CREATE TABLE employee_salary (
    emp_id        VARCHAR(10) PRIMARY KEY,
    emp_name      VARCHAR(50) NOT NULL,
    base_salary   DECIMAL(10,2) NOT NULL,
    month_1       DECIMAL(10,2),
    month_2       DECIMAL(10,2)
    
);
INSERT INTO employee_salary
(emp_id, emp_name, base_salary, month_1, month_2)
VALUES
('E101', 'Rahul Sharma', 30000, 31500,45000),
('E102', 'Priya Verma', 40000, 42000,50000),
('E103', 'Amit Singh', 35000, 36750,55000),
('E104', 'Neha Gupta', 50000, 52500,45000),
('E105', 'Ankit Jain', 28000, 29400,43000);

select * from employee_salary;


create table emp_sal_year( 
      emp_id varchar(20) primary key , 
      emp_name varchar(20) not null,
      pre_year decimal(10,2) not null,
      current_year decimal(10,2) not null);
      
insert into emp_sal_year ( emp_id , emp_name , prev_year , current_year)
values ('E101', 'Rahul Sharma', 420000, 480000),
('E102', 'Priya Verma',  500000, 560000),
('E103', 'Amit Singh',  450000, 495000),
('E104', 'Neha Gupta',  600000, 690000),
('E105', 'Ankit Jain',  360000, 400000);

DROP TABLE IF EXISTS employee_salary_yearly;

CREATE TABLE employee_salary_yearly (
    emp_id              VARCHAR(10),
    emp_name            VARCHAR(50),
    department          VARCHAR(30),
    year int ,
    salary decimal(10,2)
);

    INSERT INTO employee_salary_yearly  (emp_id,emp_name,department,year,
    salary)VALUES
('E101', 'Rahul Sharma', 'IT', 2013, 480000),
('E101', 'Rahul Sharma', 'IT', 2014, 500000),
('E102', 'Priya Verma', 'HR', 2013, 560000),
('E102', 'Priya Verma', 'HR', 2014, 660000),
('E103', 'Amit Singh', 'Finance', 2013, 495000),
('E103', 'Amit Singh', 'Finance', 2014, 556000),
('E104', 'Neha Gupta', 'Marketing', 2013, 690000),
('E104', 'Neha Gupta', 'Marketing', 2014, 760000),
('E105', 'Ankit Jain', 'Operations', 2013, 400000),
('E105', 'Ankit Jain', 'Operations', 2014, 560000);


select * from employee_salary_yearly;


 