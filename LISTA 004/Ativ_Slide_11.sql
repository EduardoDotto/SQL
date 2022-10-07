-- LISTA 004 - ATIV 1
create database  Controle_de_Livros;
use  Controle_de_Livros;
-- CRIANDO ENTIDADES

create table Editora(
	Editora_id int auto_increment primary key,
	Nome varchar(40) unique not null
);

create table Autores(
	Autor_id int auto_increment primary key,
	Primeiro_Nome  varchar(40) not null,
	Segundo_Nome  varchar(40)  not null
);

create table Categoria(
	Categoria_id int auto_increment primary key,
	Genero  varchar(40) not null,
	Classificacao_Indicativa  int  not null
);

create table Livros(
	Livro_id int auto_increment primary key,
	Num_Pag int unique not null,
	Nome  varchar(40) unique not null,
    -- Editora chave estrangeira + relaciomento
    Editora_id int,
    constraint fk_Editora_Livros foreign key (Editora_id) references Editora(Editora_id)
);
-- TABELA ASSOCIATIVA N:N LIVRO AUTOR
create table Livro_Autor(
Livro_id int,
Autor_id int,
primary key (Livro_id,Autor_id),
foreign key (Livro_id) references Livros(Livro_id),
foreign key (Autor_id) references Autores(Autor_id));

-- TABELA ASSOCIATIVA N:N LIVRO CATEGORIA
create table Livro_Categoria(
Livro_id int,
Categoria_id int,
primary key (Livro_id,Categoria_id),
foreign key (Livro_id) references Livros(Livro_id),
foreign key (Categoria_id) references Categoria(Categoria_id));

-- INSERINDO DADOS 
-- ----------------------------------------------------
insert into Editora (Nome)
Values('Biopark1'),
	  ('Biopark2');
-- MOSTANDO EDITORA
desc Editora;
select * from Editora;
-- ----------------------------------------------------
insert into Autores (Primeiro_Nome,Segundo_Nome)
Values('Eduardo','Dotto'),
	  ('João','Silva');
-- MOSTANDO AUTOR
desc Autor;
select * from Autores;
-- ----------------------------------------------------
insert into Categoria (Genero,Classificacao_Indicativa)
Values('Terror','18'),
	  ('Ação','16');
-- MOSTANDO Categoria
desc Categoria;
select * from Categoria;
-- ----------------------------------------------------
insert into Livros (Num_Pag,Nome)
Values('350','Dotto História'),
	  ('200','BlaBlaBla');
-- MOSTANDO LIVROS
desc Livros;
select * from Livros;
-- ---------------------------------------------------
-- COLOCANDO EDITORAS
update Livros 
	SET Editora_id=1
	where Livro_id=1
;
update Livros 
	SET Editora_id=2
	where Livro_id=2
;
-- --------------------------------------------------
-- INSERINDO NAS TABELAS RELACIONAIS
insert into livro_autor (Livro_id,Autor_id)
	Values('1','1'),
		  ('2','2')
;
select * from livro_autor;
-- ---------------------------------------------------
insert into livro_categoria (Livro_id,Categoria_id)
	Values('1','1'),
		  ('2','2')
;
select * from livro_categoria;
--  --------------------------------------------------
-- ALTERANDO DADOS
update editora
	set Nome='Biopark3'
	where Editora_id='2'
;
select * from Editora;

update Autores
	set Primeiro_Nome='Maria'
	where Autor_id='2' and  Segundo_Nome='Silva'
;
select * from Autores;

update Categoria
	set Genero='Drama', Classificacao_indicativa=14
	where Categoria_id='2' and  Classificacao_indicativa=16
;
select * from Categoria;
desc Categoria;

update Livros
	set Num_Pag=1000, Nome='Sopa não é janta'
	where Livro_id='2' and  Editora_id='2'
;
select * from Livros;
desc Livros;
-- DELETAR ELEMENTOS
-- --------------------------------------------------
delete from Livro_Autor
where Livro_id=2;
select * from Livro_Autor;

delete from Livro_Categoria
where Livro_id=2;
select * from Livro_Categoria;

delete from Livros
where Livro_id=2;
select * from Livros;

delete from editora
where Editora_id=2;
select * from editora;

 delete from autores
 where Autor_id=2;
select * from autores;

 delete from Categoria
 where Categoria_id=2;
select * from Categoria;
