--Realizar codigo transac si  una persona tiene la edad para beber alcohol
--debe tener una variable que determine la edad minima permitida  y otra varaible con la edad de la persona 
--se debe compararsi la persona si la persona tiene  la edad minima permitida mostrando un mensaje donde diga'Edad permitida'
--y si no 'edad no permitida
declare @edadminima int = 17; 
declare @edadcliente int = 18;
if @edadcliente >= @edadminima
begin
print 'Edad permitida';
end
else
begin
print 'Edad no permitida';
end

--Solcitar Evaluacion 
-- >=90 imprimir A
-- >=80 imprimir B
-- >=70 imprimir C
-- >=60 imprimir F

declare @puntaje int = 90; 

if @puntaje >= 90
print 'A';
else if @puntaje >= 80
print 'B';
else if @puntaje >= 70
print 'C';
else if @puntaje >= 60
print 'D';
else
print 'F';

--Solicitar un Salario 
-- > 4000
-- calcular el incremento 20%
-- >= 5000
-- calcular incremento 30%
-- < 4000 
-- aumento = 0%
-- print (aumento)

declare @salario decimal (10, 2) = 4500; -- Salario de la persona
if @salario > 5000
set @salario = @salario * 1.30; -- Incremento del 30% si el salario es mayor o igual a 5000
else if @salario > 4000
set @salario = @salario * 1.20; -- Incremento del 20% si el salario es mayor que 4000 pero menor que 5000
else
set @salario = @salario * 1.0; -- No hay incremento si el salario es menor o igual a 4000
print 'Nuevo salario: ' + cast(@salario as varchar);

/* Generar un sp en donde se compare si un producto tiene mas de 100 unidades 
en stock, incrementar su precio en un 10% de lo contrario incrementarlo en 20% */
create proc incrementarprecioproducto
@productID INT
as
begin
declare @stock int;
declare @precio decimal(10, 2);
declare @nuevoPrecio decimal(10, 2);
-- Obtener el stock y el precio actual del producto
select @stock = UnitsInStock, @precio = UnitPrice
from Products
where ProductID = @productID;
if @stock > 100
set @nuevoPrecio = @precio * 1.10; -- Incremento del 10% si el stock es mayor que 100
else
set @nuevoPrecio = @precio * 1.20; -- Incremento del 20% si el stock es igual o menor que 100
-- Actualizar el precio del producto en la base de datos
update Products
set UnitPrice = @nuevoPrecio
where ProductID = @productID;
print 'El precio del producto ' + cast (@productID as varchar) + ' ha sido actualizado.';
end
go


-- 
declare @x varchar (20)
set @x = 12.5

print ('El valor de x es:' + @x) 
--
declare @cantidad int
select = count (*) from Customers

print (@cantidad) 


