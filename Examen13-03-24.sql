/*
  Escribir un procedimiento almacenado que actualice el precio
  de los productos en un porcentaje dado solo si el stock actual
  está por debajo de un umbral específico.
  Utiliza IF-ELSE para implementar la lógica condicional.
*/

Create or alter procedure ejercicio1
@factorIncremento decimal(5,2),
@nivelStock int
as
begin
declare @precioFactor decimal(5,2) = 1 + (@factorIncremento/100)

update Products
set UnitsInStock = UnitsInStock * @precioFactor
where UnitsInStock<@nivelStock

end

 /*
   Ejercicio 2. Crear un procedimiento almacenado que genere un informe de ventas para
   un rango de fechas específico, en cual se debe generar la suma de las ventas
   por producto en el rango dado
 */
Create or alter procedure ejercicio2
@fechaInicio date,
@fechaFin date
as
begin

select p.ProductName, sum(v.UnitPrice * v.Quantity) as total
from Products as p
inner join
(
   select od.OrderID, od.UnitPrice, od.ProductID, od.Quantity
   from Orders as o
   inner join [Order Details] as od
   on o.OrderID = od.OrderID
) as v
on p.ProductID = v.ProductID
group by  p.ProductName


end

/*
  Ejercicio 3. Gestión de descuentos
Desarrollar un procedimiento almacenado que aplique un descuento a todos los pedidos ($)
de ciertos clientes, solo si el importe total de las ventas supera los 10000
*/

create or alter procedure  ejercicio3
@descuento decimal(5,2),
@idcliente int
as
begin

  declare @total decimal(10,2)

  select @total = sum (v.Quantity * v.UnitPrice)
  from customers as c
  inner join
  (
     select o.CustomerID, od.Quantity, od.UnitPrice
     from Orders as o
     inner join [Order Details] as od
     on o.OrderID = od.OrderID
  ) as v
  on c.CustomerID = v.CustomerID


  if @total > 10000
  begin
     update od
     set od.UnitPrice = od.UnitPrice - (@descuento * od.unitprice / 100)
     from [Order Details] as od
     inner join Orders as o
     on od.OrderID = o.OrderID
     inner join Customers as c
     on c.CustomerID = o.CustomerID
     where c.CustomerID = @idcliente
  end


end


/*
    Ejercicio 4.
Implementar un procedimiento almacenado que registre los cambios en las direcciones de los clientes.
Teniendo una tabla llamada auditoria con los siguientes campos:
•
CustomerId nvarchar(5)
•
OldAddress nvarchar(60)
•
NewAddress NVarchar(60),
•
ChangeDate Datetime Default GETDATE()
El procedimiento almacenado debe verificar si la nueva dirección es diferente a la que tiene el cliente,
si es así realizar el cambio en la tabla customers y registrar ese cambio en la tabla auditoria

*/


create table auditoria(
customerIb nvarchar(5),
oldaddress nvarchar(60),
newaddress nvarchar(60),
changedate datetime default getDate())

create or alter procedure ejercicio4
@idcliente int,
@nuevadireccion nvarchar(60)
as
begin

declare @direccion nvarchar(60)

select @direccion = c.Address
from Customers as c
where CustomerID = @idcliente

if @direccion <> @nuevadireccion
begin
   update customers
   set Address = @nuevadireccion
   where CustomerID = @idcliente

   insert into auditoria(customerIb,oldaddress,newaddress)
   values(@idcliente, @direccion,@nuevadireccion)

end
end