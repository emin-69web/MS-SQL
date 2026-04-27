
USE AdventureWorks2022;
GO
-- ilk 20 satırı getirir
SELECT TOP 20 *
FROM Purchasing.Vendor;
GO
-- sadece aktif olan satırları getirir
SELECT BusinessEntityID, Name, ActiveFlag
FROM Purchasing.Vendor
WHERE ActiveFlag = 1;
GO
-- sadece aktif olan satırları getirir ve kredi notuna göre sıralar
SELECT Name, CreditRating
FROM Purchasing.Vendor
ORDER BY CreditRating;
GO
-- 20 satır getirir ve ürün kimliği, standart fiyat ve ortalama teslim süresini gösterir
SELECT TOP 20 *
FROM Purchasing.Vendor;
GO
-- 20 satır getirir ve ürün kimliği, standart fiyat ve ortalama teslim süresini gösterir
SELECT TOP 20
pv.BusinessEntityID,
pv.ProductID,
pv.StandardPrice,
pv.AverageLeadTime
FROM Purchasing.ProductVendor AS pv;
-- average lead time'ı 20'den büyük olan satırları getirir
SELECT BusinessEntityID, ProductID, StandardPrice, AverageLeadTime
FROM Purchasing.ProductVendor
WHERE AverageLeadTime > 20
GO
--20 satır getirir
SELECT TOP 20 *
FROM Production.Product;
GO
-- 20 satır getirir ve ürün adı, ürün kimliği, standart fiyat ve ortalama teslim süresini gösterir
SELECT TOP 20 
v.Name AS Vendoradi,
p.Name AS Urunadi,
pv.StandardPrice,
pv.AverageLeadTime
FROM Purchasing.ProductVendor pv
INNER JOIN Purchasing.Vendor v
ON pv.BusinessEntityID = v.BusinessEntityID
INNER JOIN Production.Product  p
ON pv.ProductID = p.ProductID
GO
--10 satır getirir ve ürün adı, ürün kimliği, standart fiyat ve ortalama teslim süresini gösterir, standart fiyata göre azalan şekilde sıralar
SELECT TOP 10 
v.Name AS Vendoradi,
P.Name AS Urunadi,
pv.StandardPrice
FROM Purchasing.ProductVendor PV
INNER JOIN Purchasing.Vendor V
ON pv.BusinessEntityID = v.BusinessEntityID
INNER JOIN Production.Product  P
ON p.ProductID = pv.ProductID
ORDER BY pv.StandardPrice DESC;
GO

