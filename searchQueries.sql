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
select * from Store_Product where BarCode = @product_barcode;

--create recipt for costumer
INSERT INTO Recipts (TotalPrice,PayablePrice,Status,CouponId,CustomerId)
VALUES (0,0,1,null,1);

--https://stackoverflow.com/a/58798162
--SELECT IDENT_CURRENT('Recipts')

--add products to recipt by product barcode
INSERT INTO ReciptContent (Price,Count,ReciptId,StoreProductId)
select SellPrice,5,IDENT_CURRENT('Recipts'),Id from Store_Product where BarCode =@product_barcode ;

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


select * from master.INFORMATION_SCHEMA.TABLES;