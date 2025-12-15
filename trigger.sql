--- making trigger 
cretae table hr.emp_copy
as select employee_id, first_name from hr.employees where empployee_id >105
select * from emp.copy;


create or replace trigger insert_print_mesage
before insert in imp_copy 
for each row 
begin 
dbms.output.put_line('a new raw is being inserted ')
end ; 


