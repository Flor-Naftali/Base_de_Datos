
-- Consultas Simples con Select - SQL-LMD
use NORTHWND

-- Seleccionar todos los Clientes 
select * from Customers

-- Seleccionar el nombre del cliente , nombre contacto y la ciudad
select CompanyName, ContactName, City from Customers

-- Seleccionar todos los paises de los clientes (distinct)quita los valores repetidos de un campo
select country from Customers

select distinct country from Customers

-- Slecciona el numero de paises de donde son mis clientes (count)

select count(*) from Customers

select count(country) from Customers

select count(distinct country) from Customers -- quita valores repedidos de una columna

-- Seleccionar en cliente que tenga un ID 1 ANTON

select * from Customers 
where CustomerID = 'ANTON'

-- Sleccionar todos los clientes de México

select * from Customers 
where Country = 'Mexico'

-- Seleccionar todos los registros de Berlin

select CompanyName, City, Country from Customers 
where City = 'Berlin'

-- Order by 
-- Selccionar todos los productos ordenados por precio

select * from Products
order by UnitPrice

-- Seleccionar todos los productos ordenados por el precio de mayor a menor

select * from Products
order by UnitPrice DESC

-- Seleccionar todos los productos alfabeticamente 

select * from Products
order by ProductName

select * from Products
order by ProductName DESC

-- Seleccionar todos los clientes por pais y dentro por nombre de forma ascendente

select country, CompanyName, city from Customers
order by Country desc, CompanyName asc

-- Operador and
-- seleccionar todos los clientes de España y que su Nombre comience con 'G'

select * from Customers
where country = 'Spain' and CompanyName like 'G%'

/*Seleccionar todos los clientes de Berlin, 
alemania  con un codigo postal mayor a 200 */

select * from Customers
where country = 'Germany' and
city = 'Berlin' and PostalCode >1200

/*Seleccionar todos los clientes de españa y 
que su nombre y que  su nombre comienze con G o R*/

select * from Customers
where country = 'Spain'
and (CompanyName like 'G%'or CompanyName like 'R%')

-- Clausula or (opciones entre uno y otro and no puede)
/* Seleccionar todos los clientes de alemania o españa*/

select * from Customers
where Country = 'spain' or Country = 'Germany'

-- Seleccionar todos los clientes de berlin o de noruega 
-- y que comienze su nombre con G

select * from Customers
where Country = 'Norway' or City = 'Berlin' or CompanyName like 'G%'

-- Seleccionar solo los clientes que no son de españa 

select * from Customers
where not Country = 'Spain'

/* Seleccionar todos los productos que 
no tengn un presio entre 18 y 20 dolares*/
-- un rango siempre es un 'and'

select * from Products
where UnitPrice >= 18 and UnitPrice <= 20
-- not tiene mayor prioridad que and y or
select * from Products
where not (UnitPrice >= 18 and UnitPrice <= 20)
--bettween
select * from Products
where UnitPrice not between 18 and 20

--Seleccionar todos los clientes que no son de paris o de londres

select * from Customers
where not (City = 'london' or City = 'Paris')

select * from Customers
where City in ( 'london','Paris')

select * from Customers
where City not in ( 'london','Paris')

-- Seleccionar todos los productos que no tienen precios mayores a 30

select * from Products 
where not UnitPrice >= 30

-- Seleccionar todos los productos que no tienen precios menores a 30

select * from Products 
where not UnitPrice <= 30

-- Operador like
-- Seleccionar todos los clientes que comienzan con la letra a

select * from Customers
where CompanyName like 'A%'

-- Seleccionar todos los clientes que finalizan con la palabra "es"

select * from Customers
where CompanyName like '%es'

-- Seleccionar todos los clientes que comienzan con la palabra "mer"

select * from Customers
where CompanyName like '%mer%'

-- _ sustituye cualquien caracter
/*Seleccionar todos los clientes con una ciudad que comienze 
con cualquier caracter seguido de la palabra "Ondon"*/

select * from Customers
where city like '_ondon'

-- Seleccionar todos los clientes con una cuidad que comience con 'L'y 
-- seguido de tres cualquiera y que termine con la palabra 'on'

use NORTHWND

select * from Customers
where city like 'L___on'

-- Seleccionar todos los productos que comienzen 
-- con la letra 'a' o 'c' o 't' 

select * from Products
where ProductName like '[act]%'

-- Seleccionar todos los productos que comikenzen de la letra b a la g

select * from Products
where ProductName like '[b-g]%'

--Clausula in()
-- Seleccionar todos los clientes de alemania, españa y reino unido

select * from Customers where Country in ('germany','spain','uk')
-- Forma mas larga
select * from Customers 
where Country = 'germany' or Country = 'spain' or Country = 'uk'

-- not in (negacion)
-- Seleccionar todos los clientes que no son de 
-- alemania, españa y reino unido
select * from Customers
where Country not in ('germany','spain','uk')
-- Forma mas larga
select * from Customers 
where not (Country = 'germany' or Country = 'spain' or Country = 'uk')

-- instruccion between(rangos)
-- Seleccionar todos los productos con un precio entre 10 y 20 dolares

select * from Products
where UnitPrice between 10 and 20 
--Forma mas larga 
select * from Products
where UnitPrice >= 10 and UnitPrice <= 20 
--Pero es mejor y mas rapido utilizar (between)

--Alias de columnas y Alias de Tablas
--seleccionar el nombre del producto, su stock y su precio 

-- Alias de Columna 
select ProductName as 'Nombre del Producto',
UnitsInStock as existencia, UnitPrice from Products

-- Alias de Tablas
select ProductName as 'Nombre del Producto' ,
UnitsInStock as existencia, p.UnitPrice precio 
from Products as p
inner join [Order Details] as od
on p.ProductID = od.ProductID
