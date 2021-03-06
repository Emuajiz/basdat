-- 1. MEMBUAT DATABASE COMPANY

CREATE DATABASE company;

-- 2. MASUK KE DATABASE COMPANY

\c company;

-- 3. MEMBUAT TABLE EMPLOYEE

CREATE TABLE Employee(
    SSN CHAR(9) NOT NULL,
    FName VARCHAR(15) NOT NULL,
    MName CHAR,
    LName VARCHAR(15) NOT NULL,
    BDate DATE,
    Address VARCHAR(30),
    Sex CHAR,
    Salary DECIMAL(10,2),
    SuperSSN CHAR(9),
    DNum INT NOT NULL,
    CONSTRAINT Employee_SSN_PK PRIMARY KEY(SSN),
    CONSTRAINT Employee_SuperSSN_FK FOREIGN KEY(SuperSSN) REFERENCES Employee(SSN)
);

-- 4. MEMBUAT TABLE DEPARTMENT

CREATE TABLE Department(
    DNumber INT NOT NULL,
    DName VARCHAR(15) NOT NULL,
    MgrSSN CHAR(9) NOT NULL,
    MgrStartDate DATE,
    CONSTRAINT Dept_DNumber_PK PRIMARY KEY(DNumber),
    CONSTRAINT Dept_DName_Unique UNIQUE(DName),
    CONSTRAINT Dept_MgrSSN_FK FOREIGN KEY(MgrSSN) REFERENCES Employee(SSN)
);

-- 5. MEMBUAT TABLE DEPT_LOCATION

CREATE TABLE Dept_Locations(
    DNum INT NOT NULL,
    DLocation VARCHAR(15) NOT NULL,
    CONSTRAINT DNumber_DLocation_PF PRIMARY KEY(DNum,DLocation),
    CONSTRAINT DLoc_DNum_FK FOREIGN KEY(DNum) REFERENCES
    Department(DNumber)
);

-- 6. MEMBUAT TABLE PROJECT

CREATE TABLE Project(
    PNumber INT NOT NULL,
    PName VARCHAR(15) NOT NULL,
    PLocation VARCHAR(15),
    DNum INT NOT NULL,
    CONSTRAINT Project_PNumber_PK PRIMARY KEY(PNumber),
    CONSTRAINT Project_PName_Unique UNIQUE(PName),
    CONSTRAINT Project_DNum_FK FOREIGN KEY(DNum)REFERENCES Department(DNumber)
);

-- 7. MEMBUAT TABLE WORKS ON 

CREATE TABLE Works_On(
    ESSN CHAR(9) NOT NULL,
    PNum INT NOT NULL,
    Hours DECIMAL(3,1) NOT NULL,
    CONSTRAINT Works_ESSN_PNum_PK PRIMARY KEY(ESSN,PNum),
    CONSTRAINT Works_ESSN_FK FOREIGN KEY(ESSN) REFERENCES Employee(SSN),
    CONSTRAINT Works_PNum_FK FOREIGN KEY(PNum) REFERENCES Project(PNumber)
);

-- 8. MEMBUAT TABLE DEPENDENT

CREATE TABLE Dependent(
    ESSN CHAR(9) NOT NULL,
    Dependent_Name VARCHAR(15) NOT NULL,
    Sex CHAR,
    BDate DATE,
    Relationship VARCHAR(8),
    CONSTRAINT Dependent_ESSN_DepName_PK PRIMARY KEY(ESSN,Dependent_Name),
    CONSTRAINT Dependent_ESSN_FK FOREIGN KEY(ESSN) REFERENCES
    Employee(SSN)
);

-- 9. INSERT DATA EMPLOYEE

INSERT INTO Employee VALUES
    ('E001', 'Hakim', null, 'Arifin', '12-Jan-1987','BATENG', 'M', 4000000, null, 1),
    ('E002','Yuni',null,'Arti','15-Feb-1987', 'BARA','F',4000000,null,2),
    ('E003','Mutia',null,'Aziza','23-Mar-1987','BATENG','F',4000000,null,3),
    ('E004','Hanif',null,'Affandi','21-Jan-1987','BARA','M',4000000,null,4),
    ('E005','Vera',null,'Yunita','16-May-1987','BALEBAK','F',3500000,'E001',1),
    ('E006','Pritasri',null,'Palupiningsih','09-Dec-1987','BADONENG','F',3500000,'E001',1),
    ('E007','Rifki','Y','Haidar','02-Aug-1987','BATENG','M',3000000,'E001',1),
    ('E008','Muhammad','A','Rosyidi','22-Jun-1987','PERUMDOS','M',2750000,'E001',1),
    ('E009','Ferry',null,'Pratama','11-Jul-1987','BARA','M',3000000,'E002',2),
    ('E010','Andi',null,'Sasmita','15-Feb-1987','BATENG','M',3000000,'E002',2),
    ('E011','Yuhan','A','Kusuma','16-Mar-1987','BARA','M',2500000,'E002',2),
    ('E012','Ferdian',null,'Feisal','23-Mar-1987','BATENG','M',2000000,'E002',2),
    ('E013','Albertus','A','M','22-May-1986','BARA','M',3000000,'E003',3),
    ('E014','Benedika','F','Hutabarat','21-Jun-1987','BADONENG','M',3250000,'E003',3),
    ('E015','Herbet',null,'Sianipar','16-Jul-1987','BARA','M',3750000,'E003',3),
    ('E016','Ferguso',null,'OTidakBisa','16-Sep-1998','CIBANTENG','M',5750000,'E003',3);

-- 10. INSERT DATA DEPARTMENT

INSERT INTO Department VALUES
    (1,'HRD','E001','09-Jan-2002'),
    (2,'FINANCE','E002','27-Feb-2003'),
    (3,'HUMAS','E003','30-May-2006'),
    (4,'PRODUKSI','E004','08-Mar-2005');

-- 11. INSERT DATA DEPT_LOCATION

INSERT INTO Dept_Locations VALUES
    (1,'Darmaga'),(3,'Darmaga'),(2,'Darmaga'),(4,'Baranang Siang');

-- 12. INSERT DATA PROJECT

INSERT INTO Project VALUES
    (1,'AAA','Bogor',1),(2,'BBB','Jakarta',2),
    (3,'CCC','Tangerang',2),(4,'DDD','Bekasi',2),
    (5,'EEE','Depok',3),(6,'FFF','Bogor',3),
    (7,'GGG','Tangerang',4),(8,'HHH','Jakarta',4);

-- 13. INSERT DATA WORKS ON 

INSERT INTO Works_On VALUES
    ('E001',1,90),
    ('E001',2,98),
    ('E002',2,55),
    ('E002',3,78),
    ('E003',3,53),
    ('E003',4,77),
    ('E004',4,77),
    ('E004',5,98),
    ('E004',7,85),
    ('E004',8,68),
    ('E005',5,57),
    ('E005',6,87),
    ('E006',7,45),
    ('E006',6,87),
    ('E007',7,40),
    ('E007',8,88),
    ('E008',1,78),
    ('E008',8,87),
    ('E009',1,88),
    ('E009',2,65),
    ('E010',2,34),
    ('E010',3,78),
    ('E011',1,68),
    ('E011',3,88);

-- 14. INSERT DATA DEPENDENT

INSERT INTO Dependent VALUES
    ('E001','Rita','F','18-Sep-2005','DAUGHTER'),
    ('E001','Doni','M','09-Jan-2007','SON'),
    ('E002','Wawan','M','23-Oct-1984','HUSBAND'),
    ('E002','Roy','M','15-Dec-2006','SON'),
    ('E003','Roni','M','23-AUG-1985','HUSBAND'),
    ('E003','Dewi','F','01-Jan-2006','DAUGHTER'),
    ('E004','Susi','F','05-Sep-1987','WIFE'),
    ('E004','Rani','M','10-Feb-2007','DAUGHTER'),
    ('E011','Dina','F','13-Jan-1987','WIFE'),
    ('E011','Riko','M','21-Mar-2006','SON'),
    ('E013','Rini','F','15-Aug-1987','WIFE'),
    ('E013','Tina','F','17-Dec-2005','DAUGHTER'),
    ('E014','Ayu','F','08-Dec-1988','WIFE'),
    ('E014','Didiet','M','05-Dec-2006','SON'),
    ('E015','Nita','F','25-Jan-1987','WIFE');

-- 15. CONTOH UPDATE DATA

UPDATE Employee SET Salary = 5000000 WHERE Address= 'BARA';

-- 16. CONTOH DELETE DATA

DELETE FROM Employee WHERE Address='PERUMDOS';

-- 17. SELECT FROM MULTIPLE TABLE

SELECT SSN, FName, LName, BDate FROM Employee
WHERE FName LIKE 'H%';

-- 18. CONTOH QUERY DATA CASE

SELECT SSN, FName, Salary,
  CASE
  WHEN Salary > 3500000 THEN 'Top'
  ELSE 'Middle'
  END AS Level
FROM Employee
ORDER BY SSN;

-- 19. CONTOH-CONTON QUERY

SELECT MAX(Salary), MIN(Salary), AVG(Salary) FROM Employee;
-----------------------------------------------------------------
SELECT COUNT(SSN) AS Jumlah_Employee_di_BARA FROM Employee WHERE Address = 'BARA';
-------------------------------------------------------------------------------------
SELECT COUNT(DISTINCT PLocation) AS "distinct lokasi", COUNT(PLocation) AS "total lokasi"
FROM Project;
--------------------------------------------------------------------------------------------
SELECT Dnum, Min(Salary), MAX(Salary), AVG(Salary) FROM Employee
GROUP BY DNum
ORDER BY DNum DESC;
-----------------------------------------------------------------------------------
SELECT Address, COUNT(*) FROM Employee
GROUP BY Address
HAVING COUNT(*) > 4
ORDER BY Address;


SELECT Employee.fname ||' '|| Employee.mname AS SS,
    B.fname as emp
    FROM Employee B
    LEFT JOIN Employee
    ON (Employee.ssn = B.superssn);
