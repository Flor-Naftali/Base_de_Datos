-- Practica no.5

-- crear una tabla que contenga campo calculado

use practica4

create table pruebacalculado(
	id int not null,
	nombre varchar (50),
	precio decimal (10,2) not null,
	existencia int not null,
	importe as
	(precio * existencia),
	constraint pk_pruebacalculo
	primary key (id)
)
go

select * from pruebacalculado

insert into pruebacalculado
values ('Chanclotas' ,345, 4)
