create database Harsha853
create table Students(S_Id int primary key,S_Name nvarchar(20),Mail_ID varchar(20));
insert into Students(S_Id,S_Name,Mail_ID) values(1,'harsha','a@.com')
select * from Students
insert into Students(S_Id,S_Name,Mail_ID) values(2,'ravi','g@.com')
insert into Students(S_Id,S_Name,Mail_ID) values(3,'venu','b@.com')

update Students set Mail_ID='harsha@gmail.com' where S_Id=1 
update Students set Mail_ID='ravi@gmail.com' where S_Id=2
update Students set Mail_ID='venu@gmail.com' where S_Id=3  
select * from Students
insert into Students(S_Id,S_Name,Mail_ID) values(4,'dhanu','dhanu@gmail.com')
delete from Students where S_Id=4
exec sp_rename  'Students', 'StudentsData'
exec sp_rename  'StudentsData', 'Students'
create table Employee(E_Id int primary key,E_Name nvarchar(20),Mail_ID varchar(20));
insert into Employee(E_Id,E_Name,Mail_ID,DOB) values(1,'sonu','sonu@gmail.com',01/01/1990)
select * from Employee
insert into Employee(E_Id,E_Name,Mail_ID) values(2,'raju','raju@gmail.com')
insert into Employee(E_Id,E_Name,Mail_ID) values(3,'harsha','harsha@gmail.com')
insert into Employee(E_Id,E_Name,Mail_ID) values(4,'charan','charan@gmail.com')
alter table Employee add DOB date 
insert into Employee(E_Id,E_Name,Mail_ID,dob) values(5,'raju','raju@gmail.com','01/01/1990')
update Employee set DOB='02-02-2018' where E_Id=1