-- LISTA 03 - QUESTÃO 1
create database CLINICA;
use CLINICA;

create table Medicos (
CRM varchar(15) not null unique primary key, 
Nome varchar (40) not null,
Idade int check(Idade > 23),
Especialidade char(20) not null default 'Ortopedia',
CPF varchar(15) not null unique,
Data_de_Admissao date);

create table Sala (
Numero_Sala int not null unique primary key, 
check(Numero_Sala > 1 and Numero_Sala < 50), 
Andar int not null unique,
check(Andar < 12),
CRM varchar(15) not null,
constraint fk_CRM foreign key (CRM) references Medicos(CRM));

create table Pacientes (
RG varchar(15) not null unique primary key, 
Nome varchar (40) not null,
Data_Nascimento date,
Cidade char(30) default 'Itabuna',
Doenca varchar(40) not null,
Plano_Saude varchar(40) not null default 'SUS');

create table Funcionarios (
Matricula varchar(15) not null unique primary key, 
Nome varchar (40) not null,
Data_Nascimento date not null,
Data_Admissao date not null,
Cargo varchar(40) not null default 'Assistente Médico',
Salario float not null default '510.00');

create table Consulta (
Codigo_Consulta int not null unique primary key, 
Data_Horario datetime,
CRM varchar(15) not null unique,
RG varchar(15) not null,
constraint fk_CRM_consulta foreign key (CRM) references Medicos(CRM),
constraint fk_RG foreign key (RG) references Pacientes(RG)
);



