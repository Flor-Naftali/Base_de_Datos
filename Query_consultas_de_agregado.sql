-- Consultas de agregado.
-- caracteristicas principales q¿es que devuelven un solo registro 
use NORTHWND
-- top y parcent 

--selecciona las primeras 10 ordenes de compra\

-- los primeros 10 registros 
select top 10 * from Orders

-- los ultimos 10 registros 
select top 10 * from Orders
order by OrderID desc

-- los ultimos 10 con alias (as)
select top 10 CustomerID as 'numero de cliente ', 
OrderDate as 'fecha de orden',
ShipCountry as 'pais de entrega' from Orders
order by OrderID desc

-- seleccionar el 50% de los registros (persent)
select top 50 percent * from Orders
-- el 25%
select top 25 percent * from Orders

-- seleccionar los primeros 3 clientes de alemania
select * from Customers
where Country = 'germany'

select top 3 * from Customers
where Country ='germany'
-- sin alias 
select top 3 CompanyName , Country, Address
from Customers where Country ='germany'
-- con alias 
select top 3 CompanyName as 'cliente', 
Country as pais, Address as direccion
from Customers
where Country ='germany'

-- seleccionar el producto con el precio mayor 
select * from Products
order by UnitPrice desc

--muestra el precio mas alto de los productos 
--(max'consultas d agregado(solo da una dato)')

select max(unitprice) as 'precio maximo' from Products

-- mostrar el precio minimo de los productos 
select max(unitprice) as 'precio maximo' from Products

-- seleccionar todas las ordenes de compra 
select * from Orders

--seleccionar el numero total de ordenes (count)
select count(*) from Orders
-- con alias 
select count(*) as 'total de ordenes' from Orders
--
select count(ShipRegion) as 'total de ordenes' from Orders
-- seleccionar todas aquellas ordenes donde la 
--region de envio no sea null 
select * from Orders
where ShipRegion is not null 

select count(ShipRegion) from orders

--seleccionar de forma ascendente los productos por precio
select * from Products
order by UnitPrice 

-- seleccionar el numero de precios  de los productos
select count(distinct UnitPrice) as 'numero de precios' 
from Products
-- todos los precios 
select distinct UnitPrice as 'Precios' 
from Products

-- contar todos los diferentes paises de los clientes (count 'cuenta')
select distinct country as paises from Customers

select count (distinct country) as 'numero paises' from Customers

-- seleccionar la suma total de cantidades de las ordenes de compra (sum 'acumula') 
select sum(Quantity) from [Order Details]

-- seleccionar todos los registros de orderdetails calculando su importe
-- (campo calculado)
select *,(UnitPrice*Quantity) as importe 
from [Order Details]
-- seleccionar el total en dinero que ha vendido la empresa
select * from [Order Details]
select sum(UnitPrice*Quantity) as total 
from [Order Details]

--seleccionar el total de venta del producto chang
select * from Products
select * from [Order Details]
select sum(UnitPrice*Quantity) as Total 
from [Order Details]
where ProductID = 2

--seleccionar el promedio de los precios de los productos 
select * from Products
select avg(UnitPrice) as Total from Products
-- seleccionar el promedio total y el total 
-- de venta de los productos 41, 60 y 31 
select sum(UnitPrice*Quantity) as Total, avg (UnitPrice*Quantity)
from [Order Details]
where ProductID in (41,60,31)
--- mas larga
select sum(UnitPrice*Quantity) as Total, avg (UnitPrice*Quantity)
from [Order Details]
where ProductID = 41 or ProductID = 60 or ProductID = 31

-- Seleccionar el numero de ordenes realizadas entre 1996 y 1997
select count(*) from Orders
where OrderDate>='1996-01-01' and OrderDate<='1997-12-31'

select count(*) from Orders
where OrderDate between '1996-01-01' and '1997-12-31'

select year(OrderDate) from Orders

select count(*) from Orders
where year(OrderDate)='1996'

select count(*) from Orders
where year(OrderDate)in('1996', '1997')

select count(*) from Orders
where year(OrderDate)between '1996' and '1997'

-- instruccion group by 02/02/2024
--seleccionar el numero de clientes agrupados por pais 
select * from Customers
-- Group by 
select Country as Pais, count(*) as 'Total de Clientes'
from Customers 
group by Country
order by 1 desc

-- seleccionar el numero de ordenes enviadas por el shipvia 
select * from Orders
select ShipVia/*el nombre tiene que ser igual que el grou by*/,
count(*) as 'Numero de Ordenes'
from orders  
group by ShipVia
-- consulta extensa con 'inner join'
select s.CompanyName as 'Nombre Compania',
count(*) as 'Total'
from orders as o   
inner join Shippers as s
on o.ShipVia = s.ShipperID
group by s.CompanyName
-- repaso a los joins 
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