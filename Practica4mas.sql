create database Practica4
go 

use Practica4
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