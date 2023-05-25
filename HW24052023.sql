1. Вывести стоимость и название двух самых дешевых товаров из Germany

SELECT 
    ProductName,
    Price
FROM [Products]
ORDER BY Price
LIMIT 2
---------------------------------------------------------------------------------

2. Вывести ко-во и сред/стоимость товаров из USA

SELECT 
    COUNT (*) AS total_amount_of_products,
    AVG (Price),
    Suppliers.Country
FROM [Products]

JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE 
    Suppliers.Country='USA'
---------------------------------------------------------------------------------

3. Вывести ко-во заказов, которое компания Speedy Express доставила в Brazil

SELECT 
    COUNT (*) AS orders_amount,
    Customers.Country,
    Shippers.ShipperName
FROM [Orders]

JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
    Shippers.ShipperName = 'Speedy Express'
AND
    Customers.Country = 'Brazil'
-----------------------------------------------------------------------------------

4. Вывести среднюю стоимость проданного в Germany товара

SELECT 
    AVG (Price),
    Customers.Country
FROM [Orders]

JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID

WHERE
    Customers.Country = 'Germany'
----------------------------------------------------------------------------------

5. У всех поставщиков не из Germany очистить номер телефона

UPDATE 
    Suppliers
SET 
    Phone = 'NULL'
WHERE NOT
    Country = 'Germany'