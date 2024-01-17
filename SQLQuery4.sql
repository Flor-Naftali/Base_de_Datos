CREATE DATABASE Practica1
GO

USE Practica1
GO

create table contacto (
	idcontacto int not null,
	nombre varchar (50) not null,
	constraint pk_contacto
	primary key (idcontacto),
	constraint unique_nombre
	unique(nombre)
)
go

create table telefono(
	idtelefono int not null,
	numero varchar (20) not null,
	idcontacto int not null,
	constraint pk_telefono
	primary key (idtelefono),
	constraint unique_numero
	unique (numero),
	constraint fk_telefono_contacto
	foreign key (idcontacto)
	references contacto(idcontacto)
)
go