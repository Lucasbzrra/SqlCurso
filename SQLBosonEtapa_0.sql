
--Criação de banco de dados
--CREATE DATABASE Db_Biblioteca
--ON PRIMARY (
--NAME = Db_Biblioteca,
--FILENAME = 'C:\CursoSqlServe\Db_Biblioteca.MDF',
--SIZE = 6MB,
--MAXSIZE = 15MB,
--FILEGROWTH=10%
--)

--USE Db_Biblioteca
--Comando para verificar o indices da Database
--sp_helpdb Db_Biblioteca

--USE Db_Biblioteca
--CREATE TABLE TblLivro
--(IdLivro SMALLINT PRIMARY KEY IDENTITY (100,1),
--NomeLivro VARCHAR (50) NOT NULL,
--ISBN VARCHAR(30) NOT NULL UNIQUE,
--IdAutor SMALLINT NOT NULL,
--DataPubli DATETIME NOT NULL,
--PrecoLivro MONEY NOT NULL
--)

--CREATE TABLE TblAutores(
--IdAuto SMALLINT PRIMARY KEY,
--NomeAutor varchar(20),
--SobrenomeAutor VARCHAR (60)
--)

----CREATE TABLE TblEditoras(
----IdEditora SMALLINT PRIMARY KEY IDENTITY,
----NomeEditora VARCHAR (20) NOT NULL)

--Comando para verificar o indices da tabela
--sp_help TblAutores

--create table TblTesteIdentidade(
--IdTeste Smallint primary key identity,
--valor smallint not null
--)

--Inserção de valores!!!
--insert into TblTesteIdentidade (valor) values (10)
--insert into TblTesteIdentidade (valor) values (20)
--insert into TblTesteIdentidade (valor) values (30)

--use Db_Biblioteca
--select * from TblTesteIdentidade

--Excluir coluna ou constraint
--use Db_Biblioteca
--alter table TblLivro
--drop column  IdAutor

--use Db_Biblioteca
--alter table TblLivro
--add IdAutor smallint not null
--constraint Fk_Id_Autor foreign key (IdAutor)
--references TblAutores


--alter table TblLivro
--add IdEditora smallint not null
--constraint Fk_Id_Editora foreign key (IdEditora)
--references TblEditoras

--Excluir tabela
--use Db_Biblioteca
--drop table TblTesteIdentidade 

--use Db_Biblioteca
--insert into TblAutores(IdAuto, NomeAutor,SobrenomeAutor) values (1,'Lucas','Bezerra')
--insert into TblAutores(IdAuto, NomeAutor,SobrenomeAutor) values (3,'breno','paul')
--insert into TblAutores(IdAuto, NomeAutor,SobrenomeAutor) values (4,'wilian','victor')

--insert into TblEditoras(NomeEditora) values ('Prentice Hall')
--insert into TblEditoras(NomeEditora) values ('Havard')
--insert into TblEditoras(NomeEditora) values ('Princeton')



--use Db_Biblioteca
--insert into TblLivro(NomeLivro, ISBN, DataPubli,PrecoLivro,IdAutor,IdEditora) values ('Sistemas dba', 423,'20221205',30.3,1,2)
--insert into TblLivro(NomeLivro, ISBN, DataPubli,PrecoLivro,IdAutor,IdEditora) values ('Inicio dba', 700 ,'20190703',77.0,3,3)

--EXCLUIR DADOS DA TABELA
--use Db_Biblioteca
--Truncate table TblLivro
--select count (*) from TblLivro

--use Db_Biblioteca
--select * from TblLivro

--Trazer Duas colunas diferentes de tabelas distintas 
--select NomeAutor, SobrenomeAutor from TblAutores 

