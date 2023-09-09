create database Employee_Info;

use Employee_info;
/* we can't delete the parent(parent query -branch) before employee drop the 
   child query (child-employee) 
   we can also make loop in the method 
   foreign key are inter linked 
   this constrint by one by one
*/
create table branch(
branch_id int primary key auto_increment,
br_name varchar(30) not null  ,
addr varchar(200));

create table employee(
emp_id int primary key auto_increment,
ename varchar(30),
job_desc varchar(30),
salary int,
branch_id int,
constraint fr_branchId foreign key (branch_id) 
references branch(branch_id) -- foreignkey syntax
on delete set null
); 

select *from employee;
select * from branch;

INSERT INTO branch VALUES(1,"Chennai","16 ABC Road");
INSERT INTO branch VALUES(2,"Coimbatore","120 15th Block");
INSERT INTO branch VALUES(3,"Mumbai","25 XYZ Road");
INSERT INTO branch VALUES(4,"Hydrabad","32 10th Street");

INSERT INTO employee VALUES(1,'Ram','ADMIN',1000000,2);
INSERT INTO employee VALUES(2,'Harini','MANAGER',2500000,2);
INSERT INTO employee VALUES(3,'George','SALES',2000000,1);
INSERT INTO employee VALUES(4,'Ramya','SALES',1300000,2);
INSERT INTO employee VALUES(5,'Meena','HR',2000000,3);
INSERT INTO employee VALUES(6,'Ashok','MANAGER',3000000,1);
INSERT INTO employee VALUES(7,'Abdul','HR',2000000,1);
INSERT INTO employee VALUES(8,'Ramya','ENGINEER',1000000,2);
INSERT INTO employee VALUES(9,'Raghu','CEO',8000000,3);
INSERT INTO employee VALUES(10,'Arvind','MANAGER',2800000,3);
INSERT INTO employee VALUES(11,'Akshay','ENGINEER',1000000,1);
INSERT INTO employee VALUES(12,'John','ADMIN',2200000,1);
INSERT INTO employee VALUES(13,'Abinaya','ENGINEER',2100000,2);
INSERT INTO employee VALUES(14,'Vidya','ADMIN',2200000,NULL);
INSERT INTO employee VALUES(15,'Ranjani','ENGINEER',2100000,NULL);

select*from employee;
select*from branch;

-- subqueries
-- it is simply called nested query
-- employee feom chennai branch
select*from employee
where branch_id=(select branch_id from branch
where br_name="coimbatore");

-- employee from min salary
select*from employee
where salary =(select min(salary)from employee);

-- EXISTS used with subQueries
select branch_id,br_name
from branch
where exists (
select *from employee
where job_desc="admin"  and branch.branch_id=employee.branch_id);

-- ANY
select*from branch
where branch_id=any(select branch_id from employee
where salary>2500000);

-- ALL
select*from employee
where branch_id <> all
(select branch_id from branch
where br_name in("chennai","coimbatore")); 
