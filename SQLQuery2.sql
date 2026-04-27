-- Veritabanı oluşturma
USE AdventureWorks2022;
GO

--1. CONCAT - Ad Soyad
SELECT CONCAT(FirstName, ' ', LastName, '-çalışan') AS Bilgi
FROM Person.Person;
GO

--2. YEAR - İşe Giriş Yılı
SELECT HireDate, YEAR(HireDate) AS İşeGirişYılı
FROM HumanResources.Employee
ORDER BY HireDate DESC;
GO
--3.DATEDIFF
SELECT HireDate,
DATEDIFF(YEAR, HireDate, GETDATE()) AS ÇalışmaYılı
FROM HumanResources.Employee
GO
--4.DATEDIFF - Çalışma Yılı
SELECT HireDate,
DATEDIFF(YEAR, HireDate, GETDATE()) AS ÇalışmaYılı
FROM HumanResources.Employee
WHERE DATEDIFF(YEAR, HireDate, GETDATE()) >14;
GO

--5 ISNULL ( Boş Veriyi Değiştirme)
SELECT ISNULL(CAST(Enddate AS VARCHAR),'DevamEdiyor') AS İşDurumu
FROM HumanResources.EmployeeDepartmentHistory;
GO
--6: SUBQUERY - İç İçe Sorgu
 SELECT Rate
 FROM HumanResources.EmployeePayHistory
WHERE Rate > (
SELECT AVG(Rate)
FROM HumanResources.EmployeePayHistory);
GO
--7: Yıllara Göre İşe Alım 
SELECT YEAR(HireDate) AS Yıl, COUNT(*) AS CalisanSayisi
FROM HumanResources.Employee
GROUP BY YEAR(HireDate)
ORDER BY CalisanSayisi DESC;
GO 

--8. İsim ve İşe Giriş Yılı
SELECT CONCAT(p.FirstName, ' ', p.LastName) AS AdSoyad,
e.Jobtitle
FROM Person.Person AS p
INNER JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID;
GO

--9. Unvanında Asistan Geçen Çalışanlar
SELECT CONCAT(p.FirstName, ' ', p.LastName) AS AdSoyad,
e.Jobtitle
FROM Person.Person AS p
INNER JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID
WHERE e.JobTitle LIKE '%Assistant%';
GO
