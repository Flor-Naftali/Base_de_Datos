create database pruebatriggers2
go

use pruebatriggers2

create table productos(
idproducto int not null,
nombreProd varchar(100) not null,
existencia int not null,
preciounitario decimal(10,2) not null,
constraint pk_idproducto
primary key (idproducto),
constraint unique_nombreprd
unique (nombreProd)
)
go


create table ventas (
ventaid int not null,
fecha date not null,
idcliente int not null,
idvendedor int not null,
constraint pk_ventas
primary key(ventaid)
)


create table clientes (
idcliente int not null,
nombre varchar(100),
ciudad varchar(20),
pais varchar(20),
constraint pk_cliente
primary key(idcliente)
)



create table vendedor(
idvendedor int not null,
nombre varchar(100) not null,
apellidos varchar(50) not null,
ciudad varchar(20),
pais varchar(20),
constraint pk_vendedor
primary key(idvendedor)
)


create table detalle_venta
(
idventa int not null,
idproducto int not null,
precioVenta decimal(10,2),
cantidad int
constraint pk_detalle_venta
primary key(idventa),
constraint fk_detalle_venta_venta
foreign key (idventa)
references ventas(ventaid),
constraint fk_detalle_venta_producto
foreign key (idproducto)
references productos(idproducto)
)

alter table ventas
add constraint fk_venta_cliente
foreign key (idcliente)
references clientes

alter table ventas
add constraint fk_venta_vendedor
foreign key (idvendedor)
references vendedor

create or alter procedure llenar_tablas_catalogo
@nombreTabla varchar(100)
as
begin
    if @nombreTabla = 'clientes'
    begin
        insert into clientes
        select CustomerID,CompanyName,city, country
        from NORTHWND.dbo.customers
    end
    else if @nombreTabla = 'productos'
    begin
        insert into productos
        select ProductID, ProductName,UnitsInStock, UnitPrice
        from NORTHWND.dbo.Products
    end
    else if @nombreTabla = 'vendedor'
    begin
        insert into vendedor
        select EmployeeID, FirstName, LastName, city, country
        from NORTHWND.dbo.Employees
    end
    else
    begin
       print('Nombre de tabla no valida')
    end
end

drop proc llenar_tablas_catalogo

select * from clientes
exec llenar_tablas_catalogo 'clientes'

select * from productos
exec llenar_tablas_catalogo 'productos'

create or alter proc cargar_ventas
as 
begin
insert into ventas 
select OrderID, OrderDate, CustomerID, EmployeeID 
from NORTHWND.bdo.Orders
end

select * from ventas
exec llenar_tablas_catalogo 'ventas'

create or alter proc cargar_detalle_venta
as 
begin
	
	insert into detalle_venta
	select OrderID, ProductID, UnitPrice, Quantity  
	from NORTHWND.dbo.[Order Details]
end


select * from detalle_venta
exec cargar_detalle_venta

create trigger verificar_producto
on clientes 
after insert
as 
begin
	print ('Se disparo el trigger de insert')
end 
go 

create trigger verificar_producto_eliminar
on clientes 
after delete
as 
begin
	print ('Se disparo el trigger de delete')
end 
go 

create trigger verificar_producto_actualizar
on clientes 
after update
as 
begin
	print ('Se disparo el trigger de Update')
end 
go 

insert into clientes
values ('ABCD','Jesus Manuel','Santa Maria','Francia')

delete clientes
where idcliente = 'ABCD'

update clientes 
set nombre = 'clientexx'
where idcliente = 'ABCD'

create or alter trigger verificar_cliente_eventos
on clientes
after insert, delete, update
as
begin
   if (select count(*) from inserted) > 0 and (select count(*) from deleted) = 0
   begin
       print 'se realizo un insert'
   end
   else if (select count(*) from inserted) = 0 and (select count(*) from deleted) > 0
   begin
   print 'se realizo un delete'
   end
   else if (select count(*) from inserted) > 0 and (select count(*) from deleted) > 0
    begin
     print 'se realizo un update'
   end
end


