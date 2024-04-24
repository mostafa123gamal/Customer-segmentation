--The description of each product sold

--InvoiceNo: The invoice number for each transaction

--StockCode: The unique code for each product sold

--Description: The description of each product sold

--Quantity: The quantity of each product sold in each transaction

--InvoiceDate: The date and time of each transaction

--UnitPrice: The price of each product sold

--CustomerID: The unique identifier for each customer

--Country: The country where each transaction occurred



create table customer (
    InvoieNo int ,
    StockCode varchar(15),
	Description varchar(225),
	Quantity int ,
	InvoiceDate date ,
	UnitPrice decimal ,
	CustomerID int ,
	Country varchar(255)

)

copy customer from 'F:\data science\sql\projects\customer\Online_Retail.csv' delimiter ','csv header;
SELECT * FROM customer





SQL Project Idea: Use SQL queries to answer the following questions:

--What is the distribution of order values across all customers in the dataset?

select 
 CustomerID,
 sum(quantity* unitprice ) as  order_value 
 from customer group by CustomerID order by order_value desc;
 
--How many unique products has each customer purchased?
 select 
  CustomerID,
  count (distinct StockCode) as unique_products
  
 from customer
 group by  CustomerID
 order by  unique_products desc;
 
--Which customers have only made a single purchase from the company?

select * from customer 

 select 
  CustomerID,
  count (distinct InvoieNo)as number_purchase
  from customer
  group by  CustomerID
  having    
  count (distinct InvoieNo) = 1;
  
  

--Which products are most commonly purchased together by customers in the dataset?

 select 
   a.description as product1,
   b.description as product2,
   count(*) as numtransaction 
   
from customer a
join customer b on a.InvoieNo=b.InvoieNo and a.StockCode<b.StockCode
group by  a.Description,b.Description
order by numtransaction desc 


























































































