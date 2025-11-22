create database deep3;
use deep3;
create table employees(
     emp_id int ,
     emp_name varchar(30),
     department varchar(30),
     salary int,
     joining_date  timestamp ,
     manager_id int
     );
insert into employees( emp_id , emp_name , department , salary , joining_date ,manager_id )
values ( 1 , 'Alice Johnsan' , 'IT' , '75000 ', '2018-06-15', 5 ),
     ( 2 , 'Bob Smith' , 'HR' , 60000 , '2018-08-10', 6 ),
     ( 3 , 'Charlie brown' , 'Finance' , 82000 , '2017-02-25' , 5 ),
     ( 4 , 'David Williams' , 'IT' , 72000 , '2020-11-20' , 5 ),
     ( 5 , 'Emma wilson' , 'HR' , 95000 , '2015-09-05', null ),
     ( 6 , 'franklin Adams' , 'IT' , 88000 , '2016-04-30', null ),
     ( 7 , 'Grace kely' , 'Finance' , 91000 , '2018-03-12', 6 );
     
create table projects(
     project_id int ,
     emp_id int,
     project_name varchar(30),
     start_date  timestamp ,
	 end_date  timestamp ,
     rating int
     );
     
insert into projects ( project_id , emp_id , project_name , start_date , end_date , rating )
values ( 101 , 1,  'AI empletation' , '2021-01-10', '2021-12-15', 5 ),
     ( 102 , 2 ,'Recrutement analysis' , '2021-03-01' ,'2021-09-30', 4 ),
     ( 103 , 3, 'Budget forcasting' , '2020-07-20', '2021-06-30', 3 ),
     ( 104 , 4 ,'Cloud migration' , '2021-06-15' , '2022-05-20', 4 ),
     ( 105 , 1 ,'Cybersecurity Audi' ,'2022-01-01', '2022-11-30', 4 ),
     ( 106 , 5 ,'System upgrade' , '2019-05-10', '2018-03-12', 6 ),
	 ( 107 , 6 ,'employee traning' ,'2020-01-15', '2021-12-30 ', 3 ),
     ( 108 , 7 ,'financial risk model' , '2019-10-10', '2021-09-30', 5 );
 select * from employees; 
 -- 1
 select emp_name from employees where salary = (select min(salary) from employees);
 
-- 2
select department from employees where department in (select  department , max(avg(salary)) 
from employees group by department); 

-- 3
select m.emp_name as manager from employees as e join employees as m on e.manager_id = m.emp_id 
where emp_name = 'Alice Johnson';

-- 4
with total_projects as ( select emp_id,
                   count(project_id)  as total from projects group by emp_id )
select emp_id , total from total_projects order by total desc;

-- 5
select emo_id , sum(salary) over ( partition by joining_date ) from employees ; 

-- 6

select count(emp_id) from employees where year(joining_date)>2018;

-- 7
select emp_id , count(project_id) from projects group by emp_id ;

-- 8
with CTE as ( select
				emp_name , department , avg(salary) over (partition by department) as sal from 
                employees )
select emp_name , department from CTE where salary > sal ;

-- 9
select emp_id , emp_name , department from employees where manager_id = null ;