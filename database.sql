-- DROP TABLES
DROP TABLE IF EXISTS `appointments`;

DROP TABLE IF EXISTS `customers`;

DROP TABLE IF EXISTS `first_level_divisions`;

DROP TABLE IF EXISTS `countries`;

DROP TABLE IF EXISTS `users`;

DROP TABLE IF EXISTS `contacts`;



-- CREATE TABLES

-- countries 
CREATE TABLE `countries` (
  `Country_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Country` varchar(50) NOT NULL,
  `Create_Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Created_By` varchar(50) DEFAULT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Last_Updated_By` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Country_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb4;

-- first_level_divisions
CREATE TABLE `first_level_divisions` (
  `Division_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Division` varchar(50) NOT NULL,
  `Create_Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Created_By` varchar(50) DEFAULT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Last_Updated_By` varchar(50) DEFAULT NULL,
  `COUNTRY_ID` int(11) NOT NULL,
  PRIMARY KEY (`Division_ID`),
  KEY `COUNTRY_ID` (`COUNTRY_ID`),
  CONSTRAINT `first_level_divisions_ibfk_1` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `countries` (`Country_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- customers
CREATE TABLE `customers` (
  `Customer_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Customer_Name` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Postal_Code` varchar(50) NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Create_Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Created_By` varchar(50) DEFAULT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Last_Updated_By` varchar(50) DEFAULT NULL,
  `Division_ID` int(10) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  KEY `Division_ID` (`Division_ID`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`Division_ID`) REFERENCES `first_level_divisions` (`Division_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- users
CREATE TABLE `users` (
  `User_ID` int(10) NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(50) DEFAULT NULL,
  `Password` text,
  `Create_Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Created_By` varchar(50) DEFAULT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Last_Updated_By` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `User_Name` (`User_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- contacts
CREATE TABLE `contacts` (
  `Contact_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Contact_Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Contact_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- appointments
CREATE TABLE `appointments` (
  `Appointment_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Location` varchar(50) NOT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Start` datetime DEFAULT CURRENT_TIMESTAMP,
  `End` datetime DEFAULT CURRENT_TIMESTAMP,
  `Create_Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Created_By` varchar(50) DEFAULT NULL,
  `Last_Update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Last_Updated_By` varchar(50) DEFAULT NULL,
  `Customer_ID` int(10) DEFAULT NULL,
  `User_ID` int(10) DEFAULT NULL,
  `Contact_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`Appointment_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Contact_ID` (`Contact_ID`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`),
  CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`Contact_ID`) REFERENCES `contacts` (`Contact_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- INSERT INTO TABLES
-- Insert Into countries
INSERT INTO `countries` VALUES (1,'U.S','2021-04-05 18:39:43','script','2021-04-05 18:39:43','script'),(2,'UK','2021-04-05 18:39:43','script','2021-04-05 18:39:43','script'),(3,'Canada','2021-04-05 18:39:43','script','2021-04-05 18:39:43','script');

-- Insert Into first_level_divisions
INSERT INTO `first_level_divisions` VALUES (1,'Alabama','2021-04-05 18:39:44','script','2021-04-05 18:39:44','script',1),(2,'Arizona','2021-04-05 18:39:44','script','2021-04-05 18:39:44','script',1),(3,'Arkansas','2021-04-05 18:39:44','script','2021-04-05 18:39:44','script',1),(4,'California','2021-04-05 18:39:44','script','2021-04-05 18:39:44','script',1),(5,'Colorado','2021-04-05 18:39:44','script','2021-04-05 18:39:44','script',1),(6,'Connecticut','2021-04-05 18:39:44','script','2021-04-05 18:39:44','script',1),(7,'Delaware','2021-04-05 18:39:44','script','2021-04-05 18:39:44','script',1),(8,'District of Columbia','2021-04-05 18:39:44','script','2021-04-05 18:39:44','script',1),(9,'Florida','2021-04-05 18:39:44','script','2021-04-05 18:39:44','script',1),(10,'Georgia','2021-04-05 18:39:44','script','2021-04-05 18:39:44','script',1),(11,'Idaho','2021-04-05 18:39:44','script','2021-04-05 18:39:44','script',1),(12,'Illinois','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(13,'Indiana','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(14,'Iowa','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(15,'Kansas','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(16,'Kentucky','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(17,'Louisiana','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(18,'Maine','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(19,'Maryland','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(20,'Massachusetts','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(21,'Michigan','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(22,'Minnesota','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(23,'Mississippi','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(24,'Missouri','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(25,'Montana','2021-04-05 18:39:45','script','2021-04-05 18:39:45','script',1),(26,'Nebraska','2021-04-05 18:39:46','script','2021-04-05 18:39:46','script',1),(27,'Nevada','2021-04-05 18:39:46','script','2021-04-05 18:39:46','script',1),(28,'New Hampshire','2021-04-05 18:39:46','script','2021-04-05 18:39:46','script',1),(29,'New Jersey','2021-04-05 18:39:46','script','2021-04-05 18:39:46','script',1),(30,'New Mexico','2021-04-05 18:39:46','script','2021-04-05 18:39:46','script',1),(31,'New York','2021-04-05 18:39:46','script','2021-04-05 18:39:46','script',1),(32,'North Carolina','2021-04-05 18:39:46','script','2021-04-05 18:39:46','script',1),(33,'North Dakota','2021-04-05 18:39:46','script','2021-04-05 18:39:46','script',1),(34,'Ohio','2021-04-05 18:39:46','script','2021-04-05 18:39:46','script',1),(35,'Oklahoma','2021-04-05 18:39:46','script','2021-04-05 18:39:46','script',1),(36,'Oregon','2021-04-05 18:39:46','script','2021-04-05 18:39:46','script',1),(37,'Pennsylvania','2021-04-05 18:39:46','script','2021-04-05 18:39:46','script',1),(38,'Rhode Island','2021-04-05 18:39:46','script','2021-04-05 18:39:46','script',1),(39,'South Carolina','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',1),(40,'South Dakota','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',1),(41,'Tennessee','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',1),(42,'Texas','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',1),(43,'Utah','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',1),(44,'Vermont','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',1),(45,'Virginia','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',1),(46,'Washington','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',1),(47,'West Virginia','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',1),(48,'Wisconsin','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',1),(49,'Wyoming','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',1),(52,'Hawaii','2021-04-05 18:39:44','script','2021-04-05 18:39:44','script',1),(54,'Alaska','2021-04-05 18:39:44','script','2021-04-05 18:39:44','script',1),(60,'Northwest Territories','2021-04-05 18:39:48','script','2021-04-05 18:39:48','script',3),(61,'Alberta','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',3),(62,'British Columbia','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',3),(63,'Manitoba','2021-04-05 18:39:47','script','2021-04-05 18:39:47','script',3),(64,'New Brunswick','2021-04-05 18:39:48','script','2021-04-05 18:39:48','script',3),(65,'Nova Scotia','2021-04-05 18:39:48','script','2021-04-05 18:39:48','script',3),(66,'Prince Edward Island','2021-04-05 18:39:48','script','2021-04-05 18:39:48','script',3),(67,'Ontario','2021-04-05 18:39:48','script','2021-04-05 18:39:48','script',3),(68,'Québec','2021-04-05 18:39:48','script','2021-04-05 18:39:48','script',3),(69,'Saskatchewan','2021-04-05 18:39:48','script','2021-04-05 18:39:48','script',3),(70,'Nunavut','2021-04-05 18:39:48','script','2021-04-05 18:39:48','script',3),(71,'Yukon','2021-04-05 18:39:48','script','2021-04-05 18:39:48','script',3),(72,'Newfoundland and Labrador','2021-04-05 18:39:48','script','2021-04-05 18:39:48','script',3),(101,'England','2021-04-05 18:39:48','script','2021-04-05 18:39:48','script',2),(102,'Wales','2021-04-05 18:39:48','script','2021-04-05 18:39:48','script',2),(103,'Scotland','2021-04-05 18:39:48','script','2021-04-05 18:39:48','script',2),(104,'Northern Ireland','2021-04-05 18:39:49','script','2021-04-05 18:39:49','script',2);

-- Insert Into customers
INSERT INTO `customers` VALUES (1,'Daddy Warbucks','1919 Boardwalk','01291','869-908-1875','2021-04-05 18:39:49','script','2021-04-05 18:39:49','script',29),(2,'Lady McAnderson','2 Wonder Way','AF19B','11-445-910-2135','2021-04-05 18:39:49','script','2021-04-05 18:39:49','script',103),(3,'Dudley Do-Right','48 Horse Manor ','28198','874-916-2671','2021-04-05 18:39:49','script','2021-04-05 18:39:49','script',60);

-- Insert Into users
INSERT INTO `users` VALUES (1,'test','test','2021-04-05 18:39:43','script','2021-04-05 18:39:43','script'),(2,'admin','admin','2021-04-05 18:39:43','script','2021-04-05 18:39:43','script');

--Insert Into contacts
INSERT INTO `contacts` VALUES (1,'Anika Costa','acoasta@company.com'),(2,'Daniel Garcia','dgarcia@company.com'),(3,'Li Lee','llee@company.com');

-- Insert Into appointments
INSERT INTO `appointments` VALUES (1,'title','description','location','Planning Session','2020-05-28 12:00:00','2020-05-28 13:00:00','2021-04-05 18:39:49','script','2021-04-05 18:39:49','script',1,1,3),(2,'title','description','location','De-Briefing','2020-05-29 12:00:00','2020-05-29 13:00:00','2021-04-05 18:39:49','script','2021-04-05 18:39:49','script',2,2,2);