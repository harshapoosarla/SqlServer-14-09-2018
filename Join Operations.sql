use Harsha853

/* Creating a table for Politicians */

create table Politicians(Id int identity(1,1) primary key,Name nvarchar(20) not null,CountryId int foreign key references Countries(Id));

/* Inserting values into Politicians Table*/

insert into Politicians(Name,CountryId) values ('Gandhi',1);
insert into Politicians(Name,CountryId) values ('Sardar Patel',1);
insert into Politicians(Name,CountryId) values ('Modi',1);
insert into Politicians(Name,CountryId) values ('Obama',2);
insert into Politicians(Name,CountryId) values ('Mandela',3);

/* Retrieving values from Politicians Table */

select * from Politicians;

/* Creating a table for Countries */

create table Countries(Id int identity(1,1) primary key,Name nvarchar(20) not null);

/* Inserting Values into Countries table */

insert into Countries(Name) values ('India');
insert into Countries(Name) values ('USA');
insert into Countries(Name) values ('South Africa');

/* Retrieving values from Countries table */

select * from Countries;

/* Creating a table for Portfolios */

create table Portfolios(Id int identity(1,1) primary key,Name nvarchar(20) not null,PoliticianId int foreign key references Politicians(Id));

/* Inserting Values into Portfolios table */

insert into Portfolios(Name,PoliticianId) values ('Education Minister',1);
insert into Portfolios(Name,PoliticianId) values ('Finance Minister',2);
insert into Portfolios(Name,PoliticianId) values ('Railway Minister',3);
insert into Portfolios(Name,PoliticianId) values ('IT Minister',3);
insert into Portfolios(Name,PoliticianId) values ('Home Minister',1);
insert into Portfolios(Name,PoliticianId) values ('Defence Minister',4);
insert into Portfolios(Name,PoliticianId) values ('Home Minister',5);
insert into Portfolios(Name,PoliticianId) values ('Chief Minister',6);
/* Retrieving values from Portfolios table */

select * from Portfolios;

alter table Politicians
drop column  CountryId;

ALTER TABLE Politicians
ADD CountryId int foreign key references Countries(Id);

update  Politicians set CountryId=1 where Id in(1,2,3)
update  Politicians set CountryId=2 where Id in(4)
update  Politicians set CountryId=3 where Id in(5)

select * from Politicians p full join Countries c on c.Id=p.countryid;
select * from Politicians p full join Countries c on p.countryid=c.Id;
select * from Politicians p right outer join Countries c on p.countryid=c.Id;
select * from Politicians p left outer join Countries c on p.countryid=c.Id;

ALTER TABLE Politicians
ADD PortfoliId int foreign key references Portfolios(Id);

select * from Politicians p left outer join Portfolios pf on pf.Id=p.portfolioid;

update  Politicians set PortfolioId=1 where Id in(1)
update  Politicians set PortfolioId=2 where Id in(2)
update  Politicians set PortfolioId=3 where Id in(3)
update  Politicians set PortfolioId=2 where Id in(4)
update  Politicians set PortfolioId=1 where Id in(5)

SP_RENAME 'Politicians.PortfoliId','PortfolioId'

select * from Politicians;
select * from Countries;
select * from Portfolios;



select Politicians.Id,Politicians.Name,Countries.Name,Portfolios.Name 
from Politicians 
left join Countries on Politicians.CountryId=Countries.Id
join Portfolios on Portfolios.PoliticianId=Politicians.Id


select * from Politicians
select * from Portfolios
delete from Portfolios where Id=7



