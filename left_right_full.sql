

select * from
clientes as c
inner join Ordenes as o
on c.numero = o.clienteID

-- Left join (la tabla izquierda siempre es la primera
-- que se pone en el join)

select c.numero as 'numero de cliente', 
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente',
o.FechaOrden as 'fecha de la orden',
o.FechaEntrega as 'fecha de la entreha',
o.clienteID as 'foreign key de la tabla cliente'
from
clientes as c
left outer join Ordenes as o
on c.numero = o.clienteID

--clientes que nunca han comprado
select c.numero as 'numero de cliente', 
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente',
o.FechaOrden as 'fecha de la orden',
o.FechaEntrega as 'fecha de la entreha',
o.clienteID as 'foreign key de la tabla cliente'
from
clientes as c
left outer join Ordenes as o
on c.numero = o.clienteID
where o.clienteID is null

-- agregamos un nuevo dato en ordenes nula
--seleccionar todos los datos de la tabla oredenes
--y la tabla clientes utilizando un left join

select c.numero as 'numero de cliente', 
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente',
o.FechaOrden as 'fecha de la orden',
o.FechaEntrega as 'fecha de la entreha',
o.clienteID as 'foreign key de la tabla cliente'
from Ordenes as o
left outer join clientes as c
on c.numero = o.clienteID

--Right join
select c.numero as 'numero de cliente', 
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente',
o.FechaOrden as 'fecha de la orden',
o.FechaEntrega as 'fecha de la entreha',
o.clienteID as 'foreign key de la tabla cliente'
from Ordenes as o
right join clientes as c
on c.numero = o.clienteID

--full join
select c.numero as 'numero de cliente', 
c.nombre as 'nombre del cliente',
c.pais as 'pais del cliente',
o.FechaOrden as 'fecha de la orden',
o.FechaEntrega as 'fecha de la entreha',
o.clienteID as 'foreign key de la tabla cliente'
from Ordenes as o
full join clientes as c
on c.numero = o.clienteID

/*(select numero, nombre, pais from clientes) as c*/
-- no carga todos los datos.
select o.numero, nombre, pais, FechaOrden 
from Ordenes as o
inner join
(select numero, nombre, pais from clientes) as c
on o.clienteID = c.numero
--left join
select o.numero, nombre, pais, FechaOrden 
from Ordenes as o
left join
(select numero, nombre, pais from clientes) as c
on o.clienteID = c.numero
--right join
select o.numero, nombre, pais, FechaOrden 
from Ordenes as o
right join
(select numero, nombre, pais from clientes) as c
on o.clienteID = c.numero
-- full join
select o.numero, nombre, pais, FechaOrden 
from Ordenes as o
full join
(select numero, nombre, pais from clientes) as c
on o.clienteID = c.numero

