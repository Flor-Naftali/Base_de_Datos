 
use NORTHWND

-- Sintaxis
/*
	CASE
		WHEN condicion1 THEN resultado1
		WHEN condicion1 THEN resultado1
		WHEN condicion1 THEN resultado1
		ELSE result
	END;
*/
--Campo calculado
select *,
		CASE
		   WHEN Quantity > 30 THEN 'La cantidad es mayor a 30'
		   WHEN Quantity = 30 THEN 'La cantidad es 30'
		   ELSE 'LA CANTIDAD ES POR DEBAJO DE 30'
		   END AS CantidadTexto
from [Order Details]


--Rangos

select *,
		CASE
		   WHEN UnitsInStock = 0 then 'Sin Stock'
		   WHEN UnitsInStock between  1 and 20 then 'Stock Bajo'
		   WHEN UnitsInStock between 21 and 50 then 'Stock Medio'
		   WHEN UnitsInStock >= 51 and UnitsInStock <=90 then 'Stock Alto'
		   ELSE 'Stock Maximo'
		   END AS 'Tipo Stock'
from Products


create database PruebaCase

use PruebaCase

create table NuevaTabla (
id int not null,
nombre  nvarchar(40) not null,
unitprice money,
unitstock smallint,
constraint pk_NuevaTabla
primary key (id)
)


select top 0 ProductID as numeroproducto,
ProductName as descripcion, UnitPrice as preciounitario,
UnitsInStock as existencia
into nuevatabla2
from NORTHWND.dbo.Products;

alter table nuevatabla2
add constraint pk_nuevatabla2
primary key (numeroproducto)

select ProductID as numeroproducto,
ProductName as descripcion, UnitPrice as preciounitario,
UnitsInStock as existencia
into nuevatabla3
from NORTHWND.dbo.Products;


select * from NORTHWND.dbo.Products
select * from nuevatabla2

insert into nuevatabla2
select ProductName as descripcion, UnitPrice as preciounitario,
UnitsInStock as existencia
from NORTHWND.dbo.Products;



-- consulta
select p.ProductID,p.ProductName, p.UnitPrice,p.UnitsInStock,

		CASE
		   WHEN UnitsInStock = 0 then 'Sin Stock'
		   WHEN UnitsInStock between  1 and 20 then 'Stock Bajo'
		   WHEN UnitsInStock between 21 and 50 then 'Stock Medio'
		   WHEN UnitsInStock >= 51 and UnitsInStock <=90 then 'Stock Alto'
		   ELSE 'Stock Maximo'
		   END AS 'Tipo Stock'
into tablaconcase
from NORTHWND.dbo.Products as p


