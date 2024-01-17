--Practica#1
use Practica1
go
create database practica2
go
use practica2

create table cliente(
	idcliente int not null,
	nombre varchar (50) not null,
	direccion varchar (100) not null,
	telefono varchar (20) not null,
	constraint pk_cliente
	primary key (idcliente),
	constraint unique_nombre
	unique (nombre),
	constraint unique_direccion
	unique (direccion),
	constraint unique_telefono
	unique (telefono)
)
go

create table empleado (
	idempleado int ,
	nombre varchar (50) not null,
	apellidos varchar (80) not null,
	sexo char (1),
	salario decimal (10,2),
	constraint pk_empleado
	primary key (idempleado),
	constraint chk_sexo
	check (sexo='h' or sexo ='m'),
	constraint chk_salario
	check (salario>=400 and salario <=50000)
)
go

drop table cliente
go

