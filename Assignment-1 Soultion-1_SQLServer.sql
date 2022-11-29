create table Client_master
(
	client_no varchar(6)constraint primarykeClient primary key, constraint checkClientNo check (client_no like 'C%'),
	name varchar(20) not null,
	address1 varchar(30),
	address2 varchar(30),
	city varchar(15),
	state varchar(15),
	pincode numeric(6),
	bal_due money
)
select * from Client_master
drop table Client_master
===============================================================
create table product_master
(
	product_no varchar(6) constraint primarykeyProduct primary key, constraint checkProductNo check (product_no like 'P%'),
	description varchar(50) not null,
	profit_percent numeric(3,2)not null,
	unit_measure varchar(10)not null,
	qty_on_hand numeric(8)not null,
	recorder_lvl numeric(8)not null,
	sell_price numeric (8,2)not null constraint sellPrice check (sell_price>0),
	cost_price numeric (8,2)not null constraint costPrice check (cost_price>0)
)
select * from product_master
drop table product_master
===============================================
create table salesman_master
(
	salesman_no varchar(6) constraint primarykeySalesman primary key, constraint checkSalesmanNo check (salesman_no like 'S%'),
	salesman_name varchar(20) not null,
	Address1 varchar(30) not null,
	Address2 varchar(30),
	city varchar(20),
	pincode varchar(6),
	state varchar(20),
	sal_amt numeric (8,2) not null constraint salAmount check (sal_amt >0),
	tgt_to_get numeric (6,2)not null constraint targetAmount check (tgt_to_get >0),
	ytd_sales numeric (6,2) not null,
	remarks varchar(60)
)
select * from salesman_master
drop table salesman_master
=====================================================
create table sales_order
(
	s_order_no varchar(6) constraint primarykeyOrder primary key, constraint checkOrderNo check (s_order_no like 'O%'),
	s_order_date datetime,
	client_no varchar(6)constraint foreignKeyClient foreign key references Client_master(client_no),
	dely_Addr varchar(25),
	salesman_no varchar(6) constraint foreignKeySalesman foreign key references salesman_master(salesman_no),
	dely_type char(1) constraint checkdelyType check(dely_type in ('P','F'))constraint defalutdelyType default 'F',
	bill_Yn char(1) constraint checkBillYN check (bill_Yn in ('Y','N')),
	dely_date datetime,
	order_status varchar(10)
)

drop table sales_order
select * from sales_order
=================================================================
create table sales_order_details
(
	s_order_no varchar(6) constraint foreignkeySalesOrder foreign key references sales_order(s_order_no),
	product_no varchar(6)constraint foreignkeyProduct foreign key references product_master(product_no),
	qty_ordered numeric (8),
	qty_disp numeric(8),
	product_rate numeric(10,2),
	constraint pmk primary key (s_order_no,product_no)
)
select * from sales_order_details
drop table sales_order_details
================================================================
create table Challan_header
(
	challan_no varchar(6) constraint primarykeyChallanNo primary key, constraint checkChallanNo check(challan_no like 'CH%'),
	s_order_no varchar(6) constraint foreignkeySalesOrderChallan foreign key references sales_order(s_order_no),
	challan_date datetime not null,
	billed_yn char(1) constraint defaultBilled default 'N', constraint checkBilled check(billed_yn in ('Y','N'))
)
select * from Challan_header
drop table Challan_header
==========================================
create table Challan_details
(
	challan_no varchar(6) constraint foreignkeyChallanHead foreign key references Challan_header(challan_no),
	product_no varchar(6)constraint foreignkeyProductChallan foreign key references product_master(product_no),
	qty_disp numeric(4,2) not null
)
select * from Challan_details
drop table Challan_details
================================================================================
insert into client_master(client_no,name,city,pincode,state,bal_due)values('C00001','Ivan Bayross','Bombay',400054,'Maharashtra',15000)
insert into client_master(client_no,name,city,pincode,state,bal_due)values('C00002','Vandana Sitwal','Madras',780001,'Tamil Nadu',0)
insert into client_master(client_no,name,city,pincode,state,bal_due)values('C00003','Pramada Jaguste','Bombay',400057,'Maharashtra',5000)
insert into client_master(client_no,name,city,pincode,state,bal_due)values('C00004','Sachin Chitale','Bombay',400056,'Maharashtra',0)
insert into client_master(client_no,name,city,pincode,bal_due) values('C00005','Ravi Sharma','Delhi',100001,2000)
insert into client_master(client_no,name,city,pincode,state,bal_due)values('C00006','Rukmini','Bombay',400050,'Maharashtra',0)

select * from client_master
==================================================================================
insert into product_master values('P00001','1.44 Floppies',5,'Piece',100,20,525,500)
insert into product_master values('P03453','Monitors',6,'Piece',10,3,12000,11280)
insert into product_master values('P06734','Mouse',5,'Piece',20,50,1050,1000)
insert into product_master values('P07865','1.22 Floppies',5,'Piece',100,20,525,500)
insert into product_master values('P07868','Keyboards',2,'Piece',10,3,3150,3050)
insert into product_master values('P07885','CD Drive',2.5,'Piece',10,3,5250,5100)
insert into product_master values('P07965','540 HDD',4,'Piece',10,3,8400,8000)
insert into product_master values('P07975','1.44 Drive',5,'Piece',10,3,1050,1000)
insert into product_master values('P08865','1.22 Drive',5,'Piece',2,3,1050,1000)

select * from product_master
=============================================================================
insert into salesman_master values('S00001','Kiran','A/14','Worli','Bombay',400002,'MAH',3000,100,50,'Good')
insert into salesman_master values('S00002','Manish','65','Nariman','Bombay',400001,'MAH',3000,200,100,'Good')
insert into salesman_master values('S00003','Ravi','P-7','Bandra','Bombay',400032,'MAH',3000,200,100,'Good')
insert into salesman_master values('S00004','Ashish','A/5','Juhu','Bombay',400044,'MAH',3500,200,150,'Good')

select * from salesman_master
=============================================================================
insert into sales_order(s_order_no,s_order_date,client_no,dely_type,bill_Yn,salesman_no,dely_date,order_status)
values('O19001','01/12/1996','C00001','F','N','S00001','01/20/1996','IP')

insert into sales_order(s_order_no,s_order_date,client_no,dely_type,bill_Yn,salesman_no,dely_date,order_status)
values('O19002','01/25/1996','C00002','P','N','S00002','01/27/1996','C')

insert into sales_order(s_order_no,s_order_date,client_no,dely_type,bill_Yn,salesman_no,dely_date,order_status)
values('O46865','02/18/1996','C00003','F','Y','S00003','02/20/1996','F')

insert into sales_order(s_order_no,s_order_date,client_no,dely_type,bill_Yn,salesman_no,dely_date,order_status)
values('O19003','04/03/1996','C00001','F','Y','S00001','04/07/1996','F')

insert into sales_order(s_order_no,s_order_date,client_no,dely_type,bill_Yn,salesman_no,dely_date,order_status)
values('O46866','05/20/1996','C00004','P','N','S00002','05/22/1996','C')

insert into sales_order(s_order_no,s_order_date,client_no,dely_type,bill_Yn,salesman_no,dely_date,order_status)
values('O10008','05/24/1996','C00005','F','N','S00004','05/26/1996','IP')

select * from sales_order

=========================================================================
insert into sales_order_details values('O19001','P00001',4,4,525)
insert into sales_order_details values('O19001','P07965',2,1,8400)
insert into sales_order_details values('O19001','P07885',2,1,5250)
insert into sales_order_details values('O19002','P00001',10,0,525)
insert into sales_order_details values('O46865','P07868',3,3,3150)
insert into sales_order_details values('O46865','P07885',3,1,5250)
insert into sales_order_details values('O46865','P00001',10,10,525)
insert into sales_order_details values('O46865','P03453',4,4,1050)
insert into sales_order_details values('O19003','P03453',2,2,1050)
insert into sales_order_details values('O19003','P06734',1,1,12000)
insert into sales_order_details values('O46866','P07965',1,0,8400)
insert into sales_order_details values('O46866','P07975',1,0,1050)
insert into sales_order_details values('O19008','P00001',10,5,525)
insert into sales_order_details values('O19008','P07975',5,3,1050)
==============================================================================
insert into challan_header values('CH9001','O19001','12/12/1995','Y')
insert into challan_header values('CH6865','O46865','11/12/1995','Y')
insert into challan_header values('CH3965','O10008','10/12/1995','Y')

select * from challan_header
=============================================================================
insert into challan_details values('CH9001','P00001',4)
insert into challan_details values('CH9001','P07965',1)
insert into challan_details values('CH9001','P07885',1)
insert into challan_details values('CH6865','P07868',3)
insert into challan_details values('CH6865','P03453',4)
insert into challan_details values('CH6865','P00001',10)
insert into challan_details values('CH3965','P00001',5)
insert into challan_details values('CH3965','P07975',2)

select * from challan_details

===================================Query=========================
select * from Client_master
select * from product_master
select * from salesman_master
select * from sales_order
select * from sales_order_details
select * from Challan_header
select * from Challan_details
==================================================================
--1
select name from Client_master
--2-----------------------------
select * from Client_master
--3-----------------------------
select name, city from Client_master
--4----------------------------------
select description as 'Product' from product_master
--5-------------------------
select name from Client_master where name like '_a%'
--6--------------------------------
select name from Client_master where city like '_a%'
--7--------------------------------
select * from Client_master where city in('Bombay','Delhi','Madras')
--8---------------------------------
select * from Client_master where city ='Bombay'
--9-----------------------------
select * from Client_master where bal_due>10000
--10-----------------------------
select * from sales_order where s_order_date between '01/01/1996' and '01/31/1996'

SELECT * from sales_order where DATENAME(month, s_order_date) = 'January'
--11--------------------------------
select * from sales_order where client_no in ('C00001','C00002') 
--12----------------------------------
select * from product_master where description in('1.44 Drive','1.22 Drive')
--13---------------------------------
select * from product_master where sell_price>2000 and sell_price<=5000
--14---------------------------------
Select sell_price, sell_price+(sell_price*0.15) from product_master where sell_price >1500
--15---------------------------------------------
Select sell_price, sell_price+(sell_price*0.15) as 'New_Price' from product_master where sell_price >1500
--16-----------------------------------------
select * from product_master where cost_price<1500
--17------------------------------------------
select * from product_master order by 2
select * from product_master order by description
--18-----------------------------
select sqrt(sell_price) as Price from product_master
--19-----------------------------
select product_no, description, sell_price, sell_price/(sell_price-100) from product_master where description ='540 HDD'
--20----------------------------
Select name, city ,state from client_master where state !='Maharashtra' or state is null
--21-----------------------------
select product_no, description, sell_price from product_master where description like 'M%'
--22----------------------------
select * from sales_order where order_status='C' and datename(month,s_order_date)='May'
--23----------------------------
select count(s_order_no) as 'Total Order' from sales_order
--24------------------------------
select avg(sell_price) as 'Average Price' from product_master
--25--------------------------------
select min(sell_price) as 'Minimum Price' from product_master
--26---------------------------------
select min(sell_price) as 'Minimum Price', max(sell_price) as 'Maximum Price' from product_master
--27-------------------------------------------------
select count(product_no)'No of Product' from product_master where sell_price>=1500
--28------------------------------
select * from product_master where qty_on_hand <recorder_lvl
--29--------------------------------
select name +' has placed order '+ s_order_no+ ' on '+ convert(varchar,s_order_date) as 'Order Information'
from client_master c, sales_order s where c.client_no=s.client_no
--30---------------------------------
select description , sum(qty_disp) as 'Total Quantity Sold'
from product_master p, sales_order_details s
where p.product_no=s.product_no
group by description
--31------------------------------------
select qty_disp , sum(qty_disp) as 'Total Quantity Sold'
from product_master p, sales_order_details s
where p.product_no=s.product_no
group by qty_disp

-----32------------------------------------
select * from Client_master
select * from product_master
select * from sales_order
select * from sales_order_details

select avg(qty_disp), name from client_master, sales_order_details
--select product_rate, name from client_master, sales_order_details
group by name having max(product_rate)>=15000

--33---------------------------------------
select * from Client_master
select * from product_master
select * from sales_order
select * from sales_order_details

select sum(product_rate),datename(month,s_order_date) as 'Month'
from sales_order,sales_order_details where datename(month,s_order_date)='January'
group by s_order_date 
--34-----------------------------
select (description +'  worth Rs. '+convert (varchar,sum(product_rate)) +' was sold') as 'Report' from 
product_master p, sales_order_details s where p.product_no=s.product_no
group by description

--35--------------------------
select (description +'  worth Rs. '+convert (varchar,sum(product_rate))
+' was ordered in the month of '+datename(month,s_order_date)) as 'Report' from 
product_master p, sales_order_details sod, sales_order s 
where p.product_no=sod.product_no and s.s_order_no=sod.s_order_no
group by description,s_order_date

--36-----------------------


select description from product_master where product_no in
(select product_no from sales_order_details where s_order_no in
(select s_order_no from sales_order where client_no in
(select client_no from client_master where name='Ivan Bayross')
)
)
------with Joins------------------------
select c.name, p.description
from client_master c, product_master p, sales_order_details sod, sales_order so
where ((p.product_no=sod.product_no) and
(sod.s_order_no=so.s_order_no)and
(so.client_no=c.client_no))and c.name='Ivan Bayross'
--37-------------------------------------
select * from product_master
select * from sales_order
select * from sales_order_details

select p.description,sod.qty_ordered,
datename(month,s_order_date) as 'Month'from
product_master p, sales_order_details sod, sales_order s
where ((p.product_no=sod.product_no)and
(s.s_order_no=sod.s_order_no)and datename(month,s_order_date)='May')

--38-----------------------------------------
select * from product_master
select * from sales_order
select * from sales_order_details

select p.product_no, description from
product_master p , sales_order s , sales_order_details sod
where (p.product_no=sod.product_no and s.s_order_no=sod.s_order_no) 
and s.order_status='IP' 
--39-----------------------------------------------
select * from product_master
select * from sales_order
select * from sales_order_details
select * from Client_master

select c.name ,p.description as 'Product Name' from 
client_master c, product_master p, sales_order s, sales_order_details sod
where (s.client_no=c.client_no and sod.product_no=p.product_no and sod.s_order_no=s.s_order_no)
and p.description='CD Drive'

--40----------------------------------
select p.product_no, s.s_order_no,sod.qty_ordered, c.name,p.description from
client_master c, product_master p, sales_order s, sales_order_details sod
where (s.client_no=c.client_no and sod.product_no=p.product_no and sod.s_order_no=s.s_order_no)
and sod.qty_ordered<5 and p.description='1.44 Floppies'
--41-----------------------------------
select p.description, sod.qty_ordered, c.name from
client_master c, product_master p, sales_order s, sales_order_details sod
where (s.client_no=c.client_no and sod.product_no=p.product_no and sod.s_order_no=s.s_order_no)
and c.name in('Vandana Saitwal','Ivan Bayross')
--42------------------------------------
select p.description, sod.qty_ordered, c.client_no from
client_master c, product_master p, sales_order s, sales_order_details sod
where (s.client_no=c.client_no and sod.product_no=p.product_no and sod.s_order_no=s.s_order_no)
and c.client_no in('C00001','C00002')

--43---------------------------------------
select * from product_master
select * from sales_order
select * from sales_order_details
select * from Client_master

select product_no , description from product_master where product_no in
(select product_no from sales_order_details where s_order_no in
(select s_order_no from sales_order where order_status='IP') 
)

--44------------------------------------------------
select name, address1,address2, city, pincode  from client_master where client_no in(
select client_no from sales_order where s_order_no ='O19001')
--45------------------------------------------------
select * from client_master where client_no in(
select client_no from sales_order where datepart(mm,s_order_date)<5)
--with Join
select c.name, datepart(mm,s.s_order_date) as 'Month' from
client_master c, sales_order s
where c.client_no =s.client_no and datepart(mm,s_order_date)<5
--46-----------------------------------------
select * from product_master
select * from sales_order
select * from sales_order_details
select * from Client_master

select client_no , name  from client_master where client_no in(
	select client_no from sales_order where s_order_no in(
		select s_order_no from sales_order_details where product_no in(
			select product_no from product_master where description !='1.44 Drive'
			)
		)
	)
--with Joins
select c.client_no , c.name, p.description from
client_master c, product_master p, sales_order s, sales_order_details sod
where (s.client_no=c.client_no and sod.product_no=p.product_no and sod.s_order_no=s.s_order_no)
and p.description!='1.44 Drive'

--47---------------------------------------
select * from product_master
select * from sales_order
select * from sales_order_details
select * from Client_master

select name from client_master where client_no in(
	select client_no from sales_order where s_order_no in(
		select s_order_no from sales_order_details 
				where product_rate*qty_ordered>=10000
		)
	)
--with Joins
select c.name, sod.product_rate*qty_ordered as 'Amount' from 
client_master c, product_master p, sales_order s, sales_order_details sod
where (s.client_no=c.client_no and sod.product_no=p.product_no and sod.s_order_no=s.s_order_no)
and product_rate*qty_ordered>=10000
--48----------------------------------
select * from product_master
select * from sales_order
select * from sales_order_details
select * from Client_master


select s.s_order_no, datepart(day,s.s_order_date)as 'Day'
from sales_order s, sales_order_details sod
where s.s_order_no=sod.s_order_no
--49------------------------------------
select datename(month,dely_date)+'-'+convert(varchar,datepart (day,dely_date))as 'Delivery Date'
from sales_order
--50----------------------------------
select convert(varchar,datepart(day,s_order_date))+
	'-'+datename(month,s_order_date)+'-'+convert(varchar,datepart(year,s_order_date))
from sales_order
--51------------------------------------
select dateadd(day,15,getdate())
--52----------------------------------
select datediff(day,getdate(),dely_date)'Delivery Days remaining'from sales_order
--53---------------------------------

select * from product_master
select * from sales_order
select * from sales_order_details
select * from Client_master

update sales_order
set s_order_date='07/24/1996'
where client_no='C00001'
--54------------------
update product_master
set sell_price=1150
where description='1.44 Floppies'
--55------------------------
delete from sales_order
where s_order_no='O19001'
--56-----------------------------
delete from sales_order
where dely_date=07/10/1996
--57----------------------------
update client_master
set city='Bombay'
where client_no='C00005'
--58----------------------------------------
update sales_order
set dely_date='08/16/1996'
where s_order_no='O10008'
--59-------------------------------------------
update client_master
set bal_due=1000
where client_no='C00001'
--60-------------------------------------
select * from product_master
update product_master
set cost_price=950.00
where description='1.22 Floppy Drive'