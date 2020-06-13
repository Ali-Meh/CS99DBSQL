create database [chainStoreDB];
use [chainStoreDB];
CREATE TABLE Store (
    Id int,
    Name varchar(255),
    ManagerId int  NOT NULL PRIMARY KEY,
    CityId int,
	ProvenceId int,
	Address varchar(255),

);
CREATE TABLE StoreStaff (
    Id int,
    Name varchar(255),
    ManagerId int  NOT NULL,
    CityId int,
	ProvenceId int,
	Address varchar(255),
);
CREATE TABLE Role (
	 Id int,
);
CREATE TABLE Costumer(
	 Id int,
);
CREATE TABLE Products(
	 Id int,
);
CREATE TABLE Category(
	 Id int,
);
CREATE TABLE Store_Product_Pivot(
	 Id int,
);
CREATE TABLE City(
	 Id int,
);
CREATE TABLE Province(
	 Id int,
);