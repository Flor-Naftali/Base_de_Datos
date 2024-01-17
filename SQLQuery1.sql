CREATE DATABASE entornosvip2
GO
 
USE entornosvip
GO

CREATE TABLE Categoria(
	idcat int not null,
	descripcion varchar (10) not null,
	constraint pk_Categoria
	primary key  (idcat),
	constraint unique_descripcion
	unique (descripcion)
)
GO


CREATE TABLE Producto(
	idproducto int not null,
	nombreP varchar (50) not null,
	precio decimal (10,2) not null,
	existencia int not null,
	idcat int not null,
	constraint pk_Producto
	primary key  (idproducto),
	constraint unique_nombreP
	unique (nombreP),
	constraint chk_precio
	check (precio>0.0 and precio<=10000),
	constraint chk_existencia
	check (existencia>=0),
	constraint fk_Producto_Categoria
	foreign key (idcat)
	references Categoria(idcat)

) 