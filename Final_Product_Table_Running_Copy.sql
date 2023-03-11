Drop Table if Exists HSN_Code;
Drop Table if Exists Products_Category;
Drop Table if Exists Products;
Drop Table if Exists Products_Stock;
Drop Table if Exists Vendor;
Drop Table if Exists Purchase_Order;
Drop Table if Exists Purchase_Order_Products;
Drop Table if Exists Indents;
Drop Table if Exists Indents_Products;
Drop Table if Exists GRN;
Drop Table if Exists GRN_Products;
Drop Table if Exists Purchase_Return;
Drop Table if Exists Purchase_Return_Items;
Drop Table if Exists CustomSet_Products;
Drop Table if Exists Users;
Drop Table if Exists EUsers;
Drop Table if Exists Eorder;
Drop Table if Exists Eorder_products;
Drop Table if Exists EIndents;
Drop Table if Exists EIndents_Products;
Drop Table if Exists StoreIssues;
Drop Table if Exists StoreIssues_Products;
Drop Table if Exists Ecommerce_Stock;
--Creating Tables
--1.—---------------------------------HSN—---------------------------------------------------
CREATE Table HSN_Code(
HSN_CODE INT PRIMARY KEY,
GST int,
Last_Updated_User varchar(20),
Last_Updated_Date date
);
--2.—---------------------------------Products_Category —---------------------------------------------------
CREATE Table Products_Category (
Product_Category_ID INT PRIMARY KEY,
Product_Category_Name Varchar (50),
Last_Updated_User varchar(20),
Last_Updated_Date date
);
--3.—---------------------------------Products —---------------------------------------------------
CREATE Table Products(
Product_ID serial PRIMARY KEY,
Product_Name Varchar(30),
Product_Image Varchar,
Product_Description Varchar(200),
Product_Category_ID INT,
Product_HSN_Code int,
Product_Type varchar(50),
Product_Reorder_Level int,
Ecommerce_Reorder_Level int,
Product_Status varchar(20),
Last_Updated_User varchar(20),
Last_Updated_Date date,
CONSTRAINT FK_ProdCtg
FOREIGN KEY (Product_Category_ID)
REFERENCES Products_Category(Product_Category_ID),
CONSTRAINT FK_HS
FOREIGN KEY (Product_HSN_Code)
REFERENCES HSN_Code(HSN_CODE)
);
--4.—---------------------------------Products_Stock —---------------------------------------------------
CREATE Table Products_Stock(
Products_ID int,
Batch_NO Int,
Product_Stock int,
Product_MRP numeric,
Product_Cost numeric,
Product_Sale_Price numeric,
Last_Updated_User varchar(20),
Last_Updated_Date date,
CONSTRAINT FK_PID
FOREIGN KEY (Products_ID)
REFERENCES Products(Product_ID),
Primary key(Products_ID,Batch_NO)
);
--5.—---------------------------------Vendor —---------------------------------------------------
CREATE Table Vendor (
Vendor_ID serial PRIMARY KEY,
Vendor_Name VARCHAR (50),
Vendor_Address Varchar(100),
Vendor_PhoneNumber bigint,
Status varchar (20),
User_ID INT,
Last_Updated_User varchar(20),
Last_Updated_Date date
);
--6.—---------------------------------Purchase_Order —---------------------------------------------------
CREATE Table Purchase_Order (
Purchase_Order_ID serial PRIMARY KEY,
Purchase_Order_Date date,
Purchase_Order_Amount numeric,
Vendor_ID int,
Purchase_Order_Expected_Date date,
Purchase_Order_Status Varchar(15),
USER_ID INT,
Last_Updated_User varchar(20),
Last_Updated_Date date,
CONSTRAINT FK_V_ID
FOREIGN KEY (Vendor_ID)
REFERENCES Vendor(Vendor_ID)
);
--7.—---------------------------------Purchase_Order_Products -----------------------------------
CREATE Table Purchase_Order_Products(
Purchase_Order_ID int,
Product_ID INT,
Purchase_Order_Quantity Int,
Negotiation_Price numeric,
Qunatity_Received Int,
PRIMARY KEY (Purchase_Order_ID, Product_ID),
CONSTRAINT FK_PO_ID
FOREIGN KEY (Purchase_Order_ID)
REFERENCES Purchase_Order(Purchase_Order_ID),
CONSTRAINT FK_P_ID
FOREIGN KEY (Product_ID)
REFERENCES Products(Product_ID)
);
--8.—---------------------------------Indents ---------------------------------------
CREATE Table Indents (
Indents_ID serial PRIMARY KEY,
Indents_Date date,
Indents_Status VArChar(20),
User_ID Int,
Last_Updated_User varchar(20),
Last_Updated_Date date
);
--9.—-------------------------------------Indents_Products---------------------------------------
CREATE Table Indents_Products (
Indents_ID INT,
Indents_Products_ID int,
Indents_Products_Quantity Int,
PRIMARY KEY (Indents_ID, Indents_Products_ID),
CONSTRAINT FK_I_ID
FOREIGN KEY (Indents_ID)
REFERENCES Indents(Indents_ID),
CONSTRAINT FK_P_ID
FOREIGN KEY (Indents_Products_ID)
REFERENCES Products(Product_ID)
);
--10.—-------------------------------------GRN ---------------------------------------
CREATE Table GRN (
GRN_ID serial Primary Key,
GRN_Date date,
Purchase_Order_ID Int,
GRN_Amount numeric,
GRN_Status varchar(20),
Last_Updated_User varchar(20),
Last_Updated_Date date,
CONSTRAINT FK_PO_ID
FOREIGN KEY (Purchase_Order_ID)
REFERENCES Purchase_Order(Purchase_Order_ID)
);
--11.—-------------------------------------GRN_Products ---------------------------------------
CREATE Table GRN_Products (
GRN_ID int,
Product_ID Int,
Batch_NO int,
Quantity Int,
Price numeric,
Gst Int,
Bonus Int,
Last_Updated_User varchar(20),
Last_Updated_Date date,
CONSTRAINT FK_GN_ID
FOREIGN KEY (GRN_ID)
REFERENCES GRN(GRN_ID),
CONSTRAINT FK_PO_ID
FOREIGN KEY (Product_ID)
REFERENCES Products(Product_ID)
);
--12.—-----------------------------------Purchase_Return ---------------------------------------
create table Purchase_Return(
Purchase_return_id serial primary key,
Purchase_return_date TIMESTAMP ,
GRN_NO int,
Grn_cost numeric,
Vendor_ID int ,
Purchase_status varchar(10),
Purchase_Return_Description varchar(100),
Last_Updated_User varchar(20),
Last_Updated_Date date,
CONSTRAINT FK_GN_NO
FOREIGN KEY (GRN_NO)
REFERENCES GRN(GRN_ID),
CONSTRAINT FK_V_ID
FOREIGN KEY (Vendor_ID)
REFERENCES Vendor(Vendor_ID)
) ;
--13.—---------------------------------Purchase_Return_Products---------------------------------------
create table Purchase_Return_Products(
Purchase_return_id int,
Product_id int,
Quantity int,
PRIMARY KEY (Purchase_return_id, Product_id),
Last_Updated_User varchar(20),
Last_Updated_Date date,
CONSTRAINT FK_PurchaseReturn
FOREIGN KEY (Purchase_return_id)
REFERENCES Purchase_Return(Purchase_return_id)
on DELETE cascade,
CONSTRAINT FK_P_ID
FOREIGN KEY (Product_ID)
REFERENCES Products(Product_ID)
);
--14.—---------------------------------CustomSet_Products---------------------------------------
CREATE table CustomSet_Products(
Custom_Product_ID Int,
Sub_Product_ID Int,
quantity int,
Last_Updated_User varchar(20),
Last_Updated_Date date,
PRIMARY KEY (Custom_Product_ID, Sub_Product_ID),
CONSTRAINT FK_P_ID
FOREIGN KEY (Custom_Product_ID)
REFERENCES Products(Product_ID) ,
CONSTRAINT FK_S_P_ID
FOREIGN KEY (Sub_Product_ID)
REFERENCES Products(Product_ID)
);
--15.—---------------------------------Users ---------------------------------------
CREATE Table Users (
User_ID int Primary Key NOT NULL,
User_Name varchar(50) NOT NULL,
User_Password varchar(10) NOT NULL,
Status varchar(20)
);
--16.—---------------------------------Eusers ---------------------------------------
create table Eusers(
user_id serial primary key,
username varchar(30) unique not null,
mobile varchar(10),
email varchar(30),
password varchar(20) not null,
CONSTRAINT mobile_email_notnull CHECK (
NOT (
( mobile IS NULL OR mobile = '' )
AND
( email IS NULL OR email = '' )
)
));
--17.—---------------------------------Eorders ---------------------------------------
CREATE TABLE Eorders(
order_id serial primary key,
user_id int not null,
created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Amount numeric,
status varchar(20) DEFAULT 'processing',
CONSTRAINT FK_U_ID
FOREIGN KEY (user_id)
REFERENCES Eusers(user_id)
);
--18.—---------------------------------Eorder_products ---------------------------------------
create table Eorder_products(
order_id int,
product_id int,
count int not null,
PRIMARY KEY (order_id, product_id),
CONSTRAINT FK_O_ID
FOREIGN KEY (order_id)
REFERENCES Eorders(order_id) ,
CONSTRAINT FK_P_ID
FOREIGN KEY (product_id)
REFERENCES Products(Product_ID)
);
--19.—---------------------------------EIndents ---------------------------------------
CREATE Table EIndents (
Indents_ID serial PRIMARY KEY,
Indents_Date date,
Indents_Status VArChar(20),
User_ID Int,
Last_Updated_User varchar(20),
Last_Updated_Date date
);
--20.—-------------------------------------EIndents_Products---------------------------------------
CREATE Table EIndents_Products (
Indents_ID INT,
Indents_Products_ID int,
Indents_Products_Quantity Int,
PRIMARY KEY (Indents_ID, Indents_Products_ID),
CONSTRAINT FK_I_ID
FOREIGN KEY (Indents_ID)
REFERENCES EIndents(Indents_ID),
CONSTRAINT FK_P_ID
FOREIGN KEY (Indents_Products_ID)
REFERENCES Products(Product_ID));
--21.—---------------------------------StoreIssues ---------------------------------------
CREATE Table StoreIssues (
StoreIssue_ID serial PRIMARY KEY,
Indent_ID int,
StoreIssue_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
Amount numeric,
StoreIssue_Status varchar(20),
Last_updated_user varchar(20),
Last_updated_date date,
CONSTRAINT FK_I_ID
FOREIGN KEY (Indent_ID)
REFERENCES EIndents(Indents_ID)
);
--22.—---------------------------------StoreIssues_Products ---------------------------------------
CREATE Table StoreIssues_Products (
StoreIssue_ID INT,
Product_ID int,
Quantity Int,
PRIMARY KEY (StoreIssue_ID, Product_ID),
CONSTRAINT FK_SI_ID
FOREIGN KEY (StoreIssue_ID)
REFERENCES StoreIssues(StoreIssue_ID) ,
CONSTRAINT FK_P_ID
FOREIGN KEY (Product_ID)
REFERENCES Products(Product_ID)
);
--23.—---------------------------------Ecommerce_Stock ---------------------------------------
CREATE Table Ecommerce_Stock(
Products_ID int,
Batch_NO Int,
Product_Stock int,
Product_MRP numeric,
Product_Cost numeric,
Product_Sale_Price numeric,
Last_Updated_User varchar(20),
Last_Updated_Date date,
CONSTRAINT FK_PID
FOREIGN KEY (Products_ID)
REFERENCES Products(Product_ID),
Primary key(Products_ID,Batch_NO)
);











--Inserting Values for products_category

insert into products_category (product_category_id, product_category_name)
SELECT 101, 'Electronics' UNION all
SELECT 202, 'home' UNION all
select 303, 'personal care' UNION all
select 404, 'Appliances' UNION all
select 505, 'Daily Needs' UNION all
select 606, 'Sports' UNION all
select 707, 'Fashion';

--inserting values 887for Hsn_Code

insert into hsn_code(hsn_code,gst)
select 181818,18 union all
select 282828,28 UNION all
select 000000,0 union all
select 505050,5 union all
select 202020,2 union all
select 121212,12;

--Inserting Products

insert into products(product_id,product_name,product_description,product_category_id,product_hsn_code)
select 01,'MI Laptop','Its a mini Computer',101,181818 union all
select 02,'Realme Moblie','A Mobile  is a small, portable personal item with a screen',101,181818 union all
select 03,'Apple Smart Watch','A smart watch display time and also used to operate some moblie opertions',101,181818 union all
select 04,'Sony Camera','used to Click Good Pics',101,181818 union all
select 11,'Hindware Kitchen','used in kitchen',202,202020 union all
select 12,'Surya Lights','used to in dark to have some some sight',202,202020 union all
select 13,'SleepX Beds','have a comfort sleep',202,202020 union all
select 14,'Appolo Medicine','used when you are sick',202,202020 union all
select 21,'Loreal Skin Care','need a glow use this',303,202020 union all
select 22,'Loreal Hair Care','use and loose',303,202020 union all
select 23,'Fogg Fragrances','smell the delight',303,202020 union all
select 24,'Beardo Men Grooming','use the grooming andgetready to be the groom',303,202020 union all
select 31,'Mi Television','Watch the Show and get chill',404,282828 union all
select 32,' Comtron Fans','Feel the air',404,282828 union all
select 33,'Loyyod Ac','Be Cool in the Cool',404,282828 union all
select 34,'Samsung Refrigerators','keep it and get the Cooled out',404,282828 union all
select 35,'Samsung Washing Machine',' keep cloths in and give rest to the hands',404,282828 union all
select 41,'Cool cake','feel the bike',505,202020 union all
select 42,'Arun ice cream','take the cool in and be chilled',505,202020 union all
select 43,'Maggie noodeles','get it ready in 1min',505,202020 union all
select 44,'dal','try it with Mango pickle ',505,202020 union all
select 45,'rice','get all the portions inn',505,202020 union all
select 51,'Nike Sports Ware','Look Fit',606,505050 union all
select 52,'Nike Sports Shoes','Select the sports and the shoe',606,505050 union all
select 53,'Cricket Kit','Get the whole kit',606,505050 union all
select 54,'Dumbels Fitness Equipments','Get the Kit and be fit ',606,505050 union all
select 55,'Energo Supplements','Get the power and get fit',606,505050 union all
select 61,'Allen Solly Men ware','Look Fit',707,121212 union all
select 62,'Allen solly Women Ware','Select the sports and the shoe',707,121212 union all
select 63,'Allen SollyKids ware','Get the whole kit',707,121212;

--Inserting Users ID's

Insert into users(user_id,user_name,user_password,status)

--user id starting from 1 followed by 4numbers
	select 10001,'Madhusudhan Rao','12345678','Active' union ALL
	select 10002,'Bharth Krishna','12345678','NotActive' union All
	select 10003,'Bhavani','12345678','Active' union ALL
	select 10004,'Bhuvitha','12345678','NotActive' union All
	select 10005,'Hema','12345678','NotActive' union All
	select 10006,'Chamundeswari','12345678','Active' union ALL
	select 10007,'Thulasi','12345678','NotActive' union All
	select 10008,'Hanuman Naik','12345678','Active';
	
	
Insert into Vendor ( 
	Vendor_ID ,
	Vendor_Name ,
	Vendor_Address ,
	Vendor_PhoneNumber ,
	Status  ,
	User_ID )

select 10001,'Finney Solomon','Vijayawada',9012345678,'Active',10001 union All
	select 20001,'Nag Mahesh','Viziznagarm',9012345678,'NotActive',10002 union All
	select 20002,'Prasanna','Vizag',9012345678,'Active',10003 union ALL
	select 20003,'Ritesh','Vijayawada',9012345678,'NotActive',10004 union All
	select 20004,'Sai Krishna','Vizag',9012345678,'Active',10004 union ALL
	select 20005,'Sai Kumar','Viziznagarm',9012345678,'NotActive',10002 union All
	select 20006,'Harika','Chittor',9012345678,'Active',10001 union ALL
	select 20007,'Sujith','Srikakulam',9012345678,'NotActive',10003 union All
	select 20008,'Vinay','kurnool',9012345678,'Active' ,10001;



	
	

	
	




 Insert into Indents ( 
	
	Indents_ID ,
	Indents_Date,
	Indents_Status ,
	User_ID 
	
	
)


--indents id staring from 9001

select 9001, date(now()),'Active',10001  union all
select 9002, date(now()),'Active',10002 union all
select 9003, date(now()),'Active',10003 union all
select 9004, date(now()),'Active',10004 union all
select 9005, date(now()),'Active',10005 union all
select 9006, date(now()),'Active',10006 union all
select 9007, date(now()),'Active',10007 union all
select 9008, date(now()),'Active',10008 ;





insert into Indents_Products ( 
	
	Indents_ID ,
	Indents_Products_ID ,
	Indents_Products_Quantity )


select 9001,01,10 union all
select 9001,02,10 union all
select 9001,03,10 union all
select 9001,04,10 union all

select 9002,11,10 union all
select 9002,12,10 union all
select 9002,13,10 union all
select 9002,14,10 union all

select 9003,21,10 union all
select 9003,22,10 union all
select 9003,23,10 union all
select 9003,24,10 union all

select 9004,31,10 union all
select 9004,32,10 union all
select 9004,33,10 union all
select 9004,34,10 union all
select 9004,35,10 union all

select 9005,41,10 union all
select 9005,42,10 union all
select 9005,43,10 union all
select 9005,44,10 union all
select 9005,45,10 union all

select 9006,51,10 union all
select 9006,52,10 union all
select 9006,53,10 union all
select 9006,54,10 union all
select 9006,55,10 union all

select 9007,61,10 union all
select 9007,62,10 union all
select 9007,63,10 union all

select 9008,01,10 union all
select 9008,11,10 union all
select 9008,02,10 union all
select 9008,03,10 union all
select 9008,21,10 union all
select 9008,12,10 union all
select 9008,23,10 ;



Insert Into Purchase_Order ( 
	
	Purchase_Order_ID,
	Purchase_Order_Date ,
	Purchase_Order_Amount ,
	Vendor_ID ,
	Purchase_Order_Expected_Date ,
	Purchase_Order_Status ,
	user_id
	)

--purchase order starts from 5001


select 5001,date(now()),100000,20001,current_date + INTERVAL '7 day','Active',10001 union all
select 5002,date(now()),100000,20002,current_date + INTERVAL '7 day','Active',10002  union all
select 5003,date(now()),100000,20003,current_date + INTERVAL '5 day','Active',10003 union all
select 5004,date(now()),100000,20004,current_date + INTERVAL '7 day','Active',10004  union all
select 5005,date(now()),10000,20005,current_date + INTERVAL '4 day','Active',10005  union all
select 5006,date(now()),10000,20006,current_date + INTERVAL '6 day','Active',10006  union all
select 5007,date(now()),10000,20007,current_date + INTERVAL '8 day','Active',10007 ;


insert into Purchase_Order_Products( 
	Purchase_Order_ID ,
	Product_ID,
	Purchase_Order_Quantity,
	Negotiation_Price,
	Qunatity_Received
)

select 5001,01,10,48000,10 union all
select 5001,02,10,38000,10 union all
select 5001,03,10,138000,10 union all
select 5001,04,10,900,10 union all

select 5002,11,10,3500,10 union all
select 5002,12,10,350,10 union all
select 5002,13,10,48000,10 union all
select 5002,14,10,3800,10 union all

select 5003,21,10,480,10 union all
select 5003,22,10,480,10 union all
select 5003,23,10,480,10 union all
select 5003,24,10,480,10 union all

select 5004,31,10,18000,10 union all
select 5004,32,10,4000,10 union all
select 5004,33,10,48000,10 union all
select 5004,34,10,28000,10 union all
select 5004,35,10,18000,10 union all

select 5005,41,10,700,10 union all
select 5005,42,10,350,10 union all
select 5005,43,10,38,10 union all
select 5005,44,10,65,10 union all
select 5005,45,10,35,10 union all

select 5006,51,10,48000,10 union all
select 5006,52,10,350,10 union all
select 5006,53,10,4700,10 union all
select 5006,54,10,8500,10 union all
select 5006,55,10,3500,10 union all

select 5007,61,10,350,10 union all
select 5007,62,10,3500,10 union all
select 5007,63,10,350,10 ;



insert into   GRN ( 
	GRn_ID ,
	Grn_Date,
	Purchase_Order_ID,
	Grn_Amount ,
	Grn_Status  
	
	)
--GRN id starts from 3001

select 3001, date(now()), 5001,50000,'Active' union all
select 3002, date(now()), 5001,50000,'Active' union all
select 3003, date(now()), 5002,50000,'Active' union all
select 3004, date(now()), 5002,50000,'Active' union all
select 3005, date(now()), 5003,50000,'Active' union all
select 3006, date(now()), 5003,50000,'Active' union all
select 3007, date(now()), 5004,50000,'Active' union all
select 3008, date(now()), 5004,50000,'Active' union all
select 3009, date(now()), 5005,50000,'Active' union all
select 3010, date(now()), 5005,50000,'Active' union all
select 3011, date(now()), 5006,50000,'Active' union all
select 3012, date(now()), 5006,50000,'Active' union all
select 3013, date(now()), 5007,50000,'Active' union all
select 3014, date(now()), 5007,50000,'Active';



insert into  GRN_Products ( 
	Grn_ID ,
	Product_ID ,
	Batch_NO ,
	Quantity,
	Price,
	Gst ,
	Bonus
	
	)

select 3001,01,8123,5,49000,181818,0 union all
select 3001,02,8234,5,29000,181818,0 union all
select 3002,03,8345,5,149000,181818,0 union all
select 3002,04,8567,5,1000,181818,0 union all
select 3003,11,8456,5,4000,202020,0 union all
select 3003,12,8678,5,400,202020,0 union all
select 3004,13,8789,5,50000,202020,0 union all
select 3004,14,8147,5,5000,202020,0 union all
select 3005,21,8258,5,490,202020,0 union all
select 3005,22,8369,5,490,202020,0 union all
select 3005,23,8987,5,490,202020,0 union all
select 3006,24,8654,5,490,202020,0 union all
select 3006,31,8321,5,19000,282828,0 union all
select 3007,32,8159,5,4900,282828,0 union all
select 3007,33,8753,5,49000,282828,0 union all
select 3008,34,8842,5,29000,282828,0 union all
select 3008,35,8965,5,19000,282828,0 union all
select 3001,41,8842,5,750,202020,0 union all
select 3001,42,8571,5,400,202020,0 union all
select 3002,43,8862,5,40,202020,0 union all
select 3002,44,8196,5,70,202020,0 union all
select 3003,45,8367,5,40,202020,0 union all
select 3003,51,8958,5,50000,505050,0 union all
select 3004,52,8153,5,500,505050,0 union all
select 3004,53,8453,5,5000,505050,0 union all
select 3005,54,8756,5,10000,505050,0 union all
select 3005,55,8864,5,5000,505050,0 union all
select 3006,61,8456,5,500,121212,2 union all
select 3006,62,8457,5,500,121212,2 union all
select 3007,63,8458,5,500,121212,2 ;


insert into Purchase_Return (  
	Purchase_return_id  ,
	Purchase_return_date  ,
	GRN_NO,
	grn_cost ,
	Vendor_ID ,
	Purchase_status ,
	Purchase_Return_Description
)
 
--product id strating fron 7001
select 7001,date(now()),3001,50000,20001,'Active','Damage' union all
select 7002,date(now()),3004,10000,20004,'Active','Damage' union all
select 7003,date(now()),3008,20000,20001,'Active','Damage' union all
select 7004,date(now()),3006,1000,20003,'Active','Damage' ;


insert into Purchase_Return_products(
	Purchase_return_id,
	Product_id ,
	Quantity 
)

select 7001,01,1 union all
select 7002,52,2 union all
select 7003,34,1 union all
select 7004,61,1 union all
select 7004,62,1 
;


insert into eindents_products ( Indents_ID ,Indents_Products_ID ,Indents_Products_Quantity )
select 1,9,10 union all
select 1,10,10 union all
select 1,11,10 union all
select 1,12,10 union all
select 2,11,1 union all
select 2,12,5 union all
select 3,9,10 union all
select 3,11,10 union all
select 4,9,1;

insert into eindents(indents_date, indents_status, user_id, last_updated_user, last_updated_date)
select date(now()),'Active',10001,'ram',date(now()) union all
select date(now()),'Active',10002,'ram',date(now()) union all
select date(now()),'Active',10003,'ram',date(now()) union all
select date(now()),'Active',10004,'ram',date(now()) ;

insert into ecommerce_stock(Products_ID, Batch_NO, Product_Stock, Product_MRP,Product_Cost,Product_Sale_Price)
SELECT 9, 1, 15, 85000, 50000, 75000 UNION all
SELECT 10, 23, 150, 25000, 10000, 23000 UNION all
SELECT 11, 2, 10, 20000, 12000, 20000 UNION all
SELECT 12, 5, 40, 35000, 15000, 29000;

insert into products_stock(Products_ID, Batch_NO, Product_Stock, Product_MRP,Product_Cost,Product_Sale_Price)
SELECT 9, 1, 1500, 85000, 50000, 75000 UNION all
SELECT 10, 23, 500, 25000, 10000, 23000 UNION all
SELECT 11, 2, 900, 20000, 12000, 20000 UNION all
SELECT 12, 5, 400, 35000, 15000, 29000;

insert into products(product_name,product_description,product_category_id,product_hsn_code,product_type,product_reorder_level,Ecommerce_Reorder_Level,Product_Status)
select 'MI Laptop','Its a mini Computer',101,181818,'regular',400,45,'active' union all
select 'Realme Moblie','A Mobile  is a small, portable personal item with a screen',101,181818,'regular',600,60,'active' union all
select 'Apple Smart Watch','A smart watch display time and also used to operate some mobile opertions',101,181818,'regular',750,80,'active' union all
select 'Sony Camera','used to Click Good Pics',101,181818,'regular',300,80,'active';

