INSERT INTO Customer(Cus_ID,Loca_ID,Cus_Name,Cus_Lname,Cus_Email,Cus_Adress,Cus_Username,Cus_Password,Cus_PhoneNumber)
VALUES(1,35,'Yusuf','Muslu','kafadangtsn.gmailcom','Maltepe emek caddesi','ysfbrnmsl','1234567','05454142191'),
(2,33,'Uður','Karasu','uureren@gmail.com','suadiye','ugureren33','4578963','05443219787'),
(3,35,'Semih','Selim','Selim61@gmail.com','Kadýköy','Semih6161','7894561','05478963232'),
(4,34,'Efe','Uçar','ucar3335@hotmail.com','Baþakþehir','efe3434','3216547','05214543636'),
(5,6,'Nisa','Fakülte','nisa0606@hotmail.com','Karaköy','Nisa0303','4587621','05336527584'),
(6,61,'Sergen' , 'Selim', 'sergense61@gmail.com', 'Maltepe','Sergen61','5461611','05345456161'),
(7,54, 'Rahmi' , 'Sönmez', 'rahmmisn21@outlook.com', 'Ümraniye','rahmisnm','4568412', '05315478769')


INSERT INTO Restaurant(Res_ID,Loca_ID,Res_Name,Res_Adress)
VALUES(1,34,'Frango','Kadýköy'),
(2,34,'Köfteci Selin','Göztepe'),
(3,35,'McGonalds','Konak'),
(4,35,'Starbucks','Karþýyaka'),
(5,33,'Salih Usta','Pozcu'),
(6,33,'Göksel Tantuni','Pozcu'),
(7,6,'Gobitte','Kýzýlay'),
(8,33,'12-15','Toroslar'),
(9,41,'Katýk Döner','Ýzmit'),
(10,1,'Sakatatçý Yaþar','Ceyhan'),
(11,61, 'Balýkçý Recai' , 'Yomra'),
(12,2,'Çiðköfteci Yaþar Usta','Adýyaman'),
(13,6,'Rice House','Kýzýlay')

INSERT INTO Menu(Menu_ID,Res_ID,Menu_Name)
VALUES(1,1,'Frango Menu' ),
(2,2,'Köfteci Selin Menu' ),
(3,3,'McGonalds Menu' ),
(4,4,'Starbucks Menu' ),
(5,5,'Salih Usta Menu' ),
(6,6,'Göksel Tantuni Menu' ),
(7,7,'Gobitte Menu' ),
(8,8,'12-15 Menu'),
(9,9,'Katýk Döner Menu'),
(10,10,'Sakatatçý Yaþar Menu'),
(11,11,'Balýkçý Recai Menu'),
(12,12,'Çiðköfteci  Menu'),
(13,13,'Rice House Menu')



INSERT INTO Ordering(Cus_ID,Res_ID,Food_ID,Order_Date,Order_Status,Order_Notes,Order_Amount)
VALUES(1,2,5,'2022/11/07' , 'Y' , NULL, 45.90),
(4,9,22,'2022/11/07' , 'N' , 'no greens' , 52.90),
(3,11,11,'2022/11/08' , 'Y' , 'no mayonnaise' , 75.90),
(4,7,22,'2022/11/10' , 'Y' , 'extra caramel' , 67.90),
(5,1,18,'2022/11/11' , 'P' , NULL , 61.90),
(4,9,21,'2022/11/11', 'P' , 'fast pls' , 33.99),
(6,10,1,'2022/11/11', 'P' , NULL , 38.99)


INSERT INTO Food(Food_ID,Menu_ID,Food_ingr,Food_Name)
VALUES
(1,10,'Rice,Bulgur,Olive Oil,Butter,Onion','Ezogelin Soup'),
(2,10,'Tomato,onion,carrot','Tomato Soup'),
(3,13,'Shallots, garlic, and white wine','Mussel'),
(4,10,'baby lamb sweetbread','Kokoreç'),
(5,2,'Mince,Garlic,Ground beef, onion','Akçaabat Meatball'),
(6,2,'Ground beef, onion, breadcrumbs','Ýnegöl Meatball'),
(7,12,'Raw Bulgur,Onion,Garlic','Raw Meatball'),
(8,4,'cream cheese,sugar,vanilla,blueberry','Blueeberry cake'),
(9,4,'Cream cheese,sugar,eggs,graham cracker','Cheesecake'),
(10,4,'Apples,sugar,butter,cinnamon','Apple Pie'),
(11,11,'salmon fillets,Salt and pepper,garlic','Salmon'),
(12,2,'mackerel fillets,Salt and pepper,olive oil','Mackerel'),
(13,3,'ground beef,shredded lettuce,American cheese','Bigmac Burger'),
(14,3,'vegetables','Vegetable Burger'),
(15,3,'ground beef,onion,egg,Breadcrumbs','Meat Burger'),
(16,3,'Pepper,breadcrumbs, egg, herbs','Chicken Burger'),
(17,13,'Spaghetti,Ground beef,Onion,Garlic','Spaghetti Bolognaise'),
(18,6,'Fettuccine pasta,heavy cream,garlic,salt,pepper','Fettuccine Alfredo'),
(19,13,'Chickpeas, Rice, onion, garlic, tomatoes','Chickpea Rice'),
(20,13,'Chicken, Rice, onion, garlic, chicken','Chicken Rice'),
(21,9,'Doner meat, pita bread, lettuce','Doner'),
(22,7,'Doner meat, pita bread, yogurt, butter','Iskender Kebab'),
(23,13,' tomato sauce, cheese, mixed vegetables','Veggie Pizza'),
(24,13,'tomato sauce, cheese, meat','Meat Pizza'),
(25,4,'Espresso, milk, vanilla syrup','Vanilla Latte'),
(26,4,'Espresso, milk,whipped cream','Chocolate Mocha'),
(27,4,'Espresso, hot water','Americano')


INSERT INTO Rating(Cus_ID,Res_ID,Food_ID,Comments)
VALUES(1,2,5,'wrong order'),
(4,9,21,'excellent'),
(3,11,11,'i liked it'),
(4,7,22,'I will never order again.'),
(4,9,21,NULL),
(6,10,1,' I strongly recommend'),
(4,9,21,NULL)

INSERT INTO Coupon(Res_ID,Coupon_Date,Coupone_Amount)
VALUES(1,'2023/02/25',20),
(2,'2023/03/30',30),
(3,'2023/04/10',50)

CREATE INDEX ix_name ON Customer (Cus_Name, Cus_Lname)
CREATE INDEX ix_fname ON Food(Food_Name)
CREATE INDEX ix_date ON Ordering(Order_Date)
CREATE INDEX ix_res ON Restaurant(Loca_ID,Res_Adress)
CREATE INDEX ix_status ON Ordering(Order_Status) 
CREATE INDEX ix_Menu ON Menu(Menu_Name)
CREATE INDEX ix_Rat ON Rating(Comments)
CREATE INDEX ix_ingr ON Food(Food_ingr)
CREATE INDEX ix_mail ON Customer(Cus_Email)
CREATE INDEX ix_username ON Customer(Cus_Username)

UPDATE Customer
SET Cus_Name='Uður Eren'
WHERE Cus_Lname='Karasu' 

UPDATE Customer
SET Cus_Email='trabzon61@gmail.com'
WHERE Cus_ID=3;

UPDATE Restaurant 
SET Res_Name='McDonadls'
WHERE Res_Adress='Konak' ;

UPDATE Customer
SET Cus_PhoneNumber='05336527585'
WHERE Cus_Email='nisa0606@hotmail.com';

UPDATE Menu
SET Menu_Name='McdDonalds Menu'


DELETE FROM Customer WHERE Cus_Name='Sergen' AND Cus_Lname='Selim';
DELETE FROM Restaurant WHERE Res_Name='Starbuck' AND Loca_ID=35;
DELETE FROM Locatýon WHERE loc_ID=9 AND loc_Name='Aydýn';
DELETE FROM Rating WHERE Cus_ID=4 AND Comments='I will never order again.';
DELETE FROM Food WHERE Menu_ID=3 AND Food_ingr='vegetables' AND Food_Name='Vegetable Burger';
