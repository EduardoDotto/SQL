-- LISTA 03 - QUESTÃO 3
create database  REVENDEDORA_CARROS;
use  REVENDEDORA_CARROS;

create table Automovel(
Renavam varchar (11) not null unique primary key,
Placa varchar (7) unique not null,
Marca varchar(40) unique not null,
Modelo varchar(60) not null unique,
Ano_de_fabricação date not null,
Ano_do_modelo date not null,
Cor varchar (50) not null,
Motor varchar (50) not null,
Numero_de_portas int unique,
Tipo_de_combustivel varchar (20) not null,
Preço float not null,
Id_negocio int unique not null);

create table Clientes(
Id_clientes int unique not null primary key,
Nome varchar (50) not null,
Sobrenome varchar (50) not null,
Telefone varchar(11) unique not null,
Rua varchar (50),
Numero int,
Complemento varchar (100),
Bairro varchar (100),
Cidade varchar (100),
Estado varchar (100),
CEP varchar (8));

create table Vendedor(
Id_vendedor int unique not null primary key,
Nome varchar (50) not null,
Sobrenome varchar (50) not null,
Telefone varchar(11) unique not null,
Rua varchar (50),
Numero int,
Complemento varchar (100),
Bairro varchar (100),
Cidade varchar (100),
Estado varchar (100),
CEP varchar (8),
Data_admissão date not null,
Salario_fixo float not null);

create table Negocio(
Id_negocio int unique not null primary key,
Data_negocio date not null,
Preco float not null,
Id_clientes int not null,
Id_vendedor int not null,
constraint fk_Id_clientes_Negocio foreign key (Id_clientes) references Clientes(Id_clientes),
constraint fk_Id_vendedor_Negocio  foreign key (Id_vendedor) references Vendedor(Id_vendedor),
Renavam varchar (11) not null unique);

create table automovel_negocio(
Id_negocio int,
Renavam varchar (11),
primary key (Id_negocio,Renavam),
foreign key (Id_negocio) references Negocio(Id_negocio),
foreign key (Renavam) references Automovel(Renavam));

