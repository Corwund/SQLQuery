USE DBProducts
GO

SELECT ProductName as Product, CategoryName as Category FROM Products
LEFT JOIN ProductDescription
ON Products.ProductId = ProductDescription.ProductId
LEFT JOIN Categories 
ON ProductDescription.CategoryId = Categories.CategoryId;
GO