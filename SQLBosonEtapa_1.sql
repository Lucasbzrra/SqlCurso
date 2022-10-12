


--Ordenando Valores


use Db_Biblioteca
select * from TblAutores
order by NomeAutor  desc 


--Retornar valores não repetidos
use Db_Biblioteca
SELECT  distinct IdAutor
from TblLivro


--Retornar o valor em string apontado na tabela livro 'sistemas dba'
USE Db_Biblioteca
select * from TblLivro
where NomeLivro = 'Sistemas dba'

--Utilizando operadores para retornar valores 

SELECT * FROM TblLivro
 use Db_Biblioteca
 select * from TblLivro
 where IdLivro > 100 and IdAutor>=1

USE Db_Biblioteca 
 SELECT * FROM TblLivro
 where IdLivro <101 or IdAutor<2


--Update alterando valores de dados armazenados na tabela
UPDATE TblLivro
set PrecoLivro = 65.45
where IdLivro = 100
SELECT * from TblLivro

select * from TblAutores
UPDATE TblAutores
set SobrenomeAutor = 'Liu'
where IdAuto = 1

UPDATE TblLivro
set PrecoLivro = 30.00, ISBN = '0202'
WHERE IdLivro = 101

--Usado para especificar o número de registros a retornar 

use Db_Biblioteca
select top 1  NomeLivro
from TblLivro

use Db_Biblioteca
select top 100 percent  NomeLivro
from TblLivro

-- Altera o nome de coluna em tabela de consulta
select * from TblLivro
use Db_Biblioteca
select NomeLivro
AS Livro, IdAutor as Autor 
from TblLivro

-- Permite combinar duas ou mais deckarações
select NomeAutor from TblAutores
union 
select NomeLivro from TblLivro

select IdAuto from TblAutores
union 
select IdLivro from TblLivro

select IdAuto from TblAutores
union all
select IdAutor from TblLivro

-- Seleciona dados de uma ou mais tabela e os insere em uma tabela diferente
-- Pode ser usado para criar backups de tabelas

select IdLivro,NomeLivro, ISBN
into BackupTabela
from TblLivro
where IdLivro>300

select IdLivro,NomeLivro, ISBN
into BackupTabela2
from TblLivro

-- Agregados SELECT

select count (*) from TblAutores

select max(PrecoLivro) as Precomaximo from TblLivro
select min(PrecoLivro) as Precominino from TblLivro
select avg(PrecoLivro) as MediaPreco from TblLivro
select sum(PrecoLivro) as PrecoSomado from TblLivro

-- Between e utilizado em seleção de intervalos com and 
  
  select * from TblLivro
  where DataPubli between '20190513' and '20221201'

  select NomeLivro as livro,  PrecoLivro  as preco
  from TblLivro
 where PrecoLivro between 50.00 and 70.00



select NomeLivro
from TblLivro
where NomeLivro like 'S%'

select NomeLivro
from TblLivro
where NomeLivro like '_i%'

select NomeLivro
from TblLivro
where NomeLivro like '[si]%'


select NomeLivro
from TblLivro
where NomeLivro like '%[ba]'


select NomeLivro
from TblLivro
where NomeLivro like '_[il]%'


select NomeLivro
from TblLivro
where NomeLivro like '_i__o%'


select NomeLivro
from TblLivro
where NomeLivro not like 's%'
SELECT * FROM TblAutores
SELECT * from TblLivro

select * from TblLivro
inner join TblAutores
on TblLivro.IdAutor = TblAutores.IdAuto


SELECT TblLivro.NomeLivro, TblLivro.ISBN, TblAutores.NomeAutor
from TblLivro
INNER join TblAutores
on TblLivro.IdAutor = TblAutores.IdAuto


select L.NomeLivro, E.NomeEditora
from TblLivro as L
INNER join TblEditoras as E 
on L.IdEditora =E.IdEditora

--LEFT JOIN 
--Retorna todos os registros da tabela esquerda e os registros correspondentes da tabela direita. 
--Para cada linha da tabela A, 
--a consulta a compara com todas as linhas da tabela B
select * from TblLivro
left join TblAutores
on TblLivro.IdAutor = TblAutores.IdAuto

--Excluind correspondências  left join
select * from TblLivro
left join TblAutores
on TblLivro.IdAutor = TblAutores.IdAuto
where TblAutores.IdAuto is NULL

--Excluind correspondências  right join
select * from TblAutores
right join TblLivro
on TblLivro.IdAutor = TblLivro.IdAutor
where TblAutores.IdAuto is null 

--FULL JOIN 
select Li.NomeLivro, Li.IdAutor, Au.Nomeautor 
from TblLivro as Li 
full join TblAutores as Au
on Li.IdAutor = Au.IdAuto

--Excluind correspondências  full join
select Li.NomeLivro, Li.IdAutor, Au.Nomeautor 
from TblLivro as Li 
full join TblAutores as Au
on Li.IdAutor = Au.IdAuto
where Li.IdAutor is null or 
Au.IdAuto is NULL

--OPERADOR IN 
select * from TblLivro
where IdAutor in (1,2)

--OPERADOR COM NOT IN 
select * from TblLivro
where IdAutor not in (1,2)


--Campos Calculados - Cálculos - SQL Server 
--linha 311 (Quant SMALLINT, Total as (Preco*Quant))

create DATABASE testcampoCalculado
go
use testcampoCalculado
go
CREATE table Produtos (
    CodProduto smallint,
    NomeProduto varchar(20),
    Preco money,
    Quant SMALLINT, Total as (Preco*Quant)
)

insert  into Produtos values (1,'mouse,',15.00,2)
insert  into Produtos values (2,'teclado',18.00,3)
insert  into Produtos values (3,'Fones',25.00,1)
insert  into Produtos values (4,'Pendrive',25.00,6)
insert  into Produtos values (5,'Sd card',29.00,4)
insert  into Produtos values (6,'Dvd-R',55.00,2)

select * from Produtos
SELECT SUM(Total) from Produtos


--Um índice contém chaves criadas de uma ou mais colunas da tabela ou view. 
--Essas chaves são armazenadas em uma estrutura (B-Tree) que habilita o SQL Server a 
--localizar a linha ou as linhas associadas aos valores de chave de forma rápida e eficaz.

use Db_Biblioteca
create index IndiceNomeLivro 
on TblLivro(NomeLivro)
