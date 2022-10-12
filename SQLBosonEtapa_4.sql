--Stored Procedures - Criação, Execução e encriptar
use testcampoCalculado
GO
create PROCEDURE Procedimentos
as
select 'Lucas Alves' as nome 


create procedure Sera as
SELECT * from Produtos as P
inner join Clientes  as C
on C.IdCliente = P.CodProduto


---Alterando Procedures com parâmetros um tipo (alter procedure)

alter PROCEDURE Procedimentos 
(@variavel as int )
as 
SELECT @variavel

exec Procedimentos 25

-- -Alterando Procedures com parâmetros dois tipo (alter procedure)

use testcampoCalculado
GO
alter PROCEDURE Procedimentos 
(@variavel  int, @variavel2  varchar(20) )
as 
SELECT @variavel
SELECT @variavel2

exec Procedimentos @variavel= 10, @variavel2 = 'Lukas'
---OU ASSIM 
exec Procedimentos 10,  'Lukas'


-----Encripitando códigos (with encryption)

use Db_Biblioteca
go
create PROCEDURE codigolivro 
with encryption  as SELECT NomeLivro, ISBN 
from TblLivro

-----Alterando Procedures (alter procedure)

use Db_Biblioteca
go
alter procedure codigolivro
(@variavel int )
as 
select IdLivro, NomeLivro
from TblLivro
where IdLivro = @variavel

exec codigolivro  101
select * from TblLivro

-----Alterando Procedures (alter procedure)
use Db_Biblioteca
GO
alter PROCEDURE codigolivro
(@ID int, @Preco money)
as 
select NomeLivro, PrecoLivro
from TblLivro
where IdLivro >= @ID and PrecoLivro < @Preco

execute codigolivro @ID = 100, @Preco=60

-----Alterando Procedures (alter procedure)
alter PROCEDURE codigolivro
(@ID int, @quan smallint)
as 
select NomeLivro, PrecoLivro * @quan 
from TblLivro
where IdLivro = @ID 


execute codigolivro @ID = 100, @quan=10

-----Alterando Procedures inserindo valores (insert  into)
create procedure InserirEditora
(@nome varchar(50))
as 
insert  into TblEditoras(NomeEditora) 
values (@nome)

execute InserirEditora @nome = 'Mary poppers'

select * from TblEditoras
-- -----Para Excutar um procedimento (exec ou execute)
-- exec  codigolivro
-- -----Exibe os códigos fonte (sp_helptext)
-- exec sp_helptext codigolivro

-----Parâmetros de VALOR PADRÂO

alter PROCEDURE ValorPadro
(@varievel int,
@variavelpadrao varchar(30)='ValorPadrãoDoSistema')
as 
select 'Valor do Primeiro Parâmetro:' + cast(@varievel as varchar)
select 'Valor do Segundo Parâmetro:' + @variavelpadrao

execute ValorPadro @varievel= 1
execute ValorPadro @varievel= 1, @variavelpadrao = ' Hellow'

-----Parâmetros de OUTPUT e RETURN (VAriavel que salva valor como se fosse uma variavel global)

create procedure VariavelSalva 
(@vrsalva int output)
as 
select @vrsalva * 2
return 

declare @valorsalvo int = 15

EXEC VariavelSalva @valorsalvo output 
print @valorsalvo



use Db_Biblioteca
go

alter PROCEDURE codigolivro
(@qntd smallint, @cod int= -444,
@id smallint)
as 
set nocount on 
if @id >= 100
      begin 
          select NomeLivro, PrecoLivro * @qntd 
          from TblLivro
          where IdLivro = @id
          return 1
      end 
else 
  return @cod

declare @codigo int 
exec @codigo = codigolivro @id =90, @qntd = 3
print @codigo

-- -----Para Excluir um procedimento
drop procedure InserirEditora
