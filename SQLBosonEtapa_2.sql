--Criação de regra e aplicamento da mesma.


use Db_Biblioteca
select * from TblLivro
create RULE Regra as @valor >10.00

EXECUTE sp_bindrule Regra, 'TblLivro.PrecoLivro'

update TblLivro
set PrecoLivro =50.00
where IdLivro=100

--Não pode ser alterado para este valor por causa do bloco de codigo linha: 334 até 336
update TblLivro
set PrecoLivro =10.00
where IdLivro=100


--Backup do Banco de Dados e Restauração 
--IMPORTANTE USAR EXTERNSÂO DO .bak
use testcampoCalculado
go 
backup DATABASE testcampoCalculado
to disk = 'D:\BackpBancoDados\testcampoCalculado.bak'
with FORMAT;
go
--APAGANDO BACKUP 
DROP DATABASE testcampoCalculado

--RESTAURANDO BACKUP VIA COMANDO SQL
use master 
restore database testcampoCalculado from disk =  'D:\BackpBancoDados\testcampoCalculado.bak'

use testcampoCalculado
select * from Produtos

--Concatenação de strings 
select 'Luqueta ' + 'azarado' as Colum

use Db_Biblioteca
select NomeAutor+ ''+SobrenomeAutor as 'NomeCompleto'  from TblAutores 

select 'Eu gosto do Livro' + NomeLivro as 'meu livro' from TblLivro


--Opções de agrupamentos disponiveis caso for usado orderby
select * from fn_helpcollations()

--Para vê o esquema de colação
select SERVERPROPERTY('Collation') as colaçao 
--alterar o esquema de colação
ALTER DATABASE Db_Biblioteca
collate Greek_CI_AI


select DATABASEPROPERTYEX('Db_Biblioteca','colaçao' )

--OU ASSIM 
select * from TblLivro
ORDER by NomeLivro
COLLATE Greek_CI_AI


--Clausula WITH TIES sempre utilizado com order by, ela puxa todos todos valores
--Incluindo os repetidos LINHA 425 até 427
create DATABASE CampeonatoIta
go

create table Brasileirao(
  Posicao SMALLINT not null,
  Nome VARCHAR(100),
)
alter table Brasileirao add  Pnts SMALLINT not null

alter table Brasileirao add CONSTRAINT UniquePosicao UNIQUE (Pnts)

insert into Brasileirao values (1,'Milan',57)
insert into Brasileirao values (2,'Juventus',47)
insert into Brasileirao values (3,'Celtic',47)
insert into Brasileirao values (4,'Ajax',48)
insert into Brasileirao values (5,'PSA',37)
insert into Brasileirao values (6,'Inter',32)
insert into Brasileirao values (7,'Napoli',34)

SELECT top(6) Nome, Pnts
from Brasileirao 
ORDER by Pnts  desc



select top(4) with ties Nome, Pnts 
from Brasileirao
order by Pnts desc 