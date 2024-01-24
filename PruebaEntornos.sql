create database PruebaEntornos

use PruebaEntornos
go

create table categoria (
	idcat int not null,
	numero int not null,
	descripcion varchar (50) not null,
	constraint pk_categoria
	primary key (idcat,numero)
)
go

create table producto(
	idproducto int not null,
	descripcion varchar (100) not null,
	precio decimal (10,2) not null,
	stock int not null,
	idcat int not null,
	numero int not null,
	constraint pk_producto
	primary key (idproducto),
	constraint fk_producto_categoria
	foreign key (idcat,numero)
	references categoria (idcat,numero)
)
go

select * from categoria

--Agregar

insert into categoria
values (1,'Carnes')

insert into categoria
values (2,'Lacteos')

insert into categoria
values (3,'Vinos y Licores')

insert into categoria
values (4,'Ropa')

insert into categoria(idcat,descripcion)
values (5,'Linea Blanca')

insert into categoria(descripcion,idcat)
values ('Electronicos',6)

-- Insertar varios registros a la vez
insert into categoria
values (7,'Carnes Buenas'),
		(8,'Dulces'),
		(9,'Panaderia'),
		(10,'Salchichoneria')

--insertar apartir de una consulta 

select idcat,descripcion from categoria

--Agregar primary key si no la agregaste

create table categoriaCopia(
		idcat int not null primary key,
		nombre varchar(100) not null
		)

-- insertar datos apartir de una consulta
select * from categoriaCopia

insert into categoriaCopia (idcat,nombre)
select idcat, descripcion from categoria

-- Actualizacion de datos sql-lmd

select * from producto 

insert into producto 
values (1,'Salchicha', 600, 12, 1)

insert into producto 
values (1,'Paleta de Pollo', 22, 56, 8)

insert into producto 
values (3,'Refrigerador', 3000, 22, 5),
	(3,'Chilindrina', 23, 43, 9),
	(3,'Terrible Mezcal', 200, 12, 3),
	(3,'Leche de Burra', 2350, 3, 2)

-- modificar datos de una tabla

update producto
set idproducto = 2
where nombre = 'Paleta de Pollo'

update producto
set idproducto = 4
where nombre = 'Chilindrina'

update producto
set idproducto = 3
where nombre = 'Refrigerador'

update producto
set idproducto = 5
where nombre = 'Terrible Mezcal'

update producto
set idproducto = 6
where nombre = 'Leche de Burra'

alter table producto
add constraint pk_producto
primary key (idProducto)

Update producto
set nombre = 'Salchica Grande',
    existencia = 20
where idproducto = 1

-- eliminar registros de una tabla 

/* 
  delete from tabla 
  where expresion
*/

select * from producto

delete from producto
where idproducto = 4

delete from producto
where nombre = 'Salchicha Grande'

delete from producto
where precio >= 3 and precio <= 22

delete from producto
where existencia >= 3 and precio <= 22




