--Vistas 
create view vistaconsulta
as
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

select * from vistaconsulta
where [Nombre Cliente] = 'Vaffeljernet'

select sum([Total de compras del cliente]) as Total
from vistaconsulta
where year([Fecha Primera compra]) = '1997'

--2
create view vistaconsulta2
as
select p.ProductName, p.UnitsInStock,
sum (od.Quantity * od.UnitPrice) 
from Products as p
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by p.ProductName, p.UnitsInStock
having count (od.OrderID) > 0
order by 2 desc

--3
create view vistaconsulta2
as

