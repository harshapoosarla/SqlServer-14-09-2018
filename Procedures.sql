select * from Stocks
drop table Stocks

use Harsha853
select * from Stocks

delete from Stocks where StockSymbol='MJR'


create table Stocks
(StockSymbol nvarchar(10) not null,
StockName nvarchar(30) not null,
Exchange nvarchar(10) not null,
PriceEarningsRatio int not null)


insert into Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) 
  values ('AAPL', 'Apple Inc', 'NASDAQ', 14)

insert into Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) 
  values ('AMZN', 'Amazon.com Inc', 'NASDAQ', 489)

insert into Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) 
  values ('DIS', 'The Walt Disney Company', 'NYSE', 21)

insert into Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) 
  values ('GE', 'General Electric Company', 'NYSE', 18)

insert into Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) 
  values ('GOOG', 'Alphabet Inc', 'NASDAQ', 30)

insert into Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) 
  values ('HSY', 'The Hershey Company', 'NYSE', 26)

insert into Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) 
  values ('KRFT', 'Kraft Foods Inc', 'NYSE', 12)

insert into Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) 
  values ('KO', 'The Coca-Cola Company', 'NYSE', 21)

insert into Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) 
  values ('MCD', 'McDonalds Corporation', 'NYSE', 18)

insert into Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) 
  values ('MMM', '3M Company', 'NYSE', 20)

insert into Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) 
  values ('MSFT', 'Microsoft Corporation', 'NASDAQ', 15)

insert into Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) 
  values ('ORCL', 'Oracle Corporation', 'NASDAQ', 17)

insert into Stocks (StockSymbol, StockName, Exchange, PriceEarningsRatio) 
  values ('SBUX', 'Starbucks Corporation', 'NASDAQ', 357)
exec Proc_Stocks 'SBUX', 'Starbucks Corporation', 'NASDAQ', 357


  

  /*procedure for insert*/

  ALTER procedure Proc_Stocks
      ( @StockSymbol nvarchar(10) ,
	   @StockName nvarchar(10) ,
	   @Exchange nvarchar(10) ,
	   @PriceEarningsRatio int )
   as 
   begin  
   if  exists (select * from Stocks where StockName=@StockName or @PriceEarningsRatio > 500) 
   print N'data already exists or price earning ratio is high'
   else 
   insert into Stocks (StockSymbol,StockName,Exchange,PriceEarningsRatio) 
       values (@StockSymbol,@StockName,@Exchange,@PriceEarningsRatio)
	   end
	   

	   exec Proc_Stocks 'MJR','MJRC','NYSE',100
	   exec Proc_Stocks 'WMT', 'Wal-Mart Stores Inc', 'NYSE', 150
	   select * from Stocks
      
	  
	  /*procedure for update*/
	  
	  
	  alter procedure Proc_StockUpdate
      ( @StockSymbol nvarchar(10),
	   @StockName nvarchar(10),
	   @Exchange nvarchar(10),
	   @PriceEarningsRatio int,
	   @ExchangeID int)
   as 
   begin  
   if exists (select * from Stocks where StockName=@StockName or @PriceEarningsRatio > 500 )
   print N'cannot update since data is already existing or price earning ratio is high'
   else 
    update Stocks set StockSymbol=@StockSymbol,StockName=@StockName,
	                   Exchange=@Exchange,PriceEarningsRatio=@PriceEarningsRatio
					   where ExchangeId=@ExchangeId
	end

	
    select * from Stocks
	--truncate table Stocks
	exec Proc_Stocks 'MJR','MJRC','NYSE',200

	alter table Stocks add  ExchangeId int 

	/* procedure for delete */

	  alter procedure Proc_StockUpdate
      ( @StockSymbol nvarchar(10),
	   @StockName nvarchar(10),
	   @Exchange nvarchar(10),
	   @PriceEarningsRatio int,
	   @ExchangeID int)
   as 
   begin
   declare  @check as int
   select @check=count(*) from Stocks where Exchange in (select Exchange from Stocks where StockName=@StockName)
   if (@check <> 1)
   begin
   delete from Stocks where StockName=@StockName
   end
   else
   print N'cannot delete atleast one data must be present'
   end
   delete from Stocks where ExchangeID=1
   select * from Stocks