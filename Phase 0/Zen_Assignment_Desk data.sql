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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Batch`
--

LOCK TABLES `Batch` WRITE;
/*!40000 ALTER TABLE `Batch` DISABLE KEYS */;
INSERT INTO `Batch` VALUES ('CED2014',5,41),('CED2015',5,41),('CED2016',5,41),('COE2013',4,21),('COE2014',4,41),('COE2015',4,41),('COE2016',4,41),('EDM2013',4,21),('EDM2014',4,41),('EDM2015',4,41),('EDM2016',4,41),('ESD2014',5,21),('ESD2015',5,21),('ESD2016',5,41),('EVD2014',5,21),('EVD2015',5,21),('EVD2016',5,41),('MDM2013',4,21),('MDM2014',4,41),('MDM2015',4,41),('MDM2016',4,41),('MFD2014',5,21),('MFD2015',5,21),('MFD2016',5,41),('MPD2014',5,21),('MPD2015',5,21),('MPD2016',5,41),('MSM2016',4,21);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES ('COM105P','Computational Engineering Practice','Computer Science',2),('COM105T','Computational Engineering','Computer Science',3),('COM205T','Discrete Structures for Computing','Computer Science',3),('COM206P','Digital and Analog Circuits Design Practice','Computer Science',2),('COM206T','Digital and Analog Circuits Design','Computer Science',3),('COM207P','Programming and Data Structures Practice','Computer Science',2),('COM207T','Programming and Data Structures','Computer Science',3),('COM209T','Design and Analysis of Algorithms','Computer Science',3),('COM210P','Object Oriented Algorithm Design and Analysis Practice','Computer Science',2),('COM211P','Computer Organization and Design Practice','Computer Science',2),('COM211T','Computer Organization and Design','Computer Science',3),('COM212P','Database Systems Practice','Computer Science',2),('COM212T','Database Systems','Computer Science',3),('DES101T','Concepts in Engineering Design','Design',3),('DES102T','Design History','Design',2),('DES103T','Earth,Environment & Design','Design',0),('DES104P','Industrial Design Sketching','Design',2),('DES105P','Design Realization','Design',2),('DES201T','Systems Thinking for Design','Design',2),('DES203T','Designing Intelligent Systems','Design',2),('ELE103T','Basic Electrical and Electronics Engineering','Electronics',3),('ELE216T','Signals Systems and Commnications','Electronics',3),('INT107T','English for Communication','Inter',2),('INT108T','Science and Engineering of Materials','Inter',3),('INT109T','Engineering Graphics','Inter',3),('INT110T','Engineering Skills Practice','Inter',2),('INT111P','Measurements and Data Analysis Practice','Inter',2),('MAN102T','Professional Ethics for Engineers','Humanities',0),('MAN201T','Engineering Economics','Humanities',2),('MAN202T','Sociology of Design','Humanities',2),('MAT104T','Calculus','Mathematics',3),('MAT105T','Differential Equations','Mathematics',3),('MAT204T','Linear Algebra','Mathematics',3),('MAT205T','Probability Theory','Mathematics',3),('PHY107P','Engineering Electromagnetics Practice','Physics',2),('PHY107T','Engineering Electromagnetics','Physics',3),('PHY108T','Engineering Mechanics','Physics',3),('PHY109T','Basic Materials and Mechanics Practice','Physics',2);
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
  KEY `Head_Of_Department_FK` (`Head_Of_Department`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('Computer Science','FCT10CS32'),('Design','FCT10DS12'),('Electronics','FCT10EL86'),('Mathematics','FCT10MA41'),('Mechanics','FCT10MC23'),('Humanities','FCT11MN09'),('Inter','FCT11PH03'),('Physics','FCT11PH15');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('CED15I001','Pranay Ankit Tiru','1997-02-21','2015-07-25','0000-00-00','ced15i001@iiitdm.ac.in','CED2015'),('CED15I002','Mukesh Reghu','1996-10-16','2015-07-25','0000-00-00','ced15i002@iiitdm.ac.in','CED2015'),('CED15I003','Sri Krishna G','1997-10-10','2015-07-25','0000-00-00','ced15i003@iiitdm.ac.in','CED2015'),('CED15I004','Lakshmi Narasimhan','1997-02-09','2015-07-25','0000-00-00','ced15i004@iiitdm.ac.in','CED2015'),('CED15I005','Mukundan','1997-05-06','2015-07-25','0000-00-00','ced15i005@iiitdm.ac.in','CED2015'),('CED15I006','Hemant','1997-05-05','2015-07-25','2016-04-19','ced15i006@iiitdm.ac.in','CED2015'),('CED15I007','Govind','1996-06-07','2015-07-25','0000-00-00','ced15i007@iiitdm.ac.in','CED2015'),('CED15I008','Jayitha C','1996-08-05','2015-07-25','0000-00-00','ced15i008@iiitdm.ac.in','CED2015'),('CED15I009','Manasa Kandimala','1997-11-05','2015-07-25','0000-00-00','ced15i009@iiitdm.ac.in','CED2015'),('CED15I010','Nikhil Evans','1997-01-04','2015-07-25','0000-00-00','ced15i010@iiitdm.ac.in','CED2015'),('CED15I011','Fajar A R','1997-02-05','2015-07-25','0000-00-00','ced15i011@iiitdm.ac.in','CED2015'),('CED15I012','Rohith Palaparthy','1996-08-09','2015-07-25','0000-00-00','ced15i012@iiitdm.ac.in','CED2015'),('CED15I013','Vedant Bassi','1996-12-03','2015-07-25','0000-00-00','ced15i013@iiitdm.ac.in','CED2015'),('CED15I014','Vidhathri Bhatt','1996-08-04','2015-07-25','0000-00-00','ced15i014@iiitdm.ac.in','CED2015'),('CED15I015','Viraj Sonathkar','1997-08-08','2015-07-25','0000-00-00','ced15i015@iiitdm.ac.in','CED2015'),('CED15I016','Vasanthi','1997-12-12','2015-07-25','0000-00-00','ced15i016@iiitdm.ac.in','CED2015'),('CED15I017','Yutika C Kulwe','1997-01-02','2015-07-25','0000-00-00','ced15i017@iiitdm.ac.in','CED2015'),('CED15I018','Sachin Putta','1997-02-02','2015-07-25','0000-00-00','ced15i018@iiitdm.ac.in','CED2015'),('CED15I019','Gowtham Munukutla','1997-10-15','2015-07-25','0000-00-00','ced15i019@iiitdm.ac.in','CED2015'),('CED15I020','Chaitanya','1997-08-03','2015-07-25','0000-00-00','ced15i020@iiitdm.ac.in','CED2015'),('CED15I021','Anmol Gupta','1997-07-31','2015-07-25','0000-00-00','ced15i021@iiitdm.ac.in','CED2015'),('CED15I022','Nikhila','1997-12-25','2015-07-25','0000-00-00','ced15i022@iiitdm.ac.in','CED2015'),('CED15I023','Ruchi Saha','1996-11-24','2015-07-25','0000-00-00','ced15i023@iiitdm.ac.in','CED2015'),('CED15I024','Divya Venkat','1997-05-23','2015-07-25','0000-00-00','ced15i024@iiitdm.ac.in','CED2015'),('CED15I025','Aditya Prakash','1996-02-20','2015-07-25','0000-00-00','ced15i025@iiitdm.ac.in','CED2015'),('CED15I026','Brahmi Dwivedi','1996-09-19','2015-07-25','0000-00-00','ced15i026@iiitdm.ac.in','CED2015'),('CED15I027','Shwet Prakash','1997-02-08','2015-07-25','0000-00-00','ced15i027@iiitdm.ac.in','CED2015'),('CED15I028','Nayan A Mane','1996-12-28','2015-07-25','0000-00-00','ced15i028@iiitdm.ac.in','CED2015'),('CED15I029','Prathamesh Degwekar','1997-05-06','2015-07-25','0000-00-00','ced15i029@iiitdm.ac.in','CED2015'),('CED15I030','Dany Prakash','1996-12-03','2015-07-25','0000-00-00','ced15i030@iiitdm.ac.in','CED2015'),('CED15I031','Akshay Kumar','1997-10-15','2015-07-25','0000-00-00','ced15i031@iiitdm.ac.in','CED2015'),('CED15I032','Shivani Kale','1996-11-24','2015-07-25','0000-00-00','ced15i032@iiitdm.ac.in','CED2015'),('CED15I033','Srinath Kokkala','1997-08-08','2015-07-25','0000-00-00','ced15i033@iiitdm.ac.in','CED2015'),('CED15I034','Ragharuban','1997-02-02','2015-07-25','2016-04-04','ced15i034@iiitdm.ac.in','CED2015'),('CED15I035','Akhila','1997-12-25','2015-07-25','0000-00-00','ced15i035@iiitdm.ac.in','CED2015'),('CED15I036','Jeffrey S Jacob','1996-02-20','2015-07-25','0000-00-00','ced15i036@iiitdm.ac.in','CED2015'),('CED15I037','Trishul Muchintala','1996-12-03','2015-07-25','0000-00-00','ced15i037@iiitdm.ac.in','CED2015'),('CED15I038','Mohit Agarwal','1997-11-05','2015-07-25','0000-00-00','ced15i038@iiitdm.ac.in','CED2015'),('CED15I039','Dingu Sagar','1997-02-02','2015-07-25','0000-00-00','ced15i039@iiitdm.ac.in','CED2015'),('CED15I040','Akash V Sharma','1996-11-24','2015-07-25','0000-00-00','ced15i040@iiitdm.ac.in','CED2015'),('CED15I041','Nimilikha Vemparala','1997-12-25','2015-07-25','0000-00-00','ced15i041@iiitdm.ac.in','CED2015');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teacher`
--

LOCK TABLES `Teacher` WRITE;
/*!40000 ALTER TABLE `Teacher` DISABLE KEYS */;
INSERT INTO `Teacher` VALUES ('FCT10CS32','Dr. Masilamani V','Computer Science','masila@iiitdm.ac.in','2010-05-12','0000-00-00'),('FCT10DS12','Dr. Sudhir Varadarajan','Design','sudhir@iiitdm.ac.in','2010-05-14','0000-00-00'),('FCT10EL86','Dr. Binsu J Kailath','Electronics','bkailath@iiitdm.ac.in','2010-02-11','0000-00-00'),('FCT10MA41','Dr. Vijayakumar S','Mathematics','vijay@iiitdm.ac.in','2010-03-04','0000-00-00'),('FCT10MC23','Dr. Jayabal K','Mechanics','jayabal@iiitdn.ac.in','2010-05-02','0000-00-00'),('FCT11CS21','Dr. Sadagopan N','Computer Science','sadagopan@iiitdm.ac.in','2011-03-04','0000-00-00'),('FCT11CS22','Dr. Noor Mahammad SK','Computer Science','noor@iiitdm.ac.in','2011-04-02','0000-00-00'),('FCT11MA05','Dr. Shalu M A','Mathematics','shaluma@iiitdm.ac.in','2011-04-02','0000-00-00'),('FCT11MC23','Dr. M Narayan','Mechanics','m_narayan13@gmail.com','2011-01-11','0000-00-00'),('FCT11MN09','Dr. Divya A','Humanities','divyaa@iiitdm.ac.in','2011-01-02','0000-00-00'),('FCT11PH03','Dr. Naveen Kumar','Physics','nkumar@iiitdm.ac.in','2011-04-08',NULL),('FCT11PH15','Dr. Tapas Sil','Physics','tapassil@iiitdm.ac.in','2011-03-02',NULL),('FCT12CS01','Dr. Sivaselvan B','Computer Science','sivaselvanb@iiitdm.ac.in','2012-04-03','0000-00-00'),('FCT12EL02','Dr. Damodaran P','Electronics','damodaranp@iiitdm.ac.in','2012-05-05','0000-00-00'),('FCT12MC02','Dr. Jayavel S','Mechanics','sjv@iiitdm.ac.in','2012-02-03','0000-00-00'),('FCT12MN09','Dr. K Murthy','Humanities','murthy_k45@gmail.com','2012-03-14','0000-00-00'),('FCT13EL01','Dr. Shunmugham R Pandian','Electronics','srp@iiitdm.ac.in','2013-04-02','0000-00-00'),('FCT13EL02','Dr. Selvajyothi K','Electronics','selvajyothi@iiitdm.ac.in','2013-04-02','0000-00-00'),('FCT14CS20','Dr. Shankar Raman M J','Computer Science','shankarmj@iiitdm.ac.in','2014-03-02','0000-00-00');
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('CED15I001','students123','2017-04-05 08:25:28'),('CED15I002','students123','2017-04-05 08:25:28'),('CED15I003','students123','2017-04-05 08:25:28'),('CED15I004','students123','2017-04-05 08:25:28'),('CED15I005','students123','2017-04-05 08:25:28'),('CED15I006','students123','2017-04-05 08:25:28'),('CED15I007','students123','2017-04-05 08:25:28'),('CED15I008','students123','2017-04-05 08:25:28'),('CED15I009','students123','2017-04-05 08:25:28'),('CED15I010','students123','2017-04-05 08:25:28'),('CED15I011','students123','2017-04-05 08:25:28'),('CED15I012','students123','2017-04-05 08:25:28'),('CED15I013','students123','2017-04-05 08:25:28'),('CED15I014','students123','2017-04-05 08:25:28'),('CED15I015','students123','2017-04-05 08:25:28'),('CED15I016','students123','2017-04-05 08:25:28'),('CED15I017','students123','2017-04-05 08:25:28'),('CED15I018','students123','2017-04-05 08:25:28'),('CED15I019','students123','2017-04-05 08:25:28'),('CED15I020','students123','2017-04-05 08:25:28'),('CED15I021','students123','2017-04-05 08:25:28'),('CED15I022','students123','2017-04-05 08:25:28'),('CED15I023','students123','2017-04-05 08:25:28'),('CED15I024','students123','2017-04-05 08:25:28'),('CED15I025','students123','2017-04-05 08:25:28'),('CED15I026','students123','2017-04-05 08:25:28'),('CED15I027','students123','2017-04-05 08:25:28'),('CED15I028','students123','2017-04-05 08:25:28'),('CED15I029','students123','2017-04-05 08:25:28'),('CED15I030','students123','2017-04-05 08:25:28'),('CED15I031','students123','2017-04-05 08:25:28'),('CED15I032','students123','2017-04-05 08:25:28'),('CED15I033','students123','2017-04-05 08:25:28'),('CED15I034','students123','2017-04-05 08:25:28'),('CED15I035','students123','2017-04-05 08:25:28'),('CED15I036','students123','2017-04-05 08:25:28'),('CED15I037','students123','2017-04-05 08:25:28'),('CED15I038','students123','2017-04-05 08:25:28'),('CED15I039','students123','2017-04-05 08:25:28'),('CED15I040','students123','2017-04-05 08:25:28'),('CED15I041','students123','2017-04-05 08:25:28'),('FCT10CS32','iiitdm123','2017-04-05 08:25:28'),('FCT10DS12','iiitdm123','2017-04-05 08:25:28'),('FCT10EL86','iiitdm123','2017-04-05 08:25:28'),('FCT10MA41','iiitdm123','2017-04-05 08:25:28'),('FCT10MC23','iiitdm123','2017-04-05 08:25:28'),('FCT11CS21','iiitdm123','2017-04-05 08:25:28'),('FCT11CS22','iiitdm123','2017-04-05 08:25:28'),('FCT11MA05','iiitdm123','2017-04-05 08:25:28'),('FCT11MC23','iiitdm123','2017-04-05 08:25:28'),('FCT11MN09','iiitdm123','2017-04-05 08:25:28'),('FCT11PH03','iiitdm123','2017-04-05 08:25:28'),('FCT11PH15','iiitdm123','2017-04-05 08:25:28'),('FCT12CS01','iiitdm123','2017-04-05 08:25:28'),('FCT12EL02','iiitdm123','2017-04-05 08:25:28'),('FCT12MC02','iiitdm123','2017-04-05 08:25:28'),('FCT12MN09','iiitdm123','2017-04-05 08:25:28'),('FCT13EL01','iiitdm123','2017-04-05 08:25:28'),('FCT13EL02','iiitdm123','2017-04-05 08:25:28'),('FCT14CS20','iiitdm123','2017-04-05 08:25:28');
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

-- Dump completed on 2017-04-24  7:39:03
