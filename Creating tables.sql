DROP TABLE OrderDetail
DROP TABLE Payment
DROP TABLE CreditCard
DROP TABLE Coupon
DROP TABLE Rating
DROP TABLE Ordering
DROP TABLE FoodCategory
DROP TABLE Food
DROP TABLE Menu
DROP TABLE Restaurant
DROP TABLE Customer
Drop TABLE Locatýon



CREATE TABLE Locatýon(
loc_ID tinyint PRIMARY KEY ,
loc_Name nvarchar(20) NOT NULL,
)

ALTER TABLE LOCATION ALTER COLUMN loc_ID tinyint NOT NULL

INSERT INTO Locatýon(loc_ID,loc_Name)
VALUES(45,'Manisa'),(35,'Ýzmir'),(33,'Mersin'),(34,'Ýstanbul'),(41,'Kocaeli'),(42,'Konya'),(31,'Hatay'),(6,'Ankara'),(1,'Adana'),
(7,'Antalya'),(9,'Aydýn'),(61,'Trabzon'),(54,'Sakarya'),(2,'Adýyaman')



ALTER TABLE Locatýon
ADD UNIQUE (loc_Name)

CREATE TABLE Restaurant(
Res_ID tinyint PRIMARY KEY  ,
Res_Name nvarchar(50) NOT NULL,
Res_Adress nvarchar(50) NOT NULL,
Loca_ID tinyint,
 FOREIGN KEY (Loca_ID) REFERENCES Locatýon(loc_ID)
)

CREATE TABLE Customer(
Cus_ID tinyint PRIMARY KEY,
Loca_ID tinyint,
Cus_Name nvarchar(20) NOT NULL,
Cus_Lname nvarchar(10) NOT NULL,
Cus_Username nvarchar(10) NOT NULL,
Cus_Password char(7) NOT NULL,
Cus_Email nvarchar(50) NOT NULL,
Cus_PhoneNumber char(11) NOT NULL,
Cus_Adress nvarchar(50) NOT NULL,
FOREIGN KEY(Loca_ID) REFERENCES Locatýon(loc_ID)
)

ALTER TABLE Customer
ADD CONSTRAINT UK_Customer UNIQUE(Cus_Username,Cus_Email,Cus_PhoneNumber)

CREATE TABLE Menu(
Menu_ID tinyint PRIMARY KEY ,
Res_ID tinyint,
Menu_Name nvarchar(20) NOT NULL,
FOREIGN KEY(Res_ID) REFERENCES Restaurant(Res_ID)
)

CREATE TABLE Food(
Food_ID tinyint PRIMARY KEY ,
Menu_ID tinyint,
Food_ingr nvarchar(70) NOT NULL,
Food_Name nvarchar(20) NOT NULL,
FOREIGN KEY(Menu_ID) REFERENCES Menu(Menu_ID)
)
ALTER TABLE Food
ADD UNIQUE(Food_Name)

CREATE TABLE FoodCategory(
Category_ID tinyint PRIMARY KEY IDENTITY(1,1),
Food_ID tinyint,
Category_Name nvarchar(20) NOT NULL,
FOREIGN KEY(Food_ID) REFERENCES Food(Food_ID)
)

CREATE TABLE Ordering(
Order_ID tinyint PRIMARY KEY IDENTITY(10,1),
Cus_ID tinyint,
Res_ID tinyint,
Food_ID tinyint,
Order_Date date NOT NULL,
Order_Status char(1) NOT NULL,
Order_Notes varchar(15),
Order_Amount money NOT NULL,
CONSTRAINT status_check CHECK( Order_Status IN('Y','N','P')),
FOREIGN KEY(Cus_ID) REFERENCES Customer(Cus_ID),
FOREIGN KEY(Res_ID) REFERENCES Restaurant(Res_ID),
FOREIGN KEY(Food_ID) REFERENCES Food(Food_ID)
--Y=Yes N= No P=Preparing
)
CREATE TABLE Rating(
Rat_ID tinyint PRIMARY KEY IDENTITY(1,1),
Cus_ID tinyint,
Res_ID tinyint,
Food_ID tinyint,
Comments nvarchar(50),
FOREIGN KEY(Cus_ID) REFERENCES Customer(Cus_ID),
FOREIGN KEY(Res_ID) REFERENCES Restaurant(Res_ID),
FOREIGN KEY(Food_ID) REFERENCES Food(Food_ID)
)
CREATE TABLE Coupon(
Coupon_ID tinyint PRIMARY KEY IDENTITY(1,1),
Coupone_Amount money,
Coupon_Date date NOT NULL,
Res_ID tinyint,
FOREIGN KEY(Res_ID) REFERENCES Restaurant(Res_ID)
)
CREATE TABLE CreditCard(
Card_No char(16) PRIMARY KEY,
Cus_ID tinyint,
Name_On_Card nvarchar(20) NOT NULL,
Exp_Date date NOT NULL,
cvv tinyint NOT NULL,
FOREIGN KEY(Cus_ID) REFERENCES Customer(Cus_ID)
)
CREATE TABLE Payment(
Payment_ID tinyint PRIMARY KEY IDENTITY(1,1),
Order_ID tinyint,
Card_No char(16),
p_Amount money NOT NULL,
p_Date date NOT NULL,
Coupon_ID tinyint,
FOREIGN KEY(Order_ID) REFERENCES Ordering(Order_ID),
FOREIGN KEY(Card_No) REFERENCES CreditCard(Card_No),
FOREIGN KEY(Coupon_ID) REFERENCES Coupon(Coupon_ID),
)
CREATE TABLE OrderDetail(
odet_ID tinyint PRIMARY KEY IDENTITY(1,1),
Order_ID tinyint,
FOREIGN KEY(Order_ID) REFERENCES Ordering(Order_ID)
)
