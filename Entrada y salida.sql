

create or alter proc sumadediez
	@valor int = 10 -- Parametro de entrada
as
declare @resultado int = 0 -- declaracion de variable
set @resultado = @valor + 10
print ('el resultado es: ' + cast(@resultado as varchar(10)))

exec sumadediez
exec sumadediez @valor = 30

--sp2
create or alter proc sumadediez2
@valor int = 10, @resultado int output
as
set @resultado = @valor + 10

declare @result int
exec sumadediez2 @valor = 50, @resultado = @result output
print ('el resultado es: ' + cast(@result as varchar(10)))

--realizar un sp que permita calcular una suma y una resta 
-- solicitando dos numeros y el resultado de las operaciones 
-- deben guardarlas en los parametos de salida correspondiente 

create or alter proc calcularsumaresta
@numero1 int,
@numero2 int,
@suma int out,
@resta int out 
as
begin
set nocount on

set @suma = @numero1 + @numero2

set @resta = @numero1 - @numero2;
end
go

create or alter proc sumandrest
@valorsum int, @resultsum int output, @valorrest int, @resultrest int output   
as
set @resultsum = @valorsum + 10 -- suma dentro de la declaracion
set @resultrest = @valorrest - 35
declare @resultsuma int
declare @resultresta int
exec sumandrest @valorsum = 50, @valorrest = 89, @resultsum = @resultsuma output, 
@resultrest = @resultresta output
print('El resultado de la suma es: ' + cast(@resultsuma as varchar(20)) + ' ' 
+ 'Y el resultado de la resta es: ' + cast(@resultresta as varchar(20)))
