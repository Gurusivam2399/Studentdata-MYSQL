create database studentdata;

use studentdata;

create table student(
id int primary key,
stname varchar(30),
CGPA decimal(4,2)
);
drop table student;
describe student;

alter table student add column department varchar(30);
alter table student add column prize_amount varchar(30);

insert into student value 
(1,'GURU',89.2,'mech',18000),(2,'devika',85.3,'cse',12000),
(3,'soundharya',90.3,'EcE',20000),(4,'aravind',86.2,'mech',16000),
(5,'babu',65.5,'ICE',9000),(6,'ramar',53.2,'civil',5000),
(7,'maduraimuthu',77.5,'civil',13000),(8,'sudhakar',55.9,'civil',6500),
(9,'payal',73.4,'cse',11000),(10,'dinesh',66.4,'ece',9500);
-- insert into student value (8,'sudhakar',55.9,'ptStaff'); -- to insert add extra data

select *from student ;

update student 
set department='arts'
where department='BNI'; 

select distinct department
from student; 

-- order by
-- "order by" are used to arrange the data in given manner

select* from student
order by name;  -- by default form is ascending order function 

select *from student 
order by cgpa desc;  -- "desc" is used to order the row in the descending order 

select *from student
where department = 'cse' -- use "where" first for select specifice cloumn to order 
order by cgpa;  

select*from student  -- customize  the column in user given order  
order by (case department
when 'mech' then 1
when 'cse' then 2
when 'ece' then 3
when 'ice' then 4
when 'arts' then 5
when 'staff' then 6
else 100 end );

-- aggregate fnction  --> math fuction
-- 5 important function

select  count(*) total -- count used for to get total in the table 
from student;

select count(*) no_of_ECE_student
from student
where department='ece';

select avg(CGPA) no_of_avg_cgpa -- to find avg in the list 
from student
where department='cse';

select sum(cgpa) total_cgpa -- to find total in the list 
from student 
where department='staff'; -- importan

select max(cgpa) First_mark  -- to find high pint in the list 
from student ; -- importan

select min(cgpa) last_mark -- to find low  point in the list
from student ; -- importan

-- String fuction

select ucase(stname) , cgpa from student;  -- to get string in the uppercase

select  stname,char_length(stname) char_count from student ; -- to get letter count

select stname,concat('Rs.',format(prize_amount,0))prize_amount
from student ; -- to add extra info the list 

-- its specifi the how letter to viewin the list
select stname, left(department,2) from student ; 

select*from student order by department; -- to make order in the list 

-- group  are used for filter list to user demand
select department,avg(prize_amount)  -- to make group to given column
from student group by department; 

select department,count(id)  -- we can also use count in this
from student group by department; 

-- having user for filter the group
select department,count(id)  -- having is used to demand the number data we want   
from student group by department having count(id)>1 ; 


-- INDEX
/*
index are used to make the search fast and Reliable in result
index are selected by -"unique" constrains,foreign key, primary key
*/
use studentdata;

select*from student;
show index from student;

create index name_ind on student(stname);-- to create insdex mannualy -syntax 

alter table student 
drop index name_ind; -- to delete the index - -- syntax


-- Date and time 
-- add data and time in the studentdata
use studentdata;

select *from student;

alter table student add column join_date date;

update student set  join_date= '2018-08-12'; -- to set date in the column

update student set  join_date= '2018-08-14'
where department = 'cse'; -- to set date in speific column 

update student set  join_date= '2018-08-10'
where department = 'mech'; -- to set date in speific column 

select now(); -- to get day and time 

select curdate(); -- to get data 

select date_format(curdate(),'%d/%m/%Y') stdate; -- to change date formate

select datediff(curdate(),'2023-1-01'); -- to get inbetween date from given date

select date_add(curdate(),interval 1 week) as "after one week "; -- to add date from given date


-- Order by
-- "order by" are used to arrange the data in given manner

select* from student
order by name;  -- by default form is ascending order function 

select *from student 
order by cgpa desc;  -- "desc" is used to order the row in the descending order 

select *from student
where department = 'cse' -- use "where" first for select specifice cloumn to order 
order by cgpa;  

select*from student  -- customize  the column in user given order  
order by (case department
when 'mech' then 1
when 'cse' then 2
when 'ece' then 3
when 'ice' then 4
when 'arts' then 5
when 'staff' then 6
else 100 end );