-- create schema
create database testeEdu;
use testeEdu;
create table nome(
nome varchar(50));
create table nome2(
nome varchar(50));
create table nome3(
nome varchar(50),
idade int);
create table pessoa(
nome varchar(50),
idade int,
cpf char(11));
create table livro(
livro_id smallint unsigned not null auto_increment primary key);
alter table pessoa add rg char(20);
describe pessoa;
-- APAGANDO A COLUNA CPF 
alter table pessoa drop cpf;
-- COLOCANDO CPF e NÃO NULO E UNICO
alter table pessoa add cpf char(20) not null unique;
-- RENAME TABLE TROCA O NOME DA TABELA
create table teste4 select * from livro;
truncate teste4;
