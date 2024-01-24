use Prueba_entornos
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

create table categoriaCopia(
		idcat int not null primary key,
		nombre varchar(100) not null
		)