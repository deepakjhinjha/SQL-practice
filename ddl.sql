 create database office ;
  use  office ;
  
create table employee ( 
         emp_id varchar(25) primary key,
         emp_name varchar(25),
         manager_id varchar(25),
         office_no decimal(10,2),
         gender varchar(25),
         joining timestamp ,
         salary decimal(10,2));

create table department (
		 dep_id varchar(20) primary key ,
         dep_name varchar(25) ,
         office_id decimal(10,2),
         emp_id varchar(25));
         
create table office (
	     office_id varchar(20) primary key ,
         emp_name varchar(20) ,
         dep_name varchar(20) );
         
INSERT INTO employee 
(emp_id, emp_name, manager_id, office_no, gender, joining, salary)
VALUES
('E001', 'Amit',   NULL,   101.01, 'Male',   '2022-01-10 09:30:00', 55000),
('E002', 'Riya',   'E001', 101.01, 'Female', '2022-03-15 10:00:00', 48000),
('E003', 'Rahul',  'E001', 102.01, 'Male',   '2021-07-20 09:00:00', 60000),
('E004', 'Sneha',  'E003', 102.01, 'Female', '2023-01-05 11:00:00', 45000),
('E005', 'Karan',  'E003', 103.01, 'Male',   '2022-11-12 10:15:00', 52000),
('E006', 'Pooja',  'E002', 103.01, 'Female', '2023-04-18 09:45:00', 47000),
('E007', 'Arjun',  'E001', 104.01, 'Male',   '2020-08-25 08:50:00', 70000),
('E008', 'Neha',   'E007', 104.01, 'Female', '2021-02-14 10:30:00', 50000),
('E009', 'Vikas',  'E007', 105.01, 'Male',   '2023-06-01 09:20:00', 46000),
('E010', 'Anjali', 'E002', 105.01, 'Female', '2022-09-09 11:10:00', 49000);



INSERT INTO department
(dep_id, dep_name, office_id, emp_id)
VALUES
('D01', 'HR',        101.01, 'E002'),
('D02', 'Finance',   101.01, 'E001'),
('D03', 'IT',        102.01, 'E003'),
('D04', 'Marketing', 102.01, 'E004'),
('D05', 'Sales',     103.01, 'E005'),
('D06', 'Support',   103.01, 'E006'),
('D07', 'Admin',     104.01, 'E007'),
('D08', 'Security',  104.01, 'E008'),
('D09', 'Operations',105.01, 'E009'),
('D10', 'Logistics', 105.01, 'E010');


 INSERT INTO office
(office_id, emp_name, dep_name)
VALUES
('O01', 'Amit',   'Finance'),
('O02', 'Riya',   'HR'),
('O03', 'Rahul',  'IT'),
('O04', 'Sneha',  'Marketing'),
('O05', 'Karan',  'Sales'),
('O06', 'Pooja',  'Support'),
('O07', 'Arjun',  'Admin'),
('O08', 'Neha',   'Security'),
('O09', 'Vikas',  'Operations'),
('O10', 'Anjali', 'Logistics');
        
select * from employee;
select * from department;         
select * from office;
-- salary>50000 and employees 
select emp_name from employee where salary > 50000;
-- top 3 salary 
-- employee with is manager 
select e.emp_name , m.emp_name  as manager from employee as e left join employee as m on e.manager_id = m.emp_id;

-- salary category 
select * , 
case when salary >= 60000 then 'High'
     when salary >= 40000 then 'Mid'
     else 'Low'
end as Category 
from employee;

-- employee assigned to an department 
SELECT emp_name
FROM employee e
WHERE EXISTS (
    SELECT 45556
    FROM department d
    WHERE d.emp_id = e.emp_id
);

         