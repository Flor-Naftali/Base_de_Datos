--Consultas con joins
--inner join
use NORTHWND
--seleccionar el numero de orden, nombre del cliente y la fecha 

select OrderID,CompanyName,OrderDate
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID

select OrderID,CompanyName,OrderDate
from Orders 
inner join Customers 
on Orders.CustomerID = customers.CustomerID

--Mostrar el numero de ordenes de cada cliente mostrando el nmbre de la compania 

select CompanyName, count (*) 'total de pedidos'
from Orders as o 
inner join customers as c 
on c.CustomerID = o.CustomerID
group by CompanyName 
order by 2 desc 

/*seleccionar el numero de productos, el nombre del producto y el 
nombre de la categoria ordenados de forma ascendente con respecto al nombre de
la categoria*/

--07-Febrero-2024
--Ejemplo
select c.CompanyName from Customers as c
inner join Orders as o 
on c.CustomerID = o.CustomerID --Cuando hay un inner join siempre tiene que tener un 'on'

--Seleccionar todas las ordenes compra
--mostrando las fechas ordenes de compra 
--nombre del shipper y el nombre del cliente
--al que se le ha vendido (inner join)
--enlazado de 3 tablas (cuando use mas de tres tablas ordenalas con alias)
select c.CompanyName as 'Cliente', 
o.OrderDate as 'Fecha de Orden',
s. CompanyName as 'Nombre Flete'
from Customers as c
inner join Orders as o 
on c.CustomerID = o.CustomerID 
inner join Shippers as s
on o.ShipVia = s.ShipperID

--seleccionar el nombre del producto y su categoria
select p.ProductName, c.CategoryName from Products as p
inner join Categories as c
on p.CategoryID = c.CategoryID
-- listar el nombre del cliente, la fechade la orden,
-- los nombres de los productos que fueron vendidos
select c.CompanyName, o.OrderDate, p.ProductName from
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on o.OrderID = o.OrderID 
inner join Products as p
on od.ProductID = p.ProductID

--selccionar los nombres completos de los empleados,
-- los combres de los productos que vendio y la cantidad de ellos.
-- y calcular el importe

select CONCAT (e.FirstName, od.Quantity) as 'Nombre Completo', 
p.ProductName as 'Direccion',
od.Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe'
from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = od.OrderID
inner join Products as p
on p.ProductID = od.ProductID

--selccionar los nombres completos de los empleados,
-- los combres de los productos que vendio y la cantidad de ellos.
-- y calcular el importe pero de Suiza, Alemania y Francia
select * from Employees
select * from Customers

select CONCAT (e.FirstName, '', e.LastName) 
as 'Nombre Completo', p.ProductName as 'Direccion',
od.Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe'
from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = od.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France','Germany','Switerland')
group by 

--selccionar los nombres completos de los empleados,
-- los combres de los productos que vendio y la cantidad de ellos.
-- y calcular el importe pero de Suiza, Alemania y Francia
-- agrupados por la cantidad total de las ordenes hechas por los 
-- empleados

select CONCAT (e.FirstName, '', e.LastName) 
as 'Nombre Completo', count (*) as 'total de ordenes', 
p.ProductName as 'Direccion',
od.Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe', o.ShipCountry
from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = od.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France','Germany','Switerland')
group by CONCAT (e.FirstName, '', e.LastName) 

--Profe
-- Total de ordenes enviadas a Francia, alemania y suiza
select count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')


-- Seleccionar el numero de ordenes enviadas a alemania, suiza y francia
-- agrupadas por el empleado
select count(*) as 'Total de Ordenes', CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName)

-- Seleccionar el numero de oredenes enviadas a alemena 

Total de ordenes enviadas a Francia, alemania y suiza
select count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')


-- Seleccionar el numero de ordenes enviadas a alemania, suiza y francia
-- agrupadas por el empleado
select count(*) as 'Total de Ordenes', CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName)

-- Seleccionar el numero de ordenes enviadas a alemania,
-- suiza y francia, agrupadas por el empleado y el pais de envio
select CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo',o.ShipCountry ,count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName), o.ShipCountry
order by 1

-- 08-02-2024
select CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo',o.ShipCountry ,count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland') and e.FirstName in ('Andrew')
group by CONCAT(e.FirstName, ' ', e.LastName), o.ShipCountry

--Seleccionar el total de dinero que se le han
-- vendido a cada uno de los clientes de 1996 

select companyName as 'Cliente',
sum(UnitPrice * Quantity) as 'Total de venta'
from
[Order Details] as od
inner join
Orders as o
on od.OrderID = o.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID
where year(o.OrderDate) = '1996'
group by companyName
order by 2 desc

--Seleccionar el total de dinero que se le han
--vendido a cada uno de los clientes 
--por cada año

select companyName as 'Cliente',
sum(UnitPrice * Quantity) as 'Total de venta'
from
[Order Details] as od
inner join
Orders as o
on od.OrderID = o.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID
where year(o.OrderDate) 


select * from Orders

--Selccionar el importe total que se ha vendido
--por categoria de producto

select * from 