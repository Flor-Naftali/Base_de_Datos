
--Procedimientos Almacenados 
use NORTHWND
go


--SP para visualizar los clientes 
-- Crear SP
create proc visualizarClientes
AS
begin
select * from Customers
end
go

--cuando tengo que hacer un cambio en SP 
--tengo que usar un alter (esta es una sintaxis)
Alter proc visualizarClientes
AS
begin
select CompanyName, ContactName from Customers
end
go

--Eliminar SP
drop proc visualizarClientes
go

--Ejecutar SP siempre con un (Exec)
exec visualizarClientes
--o
execute visualizarClientes
go

--
create proc listarclientesporcuidad
@ciudad nvarchar(15)
as 
begin
select * from Customers
where City = @ciudad
end
go

exec listarclientesporcuidad 'London'

--
alter proc listarclientesporNombre
@nombre nvarchar(40)
as 
begin
select * from Customers
where CompanyName like @nombre + '%'
end
go

exec listarclientespornombre 'laz'

--realizar un SP que obtenga las ventas totales
--realizadas a los clientes por año elegido

create proc ventasclientesporaño
@año date 
as 
begin
select * from Orders 
where year(OrderDate) = '1996'
end

execute ventasclientesporaño '1996'

--SP para calcular el total de una Orden

create proc calcularorden
@idorder int
AS
begin --Iniciar untramo de codigo
select o.OrderID as 'numero de la orden' ,sum(od.Quantity * od.UnitPrice) as 'Total de la orden'
from Orders as o
inner join [Order Details] as od
on od.OrderID = o.OrderID
where o.OrderID = @idorder
group by o.OrderID
end
go

exec calcularorden '10273'

--JM
--SP para actualizar la 
--cantidad de productos en stock
create proc actualizarnumproductos
@nameproduct varchar(50), @numstock int
as
begin --Iniciar untramo de codigo
update Products
set UnitsInStock = @numstock
where ProductName = @nameproduct
end
go


exec actualizarnumproductos 'Alice Mutton', 0


-- SP para calcular el total de ventas de un empleado
create proc calcularventatotalempleado
@nameemplo varchar(50)
as
begin 
select concat(em.FirstName, ' ', em.LastName) as 'Nombre del empleado',
sum(od.Quantity * od.UnitPrice) as 'Total de la ventas'
from Employees as em
inner join Orders as o
on o.EmployeeID = em.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
where em.FirstName = @nameemplo
group by concat(em.FirstName, ' ', em.LastName)
end
go

select * from Employees
exec calcularventatotalempleado 'Steven'

--SP para actualizar la cantidad de productos en stock
create proc actualizarnombre
@idemplo int, @firstname varchar(20)
AS
begin 
UPDATE Employees
SET FirstName = @firstname
WHERE EmployeeID = @idemplo
end
go

exec actualizarnombre 1, 'Josepepe'

--SP para obtener el total de ventas por pais
--SP para actualizar la cantidad de productos en stock
create proc ventaporpais
as
begin 
select cus.Country as 'Pais',
sum(od.Quantity * od.UnitPrice) as 'Total de la ventas'
from Customers as cus
inner join Orders as o
on o.CustomerID = cus.CustomerID
inner join [Order Details] as od
on od.OrderID = o.OrderID
group by cus.Country
end
go

exec ventaporpais


--SP para obtener el numero de ordenes por cliente
create proc ordencliente
as
begin --Iniciar untramo de codigo
select cus.CompanyName as 'cliente',
sum(od.Quantity) as 'Total de Ordenes'
from Customers as cus
inner join Orders as o
on o.CustomerID = cus.CustomerID
inner join [Order Details] as od
on od.OrderID = o.OrderID
group by cus.CompanyName
end
go

exec ordencliente


--SP para calcular el total de productos 
--vendidos por categoria
create proc totalcategoria
as
begin 
select cat.CategoryName as 'Categoria del producto',
sum(od.Quantity) as 'Productos Vendidos'
from Categories as cat
inner join Products as p
on p.CategoryID = cat.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by cat.CategoryName
end
go

exec totalcategoria

--SP para calcular el total de ventas por año
create proc totalventasano
@ano char(4)
as
begin 
select 
sum(od.Quantity * od.UnitPrice) as 'total de Ventas'
from Orders as o
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on od.ProductID = p.ProductID
where year(o.OrderDate) = @ano
order by count(o.ShippedDate)
end
go

exec totalventasano '1996'

select * from Orders