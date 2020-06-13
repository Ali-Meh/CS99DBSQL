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

--insert Categories
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('samsung g3',3900000,4100000,2);
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('diary',3999,4990,1);
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('diary',3999,4990,1);
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('diary',3999,4990,1);
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('diary',3999,4990,1);
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('diary',3999,4990,1);
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('diary',3999,4990,1);
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('diary',3999,4990,1);
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('diary',3999,4990,1);
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('diary',3999,4990,1);
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('diary',3999,4990,1);
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('diary',3999,4990,1);
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('diary',3999,4990,1);
INSERT INTO Products (Name,BuyPrice,SellPrice,CategoryId) VALUES ('diary',3999,4990,1);


--INSERT INTO table_name (column1, column2, column3, ...) VALUES (value1, value2, value3, ...); 