--CRIAÇÃO DE VIEW'S


use Db_Biblioteca
go

CREATE VIEW vwLivrosAutores 
as select TblLivro.NomeLivro as livro, TblAutores.NomeAutor as autor
from TblLivro
inner join TblAutores
on TblLivro.IdAutor = TblAutores.IdAuto


--AlTERAÇÃO DE VIEW'S
alter VIEW vwLivrosAutores
as select TblLivro.NomeLivro as livro, TblAutores.NomeAutor as autor,
PrecoLivro as valor
from TblLivro
inner join TblAutores
on TblLivro.IdAutor = TblAutores.IdAuto

SELECT livro, autor, valor
FROM vwLivrosAutores


--EXCLUIR  VIEW'S
USE Db_Biblioteca
GO
DROP VIEW vwLivrosAutores


--SUBQUERY
use testcampoCalculado
go

select dbo.Compras.IdCompras, dbo.Clientes.NomeCliente, dbo.Produtos.NomeProduto,dbo.Produtos.Preco,dbo.Produtos.Total
from dbo.Produtos
inner join  dbo.Compras
on Produtos.CodProduto = dbo.Compras.IdCompras 
INNER join dbo.Clientes
on dbo.Compras.IdCompras  = dbo.Clientes.IdCliente

SELECT Resultado.teste, sum (Resultado.total) as total
from 
(Select Clientes.NomeCliente, Produtos.Preco * Produtos.Quant as total
from Clientes 
Inner join Produtos
on Clientes.IdCliente = Produtos.CodProduto) as Resultado
GROUP by Resultado.teste
ORDER by 


--CONSULTA CTE DEPENDE SUBQUERY
--COMECA COM WITH




--Declarando variavies  declare é @
declare @valor int,
        @texto varchar (40),
        @data_nasc date,
        @nada money
set @valor = 50
set @texto= 'Lucas'
set @data_nasc = GETDATE()
select @valor as Valor, @texto as Tesxto,
@data_nasc as 'Data Nascimento',
@nada as Salario


--Declarando variavies com select 
use Db_Biblioteca
declare @livro varchar (30)
select @livro = NomeLivro
from TblLivro
where IdLivro = 101
select @livro as 'Nome do Livro'

--Outra forma mais sofisticado
use Db_Biblioteca
declare @preco money, @quantidade int, @nome varchar(30)
set @quantidade =5
select @preco = PrecoLivro, @nome = NomeLivro 
from TblLivro
where IdLivro = 101

select @nome as 'Nome do Livro',
(@preco * @quantidade) As 'precosLivros'

--Conversão de Tipos de Dados no SQL Server com Cast
--OBS: Tem utilizar uma alias (AS)
select 'O preco do livro ' +NomeLivro+ ' é de R$' + 
cast(PrecoLivro as varchar(6)) as item
from TblLivro
where IdAutor = 1

--Conversão de Tipos de Dados no SQL Server com  Convert
--OBS: Não é necessário utilizar alias, porém o tipo de dados vem antes 
--Coluna
select 'O preco do livro '+NomeLivro+'é de R$'+
convert (varchar(6), PrecoLivro)
from TblLivro

select 'Data de publicacao' + convert(varchar(15),DataPubli)
from TblLivro
where IdLivro = 101

--Alterando o estilo da data
--Onde pode encontrar estilos para ser alterados
--https://learn.microsoft.com/pt-br/sql/t-sql/functions/cast-and-convert-transact-sql?redirectedfrom=MSDN&view=sql-server-ver16
--Estilo e aplicado depois de selecionar a coluna, que vem o codigo (106)

select 'Data de publicacao' + convert(varchar(15),DataPubli,106)
from TblLivro
where IdLivro = 101

--Utilizando estruturas condionais if e else
-- OBS: Se for utilizar mais de uma em if e else terá que adcionar Begin e end

declare @numero int,
        @texto varchar(10)
set @numero = 20
set @texto = 'James'

if @numero = 20 
     select 'Numero correto'

if @texto = 'James'
    begin 
      set @numero = 30 
      SELECT @numero
    end;
else 
    begin
      set @numero = 40
      select 'Numero Incorreto'
    end;


select * from TblLivro

DECLARE @nome VARCHAR(30),
        @valor real,
        @status VARCHAR(100)
select @nome = NomeLivro,
       @valor = (PrecoLivro)
from TblLivro

if @valor >=51
    begin 
      set @status = 'Preço com alta inflação'
      select @status
    end;
else 
    begin 
      set @status = 'Gereeeene enloqueceu nos preços'
      SELECT @status
    END;
select 'Eae, vai comprar sabendo de que, ' + @status+ ' valor' +convert(varchar(6),@valor )


--Estruturas de loop
declare @cont int
set @cont = 0
while @cont<3
  begin 
    print 'Numero' + CAST(@cont as varchar(2))
    set @cont= @cont+1
  END;

declare @codigo int 
set @codigo = 100
while @codigo<103
  begin 
    select TblLivro.IdLivro,TblLivro.NomeLivro,TblLivro.PrecoLivro
    from TblLivro
  set @codigo=@codigo+1
  end;