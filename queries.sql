CREATE database HealthecareProj; 

CREATE TABLE Patient_Data(
	Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(6),
    BloodType VARCHAR(3),
    MedicalCondition VARCHAR(15),
    DateAdmission DATE,
    Doctor VARCHAR(100),
    Hospital VARCHAR(100),
    Insurance VARCHAR(100),
    BillingAmt DECIMAL(18,2),
    RoomNumber INT,
    AdmissionType VARCHAR(30),
    DischargeDate DATE,
    Medication VARCHAR(50),
    TestResults VARCHAR(15));

#Importing Data
LOAD DATA INFILE 'STORED LOCATION'
INTO TABLE Patient_Data
FIELDS TERMINATED BY ','
ENCLOSED BY'"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

#Testing to see if import is configured correctly
SELECT *
FROM Patient_Data
LIMIT 10;

#Finding the average age for patients
SELECT AVG(Age)
FROM Patient_Data;

#Finding the count of patients by gender
SELECT Gender, COUNT(*) AS PatientCount
FROM Patient_Data
Group By Gender;

#Months that have a higher patient admission sorted in descending order
SELECT MONTH(DateAdmission) AS Month, COUNT(*) AS Admissions
FROM Patient_Data
Group By Month
Order By Admissions DESC;

#Most commonly prescibed medication
SELECT Medication, COUNT(*) AS PrescribedCount
FROM Patient_Data
Group By Medication
Order By PrescribedCount DESC;

#Average stay for patients admitted
SELECT AVG(DATEDIFF(DischargeDate,DateAdmission)) AS AverageStay
From Patient_Data;

