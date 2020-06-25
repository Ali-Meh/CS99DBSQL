--create database [chainStoreDB];ALTER DATABASE [chainStoreDB] COLLATE Persian_100_CI_AI_KS_WS_SC
use [chainStoreDB];
CREATE TABLE Provinces(
	 Id int IDENTITY(1,1) PRIMARY KEY,
	 Name varchar(255),
);

CREATE TABLE Cities(
	 Id int IDENTITY(1,1) PRIMARY KEY,
	 Name varchar(255),
	 lat float,
	 lan float,
	 ProvinceId int FOREIGN KEY REFERENCES Provinces(Id),
);

CREATE TABLE Categories(
	 Id int IDENTITY(1,1) PRIMARY KEY,
	 Name varchar(255),
	 ParentId int FOREIGN KEY REFERENCES Categories(Id),
);

CREATE TABLE Products(
	 Id int IDENTITY(1,1) PRIMARY KEY,
	 Name varchar(255),
	 CategoryId int FOREIGN KEY REFERENCES Categories(Id),
);

CREATE TABLE Roles(
	 Id int IDENTITY(1,1) PRIMARY KEY,
	 Name varchar(255),
	 PermCode varchar(255) NOT NULL UNIQUE,
);

CREATE TABLE Costumers(
	 Id int IDENTITY(1,1) PRIMARY KEY,
	 FirstName varchar(255),
	 LastName varchar(255),
	 DeliveryAddress varchar(255),
	 UserName varchar(255),
	 Password varchar(255) NOT NULL,
	 ContactInfo varchar(255),
);
CREATE TABLE Coupons(
	 Id int IDENTITY(1,1) PRIMARY KEY,
	 Code varchar(255),
	 Amount money,
	 Count int,
	 ExpireDate datetimeoffset,
);
CREATE TABLE Recipts(
	 Id int IDENTITY(1,1) PRIMARY KEY,
	 TotalPrice money,
	 PayablePrice money,
	 Status BIT DEFAULT 1,--0=notsucceded , 1= pending ,2= successful
	 CouponId int FOREIGN KEY REFERENCES Coupons(Id) default null,
	 CustomerId int FOREIGN KEY REFERENCES Costumers(Id),
	 PurchaseDate datetimeoffset DEFAULT GETDATE(),
);
CREATE TABLE Stores(
	 Id int IDENTITY(1,1) PRIMARY KEY,
	 Name varchar(255),
	 Address varchar(255),
	 CityId int FOREIGN KEY REFERENCES Cities(Id),
)
CREATE TABLE Staff(
	 Id int IDENTITY(1,1) PRIMARY KEY,
	 FirstName varchar(255),
	 LastName varchar(255),
	 UserName varchar(255),
	 Password varchar(255) NOT NULL,
	 ContactInfo varchar(255),
	 RoleId int FOREIGN KEY REFERENCES Roles(Id),
	 StoreId int FOREIGN KEY REFERENCES Stores(Id),
);

CREATE TABLE Store_Product(
	 Id int IDENTITY(1,1) PRIMARY KEY,
	 BarCode nvarchar(255),
	 BuyPrice money,
	 SellPrice money,
	 Count int,
	 ExpireDate datetimeoffset,
	 PurchaseDate datetimeoffset DEFAULT GETDATE(),
	 ProductId int FOREIGN KEY REFERENCES Products(Id),
	 StoreId int FOREIGN KEY REFERENCES Stores(Id),
)
CREATE TABLE ReciptContent(
	 Id int IDENTITY(1,1) PRIMARY KEY,
	 Price money,
	 Count int,
	 ReciptId int FOREIGN KEY REFERENCES Recipts(Id),
	 StoreProductId int FOREIGN KEY REFERENCES Store_Product(Id),
	 --ManagerId int FOREIGN KEY REFERENCES Staff(Id),
)


--------------ALTERS
--ALTER TABLE Stores
--ADD FOREIGN KEY (ManagerId) REFERENCES Staff(Id);

--------------INDEXES
CREATE UNIQUE INDEX UserNameIndex
ON Costumers (UserName); 

CREATE UNIQUE INDEX UserNameIndex
ON Staff (UserName); 

CREATE UNIQUE INDEX CouponCodeIndex
ON Coupons (Code); 

CREATE UNIQUE INDEX BarCodeIndex
ON Store_Product(BarCode); 

--triggers