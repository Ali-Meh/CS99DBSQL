use [chainStoreDB];
--insert provinces
INSERT INTO Provinces (Name) VALUES ('azarbaijan-shargi'); 
INSERT INTO Provinces (Name) VALUES ('azarbijan-garbi');  
INSERT INTO Provinces (Name) VALUES ('tehran');  
INSERT INTO Provinces (Name) VALUES ('alborz');  
INSERT INTO Provinces (Name) VALUES ('gazvin');  
INSERT INTO Provinces (Name) VALUES ('ilam');  
INSERT INTO Provinces (Name) VALUES ('sistan');  
INSERT INTO Provinces (Name) VALUES ('bushehr'); 
INSERT INTO Provinces (Name) VALUES ('gorgan'); 
--insert Cities
INSERT INTO Cities (Name,lat,lan,ProvinceId) VALUES ('tabriz',45.596,50.695,1); 
INSERT INTO Cities (Name,lat,lan,ProvinceId) VALUES ('maragheh',46.596,50.695,1); 
INSERT INTO Cities (Name,lat,lan,ProvinceId) VALUES ('maragheh',46.596,56.695,1); 
INSERT INTO Cities (Name,lat,lan,ProvinceId) VALUES ('oromie',43.596,53.695,2); 
INSERT INTO Cities (Name,lat,lan,ProvinceId) VALUES ('tehran',47.596,51.695,3); 
INSERT INTO Cities (Name,lat,lan,ProvinceId) VALUES ('karaj',48.596,50.695,4); 
INSERT INTO Cities (Name,lat,lan,ProvinceId) VALUES ('gazvin',42.596,52.695,5); 
INSERT INTO Cities (Name,lat,lan,ProvinceId) VALUES ('takestan',43.596,51.695,5); 
INSERT INTO Cities (Name,lat,lan,ProvinceId) VALUES ('gorgan',49.596,50.695,9); 

--insert Categories
INSERT INTO Categories (Name) VALUES ('digital'); 
INSERT INTO Categories (Name,ParentId) VALUES ('mobile',1); 
INSERT INTO Categories (Name,ParentId) VALUES ('storage',1);--3
INSERT INTO Categories (Name,ParentId) VALUES ('USB',3);
INSERT INTO Categories (Name,ParentId) VALUES ('HDD',3);--5
INSERT INTO Categories (Name,ParentId) VALUES ('wearings',1);
INSERT INTO Categories (Name,ParentId) VALUES ('smartwatch',6);-->7
INSERT INTO Categories (Name) VALUES ('cars and tools'); 
INSERT INTO Categories (Name,ParentId) VALUES ('cars',8); --9
INSERT INTO Categories (Name,ParentId) VALUES ('gearbox',8);
INSERT INTO Categories (Name,ParentId) VALUES ('anti theift device',8);-->11
INSERT INTO Categories (Name) VALUES ('housing'); -->12
INSERT INTO Categories (Name,ParentId) VALUES ('lightining',12); 
INSERT INTO Categories (Name,ParentId) VALUES ('sterio',12);--14
INSERT INTO Categories (Name,ParentId) VALUES ('tv',12);
INSERT INTO Categories (Name) VALUES ('food and drink'); -->16
INSERT INTO Categories (Name,ParentId) VALUES ('vegtiable',1); 
INSERT INTO Categories (Name,ParentId) VALUES ('fast food',1);--18
INSERT INTO Categories (Name,ParentId) VALUES ('diary',3);

--insert Products
INSERT INTO Products (Name,BarCode,CategoryId) 
VALUES ('samsung g3','123456789987',2),
('Adata 32 GB usb 3.1','1234564548',4),
('Silicon power 16 GB usb 3.0','23425235',4),
('pride 85','3453426346',9),
('pegout 405','23453426346',9),
('pegout 206','234534253246',9),
('LG 42 LED','32453453245',15),
('LG 52 LED','768678678678',15),
('LG 36 LED','2345345345',15),
('sumsung 42 LED','874845121',15),
('chesse','9632258721',19),
('milk','13564649',19),
('butter','35453324234',19);

--insert Roles
INSERT INTO Roles (Name,PermCode) VALUES ('store manager','MANAGER');
INSERT INTO Roles (Name,PermCode) VALUES ('store seller','SELLER');--2
INSERT INTO Roles (Name,PermCode) VALUES ('stock clerk','STOCK');
INSERT INTO Roles (Name,PermCode) VALUES ('Delivery attendence','DELIVERY');--4

--insert Costumers
INSERT INTO Costumers (FirstName,LastName,DeliveryAddress,UserName,Password,ContactInfo) 
VALUES ('UNKNOWN','UNKNOWN','DeliveryAddress','','','DeliveryAddress');

--insert Coupons
INSERT INTO Coupons (Code,Count,Amount,ExpireDate) VALUES ('Summer99Corona',99,900000,'2020-09-30T00:00:00.000+04:30');
--insert Stores
INSERT INTO Stores (Name,Address,CityId) 
VALUES ('branch #1','1st bulvare turn left',1);
INSERT INTO Stores (Name,Address,CityId) 
VALUES ('branch #2','2nd bulvare turn right',5);
INSERT INTO Stores (Name,Address,CityId) 
VALUES ('branch #3','3rd bulvare turn left',9);


--insert Staff
INSERT INTO Staff (FirstName,LastName,UserName,Password,ContactInfo,RoleId,StoreId) 
VALUES ('ali','mahdavi','ali','123456','+98938***8689',1,1);
INSERT INTO Staff (FirstName,LastName,UserName,Password,ContactInfo,RoleId,StoreId) 
VALUES ('mohammad','abbassi','mohammad','123456','+98938***9989',2,1);
INSERT INTO Staff (FirstName,LastName,UserName,Password,ContactInfo,RoleId,StoreId) 
VALUES ('mohammad','agajani','agajani','123456','+98939***9999',3,2);


--insert Store_Product
INSERT INTO Store_Product (BuyPrice,SellPrice,Count,ExpireDate,ProductId,StoreId) 
VALUES (3900000,4100000,20,'',1,1),
(550000,700000,20,'',2,1),
(200000,250000,20,'',3,1),
(100000000,101000000,20,'',4,1),
(140000000,150000000,20,'',5,1),
(140000000,146000000,20,'',6,1),
(9000000,10000000,20,'',7,1),
(12000000,12600000,20,'',8,1);

--insert Recipts
INSERT INTO Recipts (TotalPrice,PayablePrice,Status,CouponId,CustomerId) 
VALUES (4100000,3900000,1,null,1),
(4100000,3900000,1,null,1),
(4100000,3900000,1,1,1);


--insert ReciptContent
INSERT INTO ReciptContent (Price,Count,ReciptId,StoreProductId) 
VALUES (4100000,20,1,1),
(56000,15,1,2),
(36900,20,1,3),
(953612,10,1,4),
(8523620,5,2,5),
(159000,20,2,1),
(1369200,6,2,2),
(369000,2,2,3),
(250000,20,2,4),
(450000,3,2,5);





--INSERT INTO table_name (column1, column2, column3, ...) VALUES (value1, value2, value3, ...); 