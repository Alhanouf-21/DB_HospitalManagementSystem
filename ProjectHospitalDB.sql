CREATE DATABASE `HospitalDB` ;
USE `HospitalDB` ;

CREATE TABLE Doctor (
    DoctorID INT(5) NOT NULL,
    NIN VARCHAR(20) UNIQUE,
    fName VARCHAR(50),
    lname VARCHAR(50),
    specialization VARCHAR(40),
    Nationality VARCHAR(50),
    Gender  VARCHAR(10),
    Address VARCHAR(40),
    position VARCHAR(50) CHECK (position IN ('Specialist','Consultant','Resident')),
    salary DECIMAL(10, 2) CHECK (salary > 5000.00),
    CONSTRAINT DoctorID_PK PRIMARY KEY (DoctorID)
);

CREATE TABLE Doctor_phone (
    DoctorID INT(5) NOT NULL,
    PhoneNum VARCHAR(20) NOT NULL,
    CONSTRAINT Doctor_phone_PK PRIMARY KEY (DoctorID, PhoneNum),
    CONSTRAINT DoctorID_fk FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Patient (
PatientID       INT(5)  NOT NULL,
NIN             VARCHAR(10) UNIQUE,
fName           VARCHAR(20),
mName           VARCHAR(20),
lName           VARCHAR(20),
Gender          VARCHAR(10),
Nationality     VARCHAR(20),
DateOfBirth     DATE,
Address         VARCHAR(30),
PhoneNum        VARCHAR(10),
DoctorID        INT(5),
CONSTRAINT Patient_PK PRIMARY KEY (PatientID), 
CONSTRAINT Patient_FK FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Dependent (
PatientID           INT(5) NOT NULL,
Name                VARCHAR(50) NOT NULL, 
Relationship        VARCHAR(40),
Gender              VARCHAR(10),
DateOfBirth         DATE,
CONSTRAINT Dependent_PK PRIMARY KEY (Name, PatientID),
CONSTRAINT Dependent_FK FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE Medicine (
MedicineID INT(5) NOT NULL, 
MedicineName VARCHAR(40),
cost DECIMAL(5, 2),
ExpiryDate DATE,
manufactureer VARCHAR(40),
Description TEXT,
CONSTRAINT Medicine_PK PRIMARY KEY (MedicineID)
);

CREATE TABLE Take (
PatientID INT(5) NOT NULL, 
MedicineID INT(5) NOT NULL,
CONSTRAINT Take_PK PRIMARY KEY (PatientID,MedicineID),
CONSTRAINT Take_FK1 FOREIGN KEY (PatientID) REFERENCES Patient(PatientID) ON DELETE CASCADE ON UPDATE CASCADE ,
CONSTRAINT Take_FK2 FOREIGN KEY (MedicineID) REFERENCES Medicine(MedicineID) ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE Medical_Record (
    medicalID INT(5) NOT NULL,
    AdmissionDate DATE,
    DischargeDate DATE,
    Diagnosis VARCHAR(40),
    BloodType VARCHAR(10),
    PatientID INT(5),
    SurgicalProcedure VARCHAR(40),
    CONSTRAINT Medical_Record_PK PRIMARY KEY (medicalID),
    CONSTRAINT Medical_Record_FK FOREIGN KEY (PatientID) REFERENCES Patient (PatientID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Associated (
    DoctorID INT(5) NOT NULL,
    medicalID INT(5) NOT NULL,
CONSTRAINT Associated_PK PRIMARY KEY (DoctorID,medicalID),
CONSTRAINT Associated_FK1 FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT Associated_FK2 FOREIGN KEY (medicalID) REFERENCES Medical_Record(medicalID) ON DELETE CASCADE ON UPDATE CASCADE
);

#------INSERT Doctor value 
INSERt INTO Doctor(DoctorID, NIN, fName, lName, specialization, Nationality, Gender, Address, position, salary)
VALUES  
(50001,'1162095325','Sama','Althobiti','Surgeon','Saudi Arabia','Female','Маккак,Al-Awali','Specialist',20000),

(50002,'1156977408','Jory',' Alsubhi','Psychiatrist','Saudi Arabia','Female','Makkah, Al-Aziziyyah','Consultant',35000),

(50003,'1141953885','Hanoo',' Aldossari','Pediatrician ','Saudi Arabia','Female ','Makkah Al-shawqiyah','Specialist',20000),

(50004,'1012392722','Omer',' Al harbi','Dermatatologist','Saudi Arabia','Male','Makkah zahrat al-umrah','Resident',9900.00),

(50005,'1051150239','Essam',' Al harbi','ophthalmologist ','Saudi Arabia','Male','Makkah Al-nawariyyah','Consultant',35000);


#-- INSERT Doctor phone number
INSERT INTO Doctor_phone (DoctorID, PhoneNum)
VALUES        (50001,'0550476396'),
			  (50001,'0557990895'), 
              (50002,'0542903003'), 
              (50003,'0549030310'), 
              (50004,'0566384560'),
              (50004,'0569780794'),
              (50005,'0541938585');
              
              
#--INSERT Patient value
INSERT INTO Patient(PatientID, NIN, fName, mName, lName, Gender, Nationality, DateOfBirth, Address, PhoneNum, DoctorID)
VALUES 
(11111,'1193758256','Fawaz','Saad','Aldossari','M','Saudi Arabia','2000-08-22','Makkah,Ash-Shawqiyyah','0569225098',50001),
(11121,'1133985712','Sarah','Ahmed','Saeed','F','Saudi Arabia','2005-02-26','Makkah,Ash-Alwali','0544004068',50003),
(11131,'1099567245','Osama','Faisal','Alqurashi','M','Saudi Arabia','1998-09-15','Makkah,Al-Naseem','0567181123',50005),
(11141,'1067226804','Mohammed','Turki','Alluhayani','M','Saudi Arabia','1996-08-28','Makkah,Al-Rusaifah','0545007891',50002),
(11151,'1109268351','Ghadi','Abdullah','Salman','F','Saudi Arabia','2017-07-06','Makkah,Al-Iskan','0569127860',50004);

#-- INSERT Dependent value
INSERT INTO Dependent(PatientID, Name, Relationship, Gender, DateOfBirth)
VALUES
(11111,'reem','mother','F','1966-08-21'),
(11121,'saad','father','M','1970-01-17'),
(11131,'salih','brther','M','1988-04-30'),
(11141,'Hind','aunt','F','1984-10-01'),
(11151,'Ali','son','M','2002-11-11');


#-- INSERT Medicine value
INSERT INTO Medicine (MedicineID, MedicineName, cost, ExpiryDate, manufactureer, Description)
VALUES (33301,'Panadol',8.25,'2027-08-20','GSK','For Headach,Period,Muscle pain'),
(33302,'Fevadol',4.20,'2025-09-18','SPIMACO','For fevers, tension Headach,backaches and pains'),
(33303,'Omeprex',91.90,'2026-12-07','PPIS','relieving the symptoms such as heartburn and stomach pain'),
(33304,'Maxitrol eye oint',11.30,'2024-12-12','Alcon couvreur','To treat sweling cinflammation in the eye'),
(33305,'Rofenac',19.80,'2025-05-29','Rofenac','To treat inflammation of the bones and joints,back pain');

#-- INSERT Take value
INSERT INTO Take(PatientID, MedicineID)
VALUES (11111,33304),
	   (11121,33303), 
	   (11131,33305), 
	   (11141,33301), 
	   (11151,33302);

#--INSERT Medical_Record value
INSERT INTO Medical_Record (MedicalID ,AdmissionDate ,DischargeDate ,Diagnosis ,BloodType,PatientID ,SurgicalProcedure)
VALUES
(44444,"2024-02-01","2024-02-08","Arthritis","O+",11121,"joint resurfacing"),
(44445,"2024-01-03","2025-02-02","Alzheimer's disease","A+",11141,NULL),
(44446,"2024-02-26","2024-02-29","Chronic kidney disease (CKD)","AB",11131," kidney transplant"),
(44447,"2024-05-05","2024-05-12","Arrhythmia"," B-",11151," catheter ablation");

INSERT INTO Medical_Record (MedicalID ,AdmissionDate ,DischargeDate ,Diagnosis ,BloodType,PatientID ,SurgicalProcedure)
VALUES (44448,"2024-07-26","2024-07-28","Diabetes","O-",11111,NULL);

#-- INSERT Associated value
INSERT INTO Associated (DoctorID, medicalID)
VALUES (50001,44446),
	   (50003,44445), 
	   (50002,44447), 
	   (50004,44444);
       
INSERT INTO Associated (DoctorID, medicalID)
VALUES  (50005,44448);
       
# Calculated derived attribute for Patient age
SELECT *, 
TIMESTAMPDIFF(YEAR, DateOfBirth, CURDATE()) AS Age
FROM Patient;

SELECT DoctorID,salary
FROM Doctor;

UPDATE Doctor
SET salary=salary*1.5;

SELECT DoctorID,salary
FROM Doctor;

DELETE FROM Medical_Record
WHERE Diagnosis='Diabetes';

SELECT *
FROM Medical_Record
WHERE PatientID IS NOT NULL AND SurgicalProcedure IS NULL AND BloodType = 'A+';

SELECT Name, Relationship, Gender
FROM Dependent
WHERE Relationship IN('mother','son');

SELECT medicalID, PatientID, BloodType
FROM Medical_Record
WHERE BloodType IN("O+","O-");

SELECT position,COUNT(DoctorID) AS count
FROM Doctor
GROUP BY position
ORDER BY count;


SELECT position,COUNT(DoctorID) AS count
FROM Doctor
GROUP BY position
HAVING count> 1
ORDER BY count;

SELECT MedicineID, MedicineName, cost
FROM Medicine
ORDER BY MedicineID DESC;

SELECT MedicineID, MedicineName, cost
FROM Medicine
ORDER BY cost;

SELECT DoctorID, fName, lName, specialization, salary
FROM Doctor
ORDER BY DoctorID , salary , specialization DESC;

SELECT *
FROM Doctor
WHERE DoctorID=(SELECT DoctorID
				FROM Patient
		        WHERE DoctorID=50001);

SELECT *
FROM Doctor AS D
        INNER JOIN Doctor_phone AS phone
             ON D.DoctorID= phone.DoctorID;
     
SELECT *
      FROM Patient 
            CROSS JOIN Dependent;
			
