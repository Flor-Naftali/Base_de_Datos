-- SP que permitre insertar registro en la tabla customers
create proc insertarcliente
@CustomerID nchar(5),
@CompanyName nvarchar(40),
@ContactName nvarchar(30),
@ContactTitle nvarchar(30),
@Address nvarchar(60),
@City nvarchar(15),
@Region nvarchar(15),
@PostalCode nvarchar(10),
@Country nvarchar(15),
@Phone nvarchar(24),
@Fax nvarchar(24)
as 
begin
set nocount on ;

insert into  Customers (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
values  (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax);
end
go 

drop proc insertarcliente
exec insertarcliente
LATIN,
'Korina', 
7731889502, 
'Owner',
Montecillo, 
'California',
'Los Angeles',
55800, 
'Mexico',
7723456990,
'naftalitrujillotrejo'


select * from Customers

--Sp que permita eliminar  registros en la tabla Customers , por customersID
Create proc  eliminarclienteporid
@CustomerID nchar(5)
as
begin
set nocount on;
delete from  Customers
where  CustomerID = @CustomerID;
end
go

Select *from Customers
exec eliminarclienteporid
'LATIN'

--SP que permita eliminar un producto de una orden dada
create proc  eliminarproductoorden
@OrderID int,
@ProductID int
as
begin 
set nocount on ;
delete from  [Order Details]
where OrderID = @OrderID AND ProductID = @ProductID;
end
go

select * from  [Order Details] 
exec eliminarproductoorden
@OrderID = '10248',
@ProductID = '42'

select * from [Order Details]

--Sp que permita eliminar  un product de una order y modificar el stock (unitstock del producto)
create proc  eliminarproductoyactualizarstock
@OrderID int,
@ProductID int,
@Quantity int
as
begin
set nocount on ;
begin Transaction ;
-- Eliminar
delete from  [Order Details]
where  OrderID = @OrderID AND ProductID = @ProductID;
-- Actualizar
update  Products
set  UnitsInStock = UnitsInStock + @Quantity
where  ProductID = @ProductID;
commit transaction ;
end
go

select * from [Order Details]
exec eliminarproductoyactualizarstock
@OrderID = '10248',
@ProductID = '42',
@Quantity = '10';