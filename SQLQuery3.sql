--Practica

CREATE DATABASE Practica
GO

USE Practica
GO

create table Contacto (
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
	constraint fk_Contacto_telefono
	foreign key (idcontacto),
	references Contacto(idcontacto)
)
go