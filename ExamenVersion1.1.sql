use NORTHWND
go

--Examen V1 
--1
select p.ProductName as 'NombreProducto', (od.Quantity * od.UnitPrice) as 'Importe'
from [Order Details] as od
inner join Products as p
on p.ProductID = od.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
where year(O.OrderDate) = '1997'
order by 2

select * from [Order Details]

--2
select c.CompanyName as 'Cliente', count(*) as 'Cantidad Compras' 
from Orders as o 
inner join Customers as c
on o.CustomerID = c.CustomerID
group by c.CompanyName
having count(*) >1 

--3 
select * from Products as p
left join [Order Details] as od
on p.ProductID = od.ProductID
where od.ProductID is null
order by p.ProductName asc

--4
select c.CategoryName,count(*) as 'Total'
from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName
having count (*)>10;

--5
select p.ProductID as 'Nombre del Producto', 
c.CategoryID as 'Nombre '
from Products as p 
inner join Categories as c
on p.CategoryID = c.CategoryID
where p.UnitPrice = 50
order by 1,2 

--Examen V2
--1
select c.CompanyName as 'Nombre Cliente'
,min(o.OrderDate) as 'Fecha Primera compra',
sum(od.Quantity * od.UnitPrice) as 'Total de compras del cliente'
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Customers as c
on c.CustomerID = o.CustomerID
group by c.CompanyName
having sum(od.Quantity * od.UnitPrice) >1000
order by 'Total de compras del cliente'  desc

-- 
