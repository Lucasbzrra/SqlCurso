-  -----Criações de funcions Escalar (Retornar apenas um valor unico especifico)
use RegistrosNotas
go
create FUNCTION NotaMedia(@nome varchar(10))
returns real
as 
  begin 
  declare @media real 
  select @media = (Nota1+Nota2+Nota3+Nota4)/4
  from NotasAlunos
  where Nome = @nome
  return @media
end

SELECT * from NotasAlunos
SELECT  dbo.NotaMedia('Oliver') as Resultado

---Criações de funcions valor de tabela 
use Db_Biblioteca 
go
create function RetornarValores(@valor real)
RETURNS TABLE
as 
return (
        select TblLivro.NomeLivro, TblAutores.NomeAutor, TblEditoras.NomeEditora
        from TblLivro
        inner join TblAutores
        on TblLivro.IdAutor = TblAutores.IdAuto
        INNER join TblEditoras
        on TblLivro.IdEditora = TblEditoras.IdEditora
        where TblLivro.PrecoLivro >@valor
)
use Db_Biblioteca
go

select NomeLivro, NomeEditora
from RetornarValores(12)
----Funções Definidas pelo Usuário - Valor de Tabela com Várias Instruções 
create function MultiTabela()
returns @valores table (
  NomeLivro varchar(50),
  DataPubli datetime, NomeEditora Varchar(50),
  PrecoLivro money)
as 
begin 
insert @valores (NomeLivro, DataPubli,NomeEditora,PrecoLivro)
       select L.NomeLivro, L.DataPubli, E.NomeEditora,L.PrecoLivro
       from TblLivro as L
       Inner join TblEditoras as E
       on L.IdEditora = E.IdEditora
return 
end 


select * 
from MultiTabela()

---EXCLUIR UMA FUNÇÂO
drop FUNCTION MultiTabela

------Triggers - Criação e Testes dos modos Instead Of e After
-- use Db_Biblioteca
-- go
 create trigger TesteTriggerAfter
 on TblEditoras 
 after insert 
 as 
 print ('Heloow')

 insert into TblEditoras(NomeEditora) values ('Sera funcionoul ?!')

------Triggers - Criação e Testes dos modos Instead Of e After

create trigger TesteTriggerinstaof
 on TblEditoras 
 INSTEAD of INSERT
 as 
 print ('Não foi inserido pela clausura INSTEAD of INSERT ')

 insert into TblEditoras(NomeEditora) values ('Inserido ?!')


-- Criação de triggres que quando inserir valor na tabela
-- Editoras vai enserir estes outros dados em outros
 create trigger triggerComVariasTabelasAfter
 on TblEditoras
 after insert 
 as 
 insert into TblAutores values ('Jose')
 insert into TblLivro values ('Livbor1')
 print('Inserido nas outras tabelas com sucess')

insert into TblEditoras(NomeEditora) values ('Disparou e ensirou nas outras tabela !')