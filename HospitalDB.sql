CREATE DATABASE  IF NOT EXISTS `hospitaldb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospitaldb`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospitaldb
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `associated`
--

DROP TABLE IF EXISTS `associated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associated` (
  `DoctorID` int NOT NULL,
  `medicalID` int NOT NULL,
  PRIMARY KEY (`DoctorID`,`medicalID`),
  KEY `Associated_FK2` (`medicalID`),
  CONSTRAINT `Associated_FK1` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Associated_FK2` FOREIGN KEY (`medicalID`) REFERENCES `medical_record` (`medicalID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associated`
--

LOCK TABLES `associated` WRITE;
/*!40000 ALTER TABLE `associated` DISABLE KEYS */;
INSERT INTO `associated` VALUES (50004,44444),(50003,44445),(50001,44446),(50002,44447),(50005,44448);
/*!40000 ALTER TABLE `associated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `PatientID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Relationship` varchar(40) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  PRIMARY KEY (`Name`,`PatientID`),
  KEY `Dependent_FK` (`PatientID`),
  CONSTRAINT `Dependent_FK` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES (11151,'Ali','son','M','2002-11-11'),(11141,'Hind','aunt','F','1984-10-01'),(11111,'reem','mother','F','1966-08-21'),(11121,'saad','father','M','1970-01-17'),(11131,'salih','brther','M','1988-04-30');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `DoctorID` int NOT NULL,
  `NIN` varchar(20) DEFAULT NULL,
  `fName` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `specialization` varchar(40) DEFAULT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Address` varchar(40) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`DoctorID`),
  UNIQUE KEY `NIN` (`NIN`),
  CONSTRAINT `doctor_chk_1` CHECK ((`position` in (_utf8mb4'Specialist',_utf8mb4'Consultant',_utf8mb4'Resident'))),
  CONSTRAINT `doctor_chk_2` CHECK ((`salary` > 5000.00))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (50001,'1162095325','Sama','Althobiti','Surgeon','Saudi Arabia','Female','Маккак,Al-Awali','Specialist',30000.00),(50002,'1156977408','Jory',' Alsubhi','Psychiatrist','Saudi Arabia','Female','Makkah, Al-Aziziyyah','Consultant',52500.00),(50003,'1141953885','Hanoo',' Aldossari','Pediatrician ','Saudi Arabia','Female ','Makkah Al-shawqiyah','Specialist',30000.00),(50004,'1012392722','Omer',' Al harbi','Dermatatologist','Saudi Arabia','Male','Makkah zahrat al-umrah','Resident',14850.00),(50005,'1051150239','Essam',' Al harbi','ophthalmologist ','Saudi Arabia','Male','Makkah Al-nawariyyah','Consultant',52500.00);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_phone`
--

DROP TABLE IF EXISTS `doctor_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_phone` (
  `DoctorID` int NOT NULL,
  `PhoneNum` varchar(20) NOT NULL,
  PRIMARY KEY (`DoctorID`,`PhoneNum`),
  CONSTRAINT `DoctorID_fk` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_phone`
--

LOCK TABLES `doctor_phone` WRITE;
/*!40000 ALTER TABLE `doctor_phone` DISABLE KEYS */;
INSERT INTO `doctor_phone` VALUES (50001,'0550476396'),(50001,'0557990895'),(50002,'0542903003'),(50003,'0549030310'),(50004,'0566384560'),(50004,'0569780794'),(50005,'0541938585');
/*!40000 ALTER TABLE `doctor_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_record`
--

DROP TABLE IF EXISTS `medical_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_record` (
  `medicalID` int NOT NULL,
  `AdmissionDate` date DEFAULT NULL,
  `DischargeDate` date DEFAULT NULL,
  `Diagnosis` varchar(40) DEFAULT NULL,
  `BloodType` varchar(10) DEFAULT NULL,
  `PatientID` int DEFAULT NULL,
  `SurgicalProcedure` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`medicalID`),
  KEY `Medical_Record_FK` (`PatientID`),
  CONSTRAINT `Medical_Record_FK` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_record`
--

LOCK TABLES `medical_record` WRITE;
/*!40000 ALTER TABLE `medical_record` DISABLE KEYS */;
INSERT INTO `medical_record` VALUES (44444,'2024-02-01','2024-02-08','Arthritis','O+',11121,'joint resurfacing'),(44445,'2024-01-03','2025-02-02','Alzheimer\'s disease','A+',11141,NULL),(44446,'2024-02-26','2024-02-29','Chronic kidney disease (CKD)','AB',11131,' kidney transplant'),(44447,'2024-05-05','2024-05-12','Arrhythmia',' B-',11151,' catheter ablation'),(44448,'2024-07-26','2024-07-28','Diabetes','O-',11111,NULL);
/*!40000 ALTER TABLE `medical_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `MedicineID` int NOT NULL,
  `MedicineName` varchar(40) DEFAULT NULL,
  `cost` decimal(5,2) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `manufactureer` varchar(40) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`MedicineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (33301,'Panadol',8.25,'2027-08-20','GSK','For Headach,Period,Muscle pain'),(33302,'Fevadol',4.20,'2025-09-18','SPIMACO','For fevers, tension Headach,backaches and pains'),(33303,'Omeprex',91.90,'2026-12-07','PPIS','relieving the symptoms such as heartburn and stomach pain'),(33304,'Maxitrol eye oint',11.30,'2024-12-12','Alcon couvreur','To treat sweling cinflammation in the eye'),(33305,'Rofenac',19.80,'2025-05-29','Rofenac','To treat inflammation of the bones and joints,back pain');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `PatientID` int NOT NULL,
  `NIN` varchar(10) DEFAULT NULL,
  `fName` varchar(20) DEFAULT NULL,
  `mName` varchar(20) DEFAULT NULL,
  `lName` varchar(20) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Nationality` varchar(20) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `PhoneNum` varchar(10) DEFAULT NULL,
  `DoctorID` int DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  UNIQUE KEY `NIN` (`NIN`),
  KEY `Patient_FK` (`DoctorID`),
  CONSTRAINT `Patient_FK` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (11111,'1193758256','Fawaz','Saad','Aldossari','M','Saudi Arabia','2000-08-22','Makkah,Ash-Shawqiyyah','0569225098',50001),(11121,'1133985712','Sarah','Ahmed','Saeed','F','Saudi Arabia','2005-02-26','Makkah,Ash-Alwali','0544004068',50003),(11131,'1099567245','Osama','Faisal','Alqurashi','M','Saudi Arabia','1998-09-15','Makkah,Al-Naseem','0567181123',50005),(11141,'1067226804','Mohammed','Turki','Alluhayani','M','Saudi Arabia','1996-08-28','Makkah,Al-Rusaifah','0545007891',50002),(11151,'1109268351','Ghadi','Abdullah','Salman','F','Saudi Arabia','2017-07-06','Makkah,Al-Iskan','0569127860',50004);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `take`
--

DROP TABLE IF EXISTS `take`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `take` (
  `PatientID` int NOT NULL,
  `MedicineID` int NOT NULL,
  PRIMARY KEY (`PatientID`,`MedicineID`),
  KEY `Take_FK2` (`MedicineID`),
  CONSTRAINT `Take_FK1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Take_FK2` FOREIGN KEY (`MedicineID`) REFERENCES `medicine` (`MedicineID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `take`
--

LOCK TABLES `take` WRITE;
/*!40000 ALTER TABLE `take` DISABLE KEYS */;
INSERT INTO `take` VALUES (11141,33301),(11151,33302),(11121,33303),(11111,33304),(11131,33305);
/*!40000 ALTER TABLE `take` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-08  5:04:27
