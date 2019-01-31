-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: Zen_Assignment_Desk
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Assignment`
--

DROP TABLE IF EXISTS `Assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assignment` (
  `Assignment_ID` char(10) NOT NULL,
  `Assignment_Name` varchar(30) NOT NULL,
  `Teacher_ID` char(9) NOT NULL,
  `Batch` char(7) NOT NULL,
  `Credits_Alloted` int(11) NOT NULL,
  `Creation_DateTime` datetime NOT NULL,
  `Deadline_DateTime` datetime DEFAULT NULL,
  `Course_ID` char(7) NOT NULL,
  PRIMARY KEY (`Assignment_ID`),
  KEY `Teacher_Teacher_ID_index` (`Teacher_ID`),
  KEY `Course_Course_ID_index` (`Course_ID`),
  KEY `Batch_Batch_index` (`Batch`),
  CONSTRAINT `Assigned_By_FK` FOREIGN KEY (`Teacher_ID`) REFERENCES `Teacher` (`Teacher_ID`) ON UPDATE NO ACTION,
  CONSTRAINT `Assigned_For_FK` FOREIGN KEY (`Course_ID`) REFERENCES `Course` (`Course_ID`) ON UPDATE NO ACTION,
  CONSTRAINT `Assigned_To` FOREIGN KEY (`Batch`) REFERENCES `Batch` (`Batch`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignment`
--

LOCK TABLES `Assignment` WRITE;
/*!40000 ALTER TABLE `Assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Batch`
--

DROP TABLE IF EXISTS `Batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Batch` (
  `Batch` char(7) NOT NULL,
  `Years` int(11) NOT NULL,
  `Strength` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Batch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Batch`
--

LOCK TABLES `Batch` WRITE;
/*!40000 ALTER TABLE `Batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `Batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course` (
  `Course_ID` char(7) NOT NULL,
  `Course_Name` varchar(60) NOT NULL,
  `Department` varchar(30) NOT NULL,
  `Total_Credits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Course_ID`),
  KEY `Department_Department_index` (`Department`),
  CONSTRAINT `Course_under_Department_FK` FOREIGN KEY (`Department`) REFERENCES `Department` (`Department`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `Department` varchar(30) NOT NULL,
  `Head_Of_Department` char(9) NOT NULL,
  PRIMARY KEY (`Department`),
  KEY `Head_Of_Department_FK` (`Head_Of_Department`),
  CONSTRAINT `Head_Of_Department_FK` FOREIGN KEY (`Head_Of_Department`) REFERENCES `Teacher` (`Teacher_ID`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Grading`
--

DROP TABLE IF EXISTS `Grading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Grading` (
  `Student_ID` char(9) NOT NULL,
  `Assignment_ID` char(10) NOT NULL,
  `Credits_Obtained` int(11) DEFAULT NULL,
  `Plagiarism_Measure` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`,`Assignment_ID`),
  KEY `Student_Student_ID_index` (`Student_ID`),
  KEY `Assignment_Assignment_ID_index` (`Assignment_ID`),
  CONSTRAINT `Grade_to_FK` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`) ON UPDATE NO ACTION,
  CONSTRAINT `Graded_on_FK` FOREIGN KEY (`Assignment_ID`) REFERENCES `Assignment` (`Assignment_ID`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Grading`
--

LOCK TABLES `Grading` WRITE;
/*!40000 ALTER TABLE `Grading` DISABLE KEYS */;
/*!40000 ALTER TABLE `Grading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `Student_ID` char(9) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Date_of_Birth` date NOT NULL,
  `Date_of_Joining` date NOT NULL,
  `Date_of_Pass_Out` date DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Batch` char(7) NOT NULL,
  PRIMARY KEY (`Student_ID`),
  KEY `Batch_Batch_index` (`Batch`),
  CONSTRAINT `Batch_of_Student_FK` FOREIGN KEY (`Batch`) REFERENCES `Batch` (`Batch`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_Timeline`
--

DROP TABLE IF EXISTS `Student_Timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_Timeline` (
  `Student_ID` char(9) NOT NULL,
  `Assignment_ID` char(10) NOT NULL,
  `Submission_Status` tinyint(1) NOT NULL DEFAULT '0',
  `Review_Status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Student_ID`,`Assignment_ID`),
  KEY `Student_Student_ID_index` (`Student_ID`),
  KEY `Assignment_Assignment_ID_index` (`Assignment_ID`),
  CONSTRAINT `What_Assignment_FK` FOREIGN KEY (`Assignment_ID`) REFERENCES `Assignment` (`Assignment_ID`) ON UPDATE NO ACTION,
  CONSTRAINT `Which_Student_FK` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_Timeline`
--

LOCK TABLES `Student_Timeline` WRITE;
/*!40000 ALTER TABLE `Student_Timeline` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student_Timeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Submissions`
--

DROP TABLE IF EXISTS `Submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Submissions` (
  `Student_ID` char(9) NOT NULL,
  `Assignment_ID` char(10) NOT NULL,
  `DateTime_of_Submission` datetime NOT NULL,
  PRIMARY KEY (`Student_ID`,`Assignment_ID`),
  KEY `Student_Student_ID_index` (`Student_ID`),
  KEY `Assignment_Assignment_ID_index` (`Assignment_ID`),
  CONSTRAINT `Assignment_for_submission_FK` FOREIGN KEY (`Assignment_ID`) REFERENCES `Assignment` (`Assignment_ID`) ON UPDATE NO ACTION,
  CONSTRAINT `Student_to_submit_FK` FOREIGN KEY (`Student_ID`) REFERENCES `Student` (`Student_ID`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Submissions`
--

LOCK TABLES `Submissions` WRITE;
/*!40000 ALTER TABLE `Submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teacher`
--

DROP TABLE IF EXISTS `Teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teacher` (
  `Teacher_ID` char(9) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Department` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Date_of_Joining` date NOT NULL,
  `Date_of_Transfer` date DEFAULT NULL,
  PRIMARY KEY (`Teacher_ID`),
  KEY `Department_Department_index` (`Department`),
  CONSTRAINT `Department_for_Teacher_FK` FOREIGN KEY (`Department`) REFERENCES `Department` (`Department`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teacher`
--

LOCK TABLES `Teacher` WRITE;
/*!40000 ALTER TABLE `Teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `Teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `ID` char(9) NOT NULL,
  `Passphrase` text NOT NULL,
  `Date_of_Change` datetime NOT NULL,
  PRIMARY KEY (`ID`)/*,
  CONSTRAINT `User_is_a_Student` FOREIGN KEY (`ID`) REFERENCES `Student` (`Student_ID`) ON UPDATE NO ACTION,
  CONSTRAINT `User_is_a_Teacher` FOREIGN KEY (`ID`) REFERENCES `Teacher` (`Teacher_ID`) ON UPDATE NO ACTION*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-23 19:21:22
