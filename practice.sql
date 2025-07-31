create database practice;

use practice;

create table Employee(EMPLOYEE_ID int primary key auto_increment, FIRST_NAME varchar(100), LAST_NAME varchar(100), SALARY varchar(100), JOINING_DATE varchar(100), DEPARTMENT varchar(100));

drop table Employee;

insert into Employee(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
 values 
 ('Venkatesh', 'S', '100000', '08/28/2015', 'BANKING'),
 ('Ragavi', 'P', '75000', '08/28/2015', 'BUSINESS'),
 ('Gopinath', 'C', '50000', '03/02/2016', 'PHARMA'),
 ('Dinesh', 'G', '50000', '03/02/2016', 'INSURANCE'),
 ('Saibabu', 'E', '40000', '07/08/2017', 'SOFTWARE'),
 ('Hasan', 'S', '29000', '07/08/2017', 'MANUFACTURING'),
 ('Divya', 'P', '33000', '07/08/2017', 'HEALTHCARE'),
 ('Aravindan', 'R', '40000', '07/08/2017', 'HEALTHCARE'),
 ('Sathish', 'MD', '45000', '03/02/2016', 'AUTOMOBILE'),
 ('Prasanth', 'PKP', '34000', '03/02/2016', 'INSURANCE'),
 ('Vijay', 'R', '25684', '03/02/2016', 'BUSINESS'),
 ('Sivakumar', 'K', '54789', '03/02/2016', 'SOFTWARE'); 
 
 select * from Employee;
 
 create table Incentives(EMPLOYEE_REF_ID int, INCENTIVE_DATE varchar(100), INCENTIVE_AMOUNT varchar(100), foreign key(EMPLOYEE_REF_ID) references Employee(EMPLOYEE_ID));
 
 DROP table Incentives;
 
 insert into Incentives(EMPLOYEE_REF_ID, INCENTIVE_DATE, INCENTIVE_AMOUNT)
 values
 (1, '01-FEB-16', '5000'),
 (2, '01-FEB-16', '3000'),
 (3, '01-FEB-17', '4000'),
 (1, '01-JAN-17', '4500'),
 (2, '01-JAN-17', '3500');
 
 select * from Incentives;
 
 
 -- all details from employee table
 select * from Employee;
 
 -- first and last name from employee table
 select FIRST_NAME, LAST_NAME from Employee;
 
 -- first name by using alias name
 select FIRST_NAME employee_name 
 from Employee;
 
  select FIRST_NAME as employee_name 
 from Employee;
 
 -- first name in upper case
 select upper(FIRST_NAME) from Employee;
 
 -- first name in lower case
  select lower(FIRST_NAME) from Employee;
 
 -- unique dept from employee table
 select distinct DEPARTMENT from Employee;
 
 -- first 3 char of first name
 select substring(FIRST_NAME, 1, 3) from Employee;
 
 -- postion of a from ragavi in employee table
select position('a' in FIRST_NAME)
from Employee where EMPLOYEE_ID = 2; 

-- first name after removing white space from right
select rtrim(first_name) from Employee;

-- first name after removing white space from left
select ltrim(first_name) from Employee;

-- length of first name
select length(first_name) from Employee;

-- first name after replacing a with $ from employee table
select replace(first_name, 'a', '$') from Employee;

-- first and last name as single column from employee table by '_'
select concat(first_name, '_', last_name) from Employee;

-- first name, joining year, month, date from employee table
select first_name,substring(joining_date, 7,4),substring(joining_date, 4,2),substring(joining_date, 1,2) from Employee;


-- first name ascending
select * from Employee order by first_name asc;

-- first name descending
select * from Employee order by first_name desc;

-- first name ascending and salary descending
select * from Employee order by first_name asc, salary desc;

-- details of dinesh
-- select * from Employee where EMPLOYEE_ID = 4;
select * from Employee where first_name = 'Dinesh';

-- details of dinesh and roy
select * from Employee where first_name = 'Dinesh' or 'Roy';

-- details except dinesh and roy
select * from Employee where first_name <> 'Dinesh' or 'Roy';

-- first name 's'
select * from Employee where first_name like 's%'; 

-- first name  contains 'v'
-- select * from Employee where first_name like 'v%'; 
-- select locate('v', first_name) from Employee;
SELECT * FROM Employee WHERE first_name LIKE '%v%';

-- first name 'n'
select * from Employee where first_name like 'n%'; 

-- first name ends with n and contains 4 letters
select * from Employee where length(first_name) = 4 and first_name = '%n';

-- first name starts with j and contains 4 letters
select * from Employee where length(first_name) = 4 and first_name = 'j%';

-- salary > than 60000
select * from Employee where salary>60000;

-- salary < than 80000
select * from Employee where salary<80000;

-- salary between 50000 to 80000
select * from Employee where salary>=50000 and salary<=80000;

-- details of venkatesh and ragavi
select * from Employee where first_name in ('Venkatesh','Ragavi');

-- % in last name
select * from employee where last_name = '%';

-- replace last name with white space
select replace(last_name, '', ' ') from Employee;

-- dept, total salary from employee using group by
select department, sum(salary) from Employee group by department;

-- dept, total salary from employee using group by and salary by desc
select department, sum(salary) from Employee group by department order by sum(salary) desc; 

-- dept, no of emp in dept, total salary wrt dept 
select department, count(department), sum(salary) from Employee group by department order by sum(salary) desc;

-- avg salary 
select department, avg(salary) from Employee group by department order by avg(salary) asc;

-- max salary
select department, max(salary) from Employee group by department order by max(salary) asc;

-- min salary
select department, min(salary) from Employee group by department order by min(salary) asc;

-- no of employees joined wrt year and month
select substring(joining_date, 7,4), substring(joining_date, 1,2), count(employee_id) from Employee group by substring(joining_date, 7,4), substring(joining_date, 1,2) order by substring(joining_date, 7,4), substring(joining_date, 1,2);

-- dept, total salary >than 8l
select department, sum(salary) from Employee group by department having sum(salary)>800000 order by sum(salary) desc; 

-- first name and incentive amount from employee and incentive table for those employee who have incentives(inner join)
select e.first_name, i.incentive_amount from Employee e inner join Incentives i on e.employee_id = i.employee_ref_id;

-- first name and incentive amount from employee and incentive table for those employee who have incentives and amount >than 3000(inner join)
select e.first_name, i.incentive_amount from Employee e inner join Incentives i on e.employee_id = i.employee_ref_id where incentive_amount > 3000;

-- first name and incentive amount if they dont have incentive
select e.first_name, i.incentive_amount from Employee e left join Incentives i on e.employee_id = i.employee_ref_id;

-- first name and incentive amount if they dont have incentive and amount as 0 for those who didnt get
select e.first_name, coalesce(i.incentive_amount, 0) as incentive_amount from Employee e left join Incentives i on e.employee_id = i.employee_ref_id;

-- first name and incentive amount from employee and incentive table for those employee who have incentives(inner join)
select e.first_name, i.incentive_amount from Employee e inner join Incentives i on e.employee_id = i.employee_ref_id;

-- max incentive by subquery
select e.first_name, (select max(i.incentive_amount) from Incentives i  where i.employee_ref_id = e.employee_id) from Employee e where e.employee_id in (select employee_ref_id from incentives);

-- top 2 salary
select salary from Employee order by salary desc limit 2;

-- 2nd highest salary
select salary from Employee order by salary desc limit 1 offset 1;



 
 