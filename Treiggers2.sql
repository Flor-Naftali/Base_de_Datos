create trigger agregarpreciodetalleventa
on detalle_venta
for insert
as
begin
  declare @idproducto int
  declare @precio decimal(10,2)
  set @idproducto = (select idproducto from inserted)
  set @precio =
  (select preciounitario from productos where idproducto = @idproducto)

  update detalle_venta
  set precioVenta = @precio
  where idproducto = @idproducto

end
--
create or alter proc agregarDetalleVenta
  @numVenta int, @numeroProd int, @cantidad int
 as
 begin
    insert into detalle_venta (idventa,idproducto,cantidad)
    values (@numVenta,@numeroProd,@cantidad)
 end
--
create trigger agregarpreciodetalleventa2
on detalle_venta
for insert
as
begin
 
  update d
  set d.precioVenta = pr.preciounitario
  from detalle_venta as d
  inner join productos as pr
  on d.idproducto =pr.idproducto
  inner join inserted i
  on i.idproducto = d.idproducto
 end