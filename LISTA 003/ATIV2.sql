-- LISTA 03 - QUESTÃO 2
create database ELEICAO;
use ELEICAO;

create table Cargo(
Codigo_Cargo int not null unique primary key,
Nome_Cargo enum ('Prefeito','Vereador'),
Salario float not null default '17000.00',
Numero_Vagas int unique not null);

create table Partido(
Codigo_Partido int not null unique primary key,
Sigla char (5) unique not null,
Nome varchar(40) unique not null,
Numero int not null unique);

create table Candidato(
Numero_Candidato int not null unique primary key,
Nome varchar (40) unique not null,
Codigo_Cargo int not null,
Codigo_Partido int not null,
constraint fk_Codigo_Cargo_Candidato foreign key (Codigo_Cargo) references Cargo(Codigo_Cargo),
constraint fk_Codigo_Partido_Candidato foreign key (Codigo_Partido) references Partido(Codigo_Partido));

create table Eleitor(
Titulo_Eleitor varchar(30) unique not null primary key,
Zona_eleitoral char (5) not null,
Sessao_eleitoral char (5) not null,
Nome varchar(40) unique not null);

create table Voto(
Titulo_Eleitor varchar(30) unique not null primary key,
Numero_Candidato int not null,
constraint fk_Numero_Candidato_Voto foreign key (Numero_Candidato) references Candidato(Numero_Candidato));

