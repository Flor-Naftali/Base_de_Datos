--Examen V1 
--1
select p.ProductName as 'NombreProducto' (od.Quantity * od.UnitPrice) as 'Importe'
from [OrderDetails] as od
inner join Products as p
on p.ProductID = od.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
where year(O.OrderDate) = '1997'
order by 2

--2
select c.CompanyName as 'Cliente', count(*) as 'Cantidad Compras' 
from orders as o 
inner join Customers as c
on o.CustomerID = c.CustomerID
group by c.CompanyName
having count(*) >1 

--3 
select (*) from Products as p
left join [OrderDetails] as od
on p.ProductID = od.ProductID
where od.ProductID is null
order by p.ProductName asc

--4