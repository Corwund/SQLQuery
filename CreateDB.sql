CREATE DATABASE DBProducts;
GO

USE DBProducts
GO

CREATE TABLE Products
(
	ProductId INT NOT NULL IDENTITY,
	ProductName NVARCHAR(30) NOT NULL,
	ProductPrice MONEY NOT NULL
)

GO

ALTER TABLE Products
ADD CONSTRAINT PK_ProductID
PRIMARY KEY (ProductId);

CREATE TABLE Categories
(
	CategoryId INT IDENTITY 
		CONSTRAINT PK_CategoryId PRIMARY KEY,
	CategoryName NVARCHAR(40) NOT NULL
)
GO

CREATE TABLE ProductDescription
(
	Id INT IDENTITY PRIMARY KEY,
	ProductId INT NOT NULL, 
	CategoryId INT NOT NULL,
	CONSTRAINT FK_Products_ProductDescript
	FOREIGN KEY (ProductId) REFERENCES Products (ProductId)
	ON DELETE CASCADE,
	CONSTRAINT FK_Category_ProductDescript
	FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
)
GO

INSERT INTO Products
VALUES
(' уртка', 6000 ),
('ѕальто', 15000),
('Ѕрюки Le Role', 3500),
('Ѕрюки Concept Club', 1200),
('‘утболка Zarina', 600)
GO

INSERT INTO Categories
VALUES
('детска€ одежда'),
('взросла€ одежда'),
('женска€ одежда'),
('мужска€ одежда'),
('ткань'),
('кожа'),
('зимн€€ одежда'),
('летн€€ одежда')
GO

INSERT INTO ProductDescription
VALUES
(1,2),
(1,7),
(3,3),
(3,2),
(3,5),
(4,2),
(4,8),
(4,6),
(5,1),
(5,3)
GO

SELECT ProductName as Product, CategoryName as Category FROM Products
LEFT JOIN ProductDescription
ON Products.ProductId = ProductDescription.ProductId
LEFT JOIN Categories 
ON ProductDescription.CategoryId = Categories.CategoryId
