--isimler ve görevler
SELECT 
CONCAT(p.FirstName, ' ', p.LastName) AS İsimler,
e.jobtitle
FROM Person.Person p
INNER JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID;
GO
--ise başlama tarihleri
SELECT
BusinessEntityID,
jobtitle,
HireDate,
YEAR(HireDate) AS IseBaslamaYili
FROM HumanResources.Employee
ORDER BY HireDate DESC;
GO
--isie baslama tarihleri ve calisma yili
SELECT
CONCAT (p.FirstName, ' ', p.LastName) AS İsimler,
e.jobtitle,
e.HireDate,
DATEDIFF(YEAR, e.HireDate, GETDATE()) AS CalismaYili
FROM Person.Person p
INNER JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID
ORDER BY e.HireDate ASC;
GO
--gorev durumları
SELECT
BusinessEntityID,
ISNULL(CAST(EndDate AS VARCHAR), 'Aktif Görev') AS GorevDurumu
FROM HumanResources.EmployeeDepartmentHistory;
GO
--gorev durumları ve isimler
SELECT
p.LastName,
eph.Rate
FROM Person.Person p
INNER JOIN HumanResources.EmployeePayHistory eph
ON p.BusinessEntityID = eph.BusinessEntityID
WHERE eph.Rate > (SELECT AVG(Rate) FROM HumanResources.EmployeePayHistory);
--top 10 çalışan ve işe başlama tarihleri
SELECT TOP 10
CONCAT(p.FirstName, ' ', p.LastName) AS İsimler,
e.jobtitle,
e.HireDate
FROM Person.Person p
INNER JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID
ORDER BY e.HireDate DESC;
--çalışan sayısı ve işe başlama yılları
SELECT 
YEAR(HireDate) AS IseBaslamaYili ,
Count(*) AS çalışan_sayısı
FROM HumanResources.Employee
GROUP BY YEAR(hireDate)
ORDER BY IseBaslamaYili desc ;





