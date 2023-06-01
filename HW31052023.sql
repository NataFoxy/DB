1. Выполнить расчет З/П менеджеров за весь период заказов из расчета ставки в 10%

    SELECT
        SUM(OrderDetails.Quantity * Products.Price)/10 AS salary,
        Orders.EmployeeID
    FROM [OrderDetails]

    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    JOIN Orders ON OrderDetails.OrderID = Orders.OrderID

    GROUP BY  
        Orders.EmployeeID
----------------------------------------------------------------------------------------
2. Вывести сотрудников, у которых ко-во заказов менее 20

    SELECT 
        COUNT(*) AS orders_amount,
        Orders.EmployeeID,
        Employees.LastName,
        Employees.FirstName
    FROM [Orders]

    JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID

    GROUP BY Orders.EmployeeID
    HAVING orders_amount <=20
------------------------------------------------------------------------------------------
3. Вывести названия компаний-перевозчиков и сколько заказов каждая из них доставила
    SELECT 
        COUNT(*) AS total_shipped,
        Shippers.ShipperName
    FROM [Orders]

    JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID

    GROUP BY Orders.ShipperID
------------------------------------------------------------------------------------------
4. Для клиентов из Mexico очистить контактные имена

UPDATE 
	Customers
SET 
	ContactName = "DELETED"
WHERE 
	Country = "Mexico"