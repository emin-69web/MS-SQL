USE AdventureWorks2022;
GO
--Çalışanların adını ve soyadını birleştirerek tek bir sütunda yazdırma
SELECT CONCAT (FirstName, ' ', LastName, '(çalışan)') AS AdSoyad
FROM Person.Person
GO
--Çalışanların adını büyük harf, soyadını küçük harf olarak yazdırma
SELECT UPPER (FirstName) AS Ad, LOWER (LastName) AS Soyad
FROM Person.Person;
GO
--Çalışanların adının uzunluğu 10 karakterden fazla olanların soyadları ve adlarının uzunluğu
SELECT LastName, LEN(FirstName)
FROM Person.Person
WHERE LEN(FirstName) > 10;
GO
--çalışanların adının ilk 10 harfi ve soyadının son 7 harfi
SELECT LEFT (FirstName, 10) AS AdBasHarf, RIGHT (LastName, 7) AS SoyadSonHarf
FROM Person.Person;
GO
--İki tarih  arasındaki farkı yıl olarak hesaplama
SELECT HireDate,
DATEDIFF(YEAR, HireDate, GETDATE()) AS CalismaYili
FROM HumanResources.Employee
GROUP BY HireDate
ORDER BY CalismaYili ASC;
GO
--Çalışanların telefon numarası yoksa 'Telefon numarası yok' yazdırma
SELECT *
FROM HumanResources.EmployeeDepartmentHistory
WHERE EndDate IS NOT NULL;
GO
--Çalışanların çalışmaya başladığı tarihten itibaren geçen süreyi yıl olarak hesaplama
SELECT ISNULL(CAST(EndDate AS VARCHAR), 'Aktif Çalışan') AS CalismaDurumu
FROM HumanResources.EmployeeDepartmentHistory;
GO
--Çalışanların maaşlarının ortalamasından yüksek olan maaşları yazdırma
SELECT Rate
FROM HumanResources.EmployeePayHistory
WHERE Rate > (
SELECT AVG(Rate)
FROM HumanResources.EmployeePayHistory);
GO
--ad,soyad, iş unvanı, kaç yıldır çalışıyor, ücret seviyesi
SELECT CONCAT (p.FirstName, ' ', p.LastName) AS AdSoyad, 
e.JobTitle,
DATEDIFF(YEAR, e.HireDate, GETDATE()) AS CalismaYili,
CASE 
WHEN eph.Rate < 30 THEN 'Düşük'
WHEN eph.Rate BETWEEN 30 AND 50 THEN 'Orta'
ELSE 'Yüksek'
END AS UcretSeviyesi
FROM Person.Person p
INNER JOIN HumanResources.Employee e 
ON p.BusinessEntityID = e.BusinessEntityID
JOIN HumanResources.EmployeePayHistory eph
ON e.BusinessEntityID = eph.BusinessEntityID
ORDER BY CalismaYili DESC;
GO
--çalışanların adı ve mail adresini yazdırma
SELECT CONCAT (p.FirstName, ' ', p.LastName) AS AdSoyad
FROM Person.Person p , 
INNER JOIN p.FirstName, p.LastName
SELECT EmailAddress 
INNER JOIN Person.EmailAddress ea
FROM Person.EmailAddress ea
WHERE p.BusinessEntityID = e.BusinessEntityID
FROM Person.Person p 
GO


