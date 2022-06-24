--------------------------------------------------------
--  DDL for Table TRIPS
--------------------------------------------------------
drop table bycar;
drop table byplane;
drop table bytrain;
drop table trips;

  CREATE TABLE TRIPS 
   (	"TID" INTEGER, 
        "TRIPSTATE" VARCHAR2(10 BYTE), 
        "TRAVELMODE" VARCHAR2(6 BYTE), 
        "FARE" FLOAT(12),
        Primary key(TID)
   ); 
   
   CREATE TABLE ByCar 
   (	TID INTEGER, 
        RentalCompany VARCHAR2(50 BYTE), 
        Mileage Number(4,2),
        Foreign Key (TID) REFERENCES TRIPS(TID)
   );
   
   CREATE TABLE ByTrain
       (	TID INTEGER,
            Type VARCHAR2(50 BYTE), 
          Coach VARCHAR2(30 BYTE),
          TrainSpeed VARCHAR2(10 BYTE),
            NumberofStops NUMBER(12,0),
          Foreign Key (TID) REFERENCES TRIPS(TID)
   );
   
    CREATE TABLE ByPlane
   (	TID INTEGER, 
	Airline VARCHAR2(40 BYTE), 
  Class VARCHAR2(30 BYTE),
  LayoverTime FLOAT(10),
  Foreign Key (TID) REFERENCES TRIPS(TID)
   ); 
   


INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (1,'IL','Car',100);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (2,'CA','Plane',1020);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (3,'MD','Plane',1300);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (4,'MD','Train',568);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (5,'Non-US','Plane',2300);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (6,'IL','Train',256);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (7,'Non-US','Plane',5000);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (8,'NM','Train',13);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (9,'IN','Car',400);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (10,'Non-US','Train',229);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (11,'Non-US','Plane',4500);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (12,'Non-US','Train',258);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (13,'IL','Plane',640);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (14,'Non-US','Train',138);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (15,'IL','Car',380);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (16,'IL','Car',59);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (17,'Non-US','Plane',3700);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (18,'IN','Car',88);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (19,'MD','Plane',600);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (20,'IL','Car',75);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (21,'IL','Car',156);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (22,'Non-US','Train',40);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (23,'IL','Plane',900);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (24,'MD','Train',650);
INSERT INTO Trips (TID,TripState,TravelMode,Fare) VALUES (25,'CA','Car',114);

INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (1,'Budget',19.75);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (9,'Enterprise',19.75);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (15,'Almo',22.5);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (16,'Personal',30);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (18,'Enterprise',22.5);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (20,'Personal',29);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (21,'Personal',27);
INSERT INTO ByCar (TID,RentalCompany,Mileage) VALUES (25,'Enterprise',19.75);


INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (4,'Union Pacific Liner/Express','Chair car',50,4);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (6,'Amtrak/Express','Sleeper',30,3);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (8,'New Mexico Liner /Express','Chair car',50,2);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (10,'Japanese Nippon/SuperExpress','Chair car',70,5);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (12,'Indian Railways/Bullet','Chair car',25,18);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (14,'German Transit System/SuperFast','Sleeper',70,8);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (22,'Indian Railways/SuperFast','Sleeper',5,14);
INSERT INTO ByTrain (TID,Type,Coach,TrainSpeed,NumberOfStops) VALUES (24,'Amtrak/Regular','Sleeper',20,2);

INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (2,'SouthWest','Premium',4);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (3,'American Airlines','Business',3);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (5,'Emirates','Economy',5);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (7,'Lufthansa','Economy',6);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (11,'Swiss Air','Economy',10);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (13,'SouthWest','Premium',2);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (17,'Korean Air','Economy',3);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (19,'American Airlines','Economy',1);
INSERT INTO ByPlane (TID,Airline,Class,LayoverTime) VALUES (23,'Alaska Airlines','Economy',2.5);

--[SQL-SingleTable]
--1.[1pt] List car rental companies which have a mileage of at least 27 miles/gallon. 
SELECT ByCar.RentalCompany FROM ByCar WHERE (Mileage = 27) OR (Mileage > 27);
--2.[1pt] List trip IDs taken on train costing strictly more than $150. ?
SELECT Trips.TID FROM Trips WHERE (Trips.TravelMode = 'Train') AND (Trips.Fare > 150);
--3.[1pt] Find trip IDs and their fare that are not taken in the US i.e., `Non-US` trips.
SELECT Trips.TID, Trips.Fare FROM Trips WHERE Trips.TripState = 'Non-US';
--4.[2pt] Find the cheapest trip taken by each of air, rail, or car.
SELECT MIN(Fare),TravelMode FROM Trips
GROUP BY TravelMode;

--[SQL-Join]
--5.[1pt] Find the business class plane trip IDs that are greater than $1000. 
SELECT ByPlane.TID FROM ByPlane
INNER JOIN Trips
ON ByPlane.TID = Trips.TID
WHERE (ByPlane.Class='Business') AND (Trips.Fare > 1000);
--6.[2pt] Find any car trip more expensive than a trip taken on a train in the same state 
--or outside the country.----another self join, trips1 = train, trips2 = bycar
SELECT Trips1.TID,Trips1.TravelMode,Trips1.Fare, Trips2.TID,Trips2.TravelMode,Trips2.Fare, Trips2.TripState FROM Trips Trips1
INNER JOIN Trips Trips2 ON Trips1.TripState = Trips2.TripState
INNER JOIN ByTrain ON Trips1.TID = ByTrain.TID
INNER JOIN ByCar ON Trips2.TID = ByCar.TID
WHERE Trips1.TravelMode = 'Train' AND Trips2.TravelMode = 'Car'
AND Trips2.Fare > Trips1.Fare;


--7.[2pt] List pairs of distinct car trips that have exactly the same value of mileage.===============needs work ?
SELECT DISTINCT Trips1.TID, Trips2.TID FROM (Trips Trips1 INNER JOIN ByCar ByCar1 ON Trips1.TID = ByCar1.TID)
INNER JOIN (Trips Trips2 INNER JOIN ByCar ByCar2 ON Trips2.TID = ByCar2.TID)
ON ByCar1.Mileage = ByCar2.Mileage
WHERE Trips1.TID != Trips2.TID;
--ORDER BY car.TID

--Note a pair of distinct trips is of the format: (TID1, TID2).
--This distinct pair is not the same as the pair (TID2, TID1)

--8.[3pt] List pairs of distinct train trips that in which the speed of the first train trip is lower than 
--the speed of the second train trip. ?
SELECT DISTINCT Trips1.TID AS "First Trip Id",train1.trainspeed AS "speed 1", 
Trips2.TID AS "Second Trip Id" ,train2.trainspeed AS "speed 2"
FROM (Trips Trips1 INNER JOIN ByTrain Train1 ON Trips1.TID = Train1.TID) 
INNER JOIN (Trips Trips2 INNER JOIN ByTrain Train2 ON Trips2.TID = Train2.TID)
ON Trips1.TID != Trips2.TID
WHERE Train1.TrainSpeed < Train2.TrainSpeed;
--GROUP BY Trips1.TID,train1.trainspeed, Trips2.TID,train2.trainspeed HAVING Train1.Trainspeed<Train2.Trainspeed;

--9.[3pt] Find those pair of trips which occur in the same state and with the same mode of travel. 
--List such pairs only once. In other words, given a pair (TID1,TID2) do NOT list (TID2,TID1).
SELECT DISTINCT Trips1.TID, Trips2.TID FROM Trips Trips1
INNER JOIN Trips Trips2 ON Trips1.TID != Trips2.TID
WHERE (Trips1.TravelMode = Trips2.TravelMode) 
AND (Trips1.TripState = Trips2.TripState)
AND(Trips1.TID < Trips2.TID)
ORDER BY Trips1.TID,Trips2.TID;

--10.[4pt] Find a state in which trips have been taken by all three modes of transportation: ?train, plane, and car. 
--Note: Think 3-way self-joins with equality and non-equality join criteria.
SELECT DISTINCT Trips1.TripState,Trips1.TravelMode, 
Trips2.TripState,Trips2.TravelMode,
Trips3.TripState,Trips3.TravelMode 
FROM Trips Trips1
INNER JOIN Trips Trips2 ON Trips1.TripState = Trips2.TripState
INNER JOIN Trips Trips3 ON Trips2.TripState = Trips3.TripState
WHERE (Trips1.TravelMode < Trips2.TravelMode)
AND (Trips2.TravelMode < Trips3.TravelMode)
AND (Trips1.TravelMode < Trips3.TravelMode);
