use [chainStoreDB];


/*
**login
*/
DECLARE @usr varchar(30) = 'ali'; 
DECLARE @password varchar(30) = '123456'; 
select UserName,Password from Staff where UserName=@usr and password=@password;

/*
manager queries 
*/
select Staff.Id,FirstName,LastName,Password,ContactInfo,Stores.Name AS StoreName,Stores.Address,Cities.Name As cityName, lat,lan,Provinces.Name As ProvinceName  from Staff 
join Roles on Roles.Id=Staff.RoleId 
join Stores on Stores.Id=Staff.Id 
join Cities on Stores.CityId=Cities.Id 
join Provinces on Provinces.Id=ProvinceId

/*
seller
*/
declare @product_barcode varchar(50) ='23453426346';
declare @NewlyCreatedReciptId int;

--search by product barcode
select * from Products 
join Store_Product on ProductId=Store_Product.ProductId
where BarCode = @product_barcode order by Store_Product.ExpireDate;

--create recipt for costumer
INSERT INTO Recipts (TotalPrice,PayablePrice,Status,CouponId,CustomerId)
VALUES (0,0,1,null,1);

--https://stackoverflow.com/a/58798162
--SELECT IDENT_CURRENT('Recipts')

--add products to recipt by product barcode
INSERT INTO ReciptContent (Price,Count,ReciptId,StoreProductId)
select SellPrice,5,IDENT_CURRENT('Recipts'),Id from Products where BarCode =@product_barcode ;

--Select all Products in Recipt
Select * from ReciptContent
join Store_Product on Store_Product.Id=StoreProductId
join Products on Products.Id=ProductId
where ReciptId=IDENT_CURRENT('Recipts');

--select Recipt total price and update with coupon
declare @CouponCode varchar(50) ='Summer99Corona';
select * from Recipts where Id=IDENT_CURRENT('Recipts');
BEGIN TRANSACTION;  
	update Recipts set CouponId=(SELECT Id FROM Coupons WHERE Coupons.Code=@CouponCode and Coupons.Count>0)
	update Coupons set Count=Count-1 where Id=(SELECT Id FROM Coupons WHERE Coupons.Code=@CouponCode)
COMMIT; 
select * from Recipts where Id=IDENT_CURRENT('Recipts');
SELECT * FROM Coupons WHERE Coupons.Code=@CouponCode

/*
	manager
*/
--create Provinces
insert into Provinces (Name) values ('اذر بایجان شرقی');
--search for Provinces
select * from Provinces where Name Like '%اذر%';
--view Provinces
select * from Provinces where Id=5;
--update Provinces
update Provinces set Name = 'اذر بایجان غربی' where Id=2;


--create cities
insert into Cities(Name,lan,lat,ProvinceId) values ('تبریز',47.26,43.9852,IDENT_CURRENT('Provinces'));
--search for cities
select * from Cities where Name Like '%تب%';
--view city
select * from Cities where Id=5;
--update city
update Cities set Name = 'ارومیه',lat=99.12,ProvinceId=2 where Id=2;


--create Stores
INSERT INTO Stores (Name,Address,CityId) VALUES ('شعبه باغمشه','تبریز باغمیشه',2);
--search for Stores
select * from Stores where Name Like '%با%' and Address like '%%';
--view Stores
select * from Stores where Id=1;
--update Stores
update Stores set Name = 'ارومیه',Address=99.12,CityId=1 where Id=2;

--create Role
INSERT INTO Roles (Name,PermCode) VALUES ('فروشنده','SELLER');--چون قبلا وارد دشه است نباید قبول کندSELLER
--search for Role
select * from Roles where PermCode='SELLER'
--Delete Role
Delete from Staff Where RoleId=2;
Delete from Roles  Where PermCode='SELLER';
--update Role
update Roles set Name='فروشنده' where PermCode='SELLER';

--create Staff
INSERT INTO Staff (FirstName,LastName,UserName,Password,ContactInfo,RoleId,StoreId) 
VALUES ('علی','مهدوی','Ali2','123456','+98938***8689',1,1);
--search for Staff
select * from Staff where FirstName like '%%';
select * from Staff where RoleId=1 and StoreId=1;--مدیر فروشگاه 1
select * from Staff where StoreId=1;--تمام کارکنان فروشگاه 1
--Delete Staff
Delete from Staff Where RoleId=2;
--update Staff
update Staff set StoreId =1 where Id=3;


--profit 
Select Store_Product.*,ReciptContent.Count,ReciptContent.Price from Store_Product 
join ReciptContent on Store_Product.Id=ReciptContent.StoreProductId
where PurchaseDate between '2020-06-23' and '2020-06-25';
--------------------------------------------------------
Select sum(ReciptContent.Count*ReciptContent.Price),ReciptContent.StoreProductId from Store_Product 
join ReciptContent on Store_Product.Id=ReciptContent.StoreProductId
where PurchaseDate between '2020-06-23' and '2020-06-25'
group by ReciptContent.StoreProductId;--select product buy price and reduct from some
-------------------------------------------------------
Select sum(ReciptContent.Count*ReciptContent.Price)as totalsell,
sum(ReciptContent.Count*Store_Product.BuyPrice)as totalExpence,
ReciptContent.StoreProductId
from Store_Product 
join ReciptContent on Store_Product.Id=ReciptContent.StoreProductId
where PurchaseDate between '2020-06-23' and '2020-06-25'
group by ReciptContent.StoreProductId;-- add product name and group by that



--report



/*
	Storage
*/
--create category
insert into Categories (Name,ParentId) values ('شیر',19)
--search category
;WITH CTE AS
(
    SELECT id, name, name as path, ParentId
    FROM Categories 
    WHERE ParentId = 3 --set parentId
    UNION ALL
    SELECT t.id, t.name, cast(cte.path +' | '+ t.name as varchar(255)), t.ParentId
    FROM Categories t
    JOIN CTE ON t.ParentId = CTE.id
)
SELECT id, name, path
FROM CTE
--update catagory
update Categories set Name='موبایل' where Id=2

--create Product
insert into Products (Name,CategoryId) values ('GLX spider',2)
--search Product
select * from Products Where CategoryId=2;
--update Product
update Products set Name ='Nexus 5' where Id=1;


--create Store_Product
insert into Store_Product (Count,BuyPrice,SellPrice,BarCode,ExpireDate,ProductId,StoreId) values(50,10000,11000,'20200625258','2022-06-25',IDENT_CURRENT('Products'),IDENT_CURRENT('Stores'))
--search Store_Product
select * from Store_Product where ProductId=IDENT_CURRENT('Products') and StoreId=IDENT_CURRENT('Stores')
select sum(count),Products.Id,Products.Name from Store_Product join Products on ProductId=Products.Id where StoreId=1 group by Products.Id,Products.Name

--update Store_Product






select * from master.INFORMATION_SCHEMA.TABLES;