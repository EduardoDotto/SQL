-- 1) Criar banco de dados lista002. 
create database lista002;
use lista002;
-- 2) Crie uma tabela com o nome de alunos.
create table alunos (
codigo int, 
nome varchar(50), 
telefone varchar(50),
cidade varchar(50));
-- 3) Use o comando “desc alunos” para verificar se a tabela foi criada.
desc alunos;
-- 4) Crie uma tabela com o nome de “alunos2”.
create table alunos2 (
codigo int, 
nome varchar(200), 
telefone varchar(50), 
cidade varchar(100));
-- 5) Crie a tabela funcionários
create table funcionarios (
nome varchar(50), 
endereco varchar(50),
telefone varchar(11), 
cidade varchar(50),
estado varchar(30),
cep varchar (8),
rg varchar (9),
cpf varchar (11),
salario float);
-- 6) Crie a tabela fornecedores
create table fornecedores (
nome varchar(50), 
endereco varchar(50),
telefone varchar(11), 
cidade varchar(50),
estado varchar(30),
cep varchar (8),
cnpj varchar (14),
email varchar (50));
-- 7) Crie a tabela livros
create table livros (
codigo int,
nome varchar(50), 
categoria varchar(50),
resumo varchar(200), 
precocusto float,
precovenda float);
-- 8) Análise a estrutura das tabelas desc;
desc alunos;
desc alunos2;
desc fornecedores;
desc funcionarios;
desc livros;
-- 9) Crie a tabela estoque
create table estoque (
codigo int,
nomedoproduto varchar(50), 
categoria varchar(50),
quantidade int, 
fornecedor varchar(50));
-- 10) Crie a tabela notas
create table notas (
codigo int,
nomedoaluno varchar(50),
bimestre int);
-- 11) Crie a tabela caixa
create table caixa (
codigo int,
dataDDMMAAAA varchar(8),
descricao varchar(50),
debito float,
credito float);
-- 12) Crie a tabela contasApagar
create table contasApagar (
codigo int,
data_conta varchar(8),
descricao varchar(50),
valor float, 
data_pagamento varchar(8));
-- 12) Crie a tabela contasAReceber
create table contasAReceber (
codigo int,
data_compra varchar(8),
descricao varchar(50),
valor float, 
data_recebimento varchar(8));
-- 13) Crie a tabela filmes
create table filmes (
codigo int,
nome varchar(50), 
categoria varchar(50),
sinopse varchar(200), 
diretor varchar(50));
-- 14) Criar tabela CD
create table CDs (
codigo int,
nome varchar(50), 
cantor varchar(50),
ano int, 
quantidadademusicas int);
-- 15) Excluir a tabela alunos 
drop table alunos2;
-- 16) Use o comando “desc” e veja se a tabela realmente foi excluída.
desc alunos2;
-- 17) Exclua a tabela livros.
drop table livros;
-- 18) Exclua a tabela contasAPagar.
drop table contasApagar;
-- 19) Exclua a tabela contasAReceber.
drop table contasAreceber;
-- 20) Exclua a tabela filmes.
drop table filmes;
-- 21) Lista algumas tabelas para teste
desc funcionarios;
desc caixa;
desc estoque;
-- 22) Agora iremos aprender como MUDAR O NOME das tabelas.
ALTER TABLE alunos RENAME TO super_alunos;
-- 23) Use o comando “desc” e veja se foi alterado o nome
desc alunos;
desc super_alunos;
-- 24) Altere o nome da tabela estoque para produtos.
ALTER TABLE estoque RENAME TO produtos;
-- 25) Altere o nome da tabela notas para aprovados.
ALTER TABLE notas RENAME TO aprovados;
-- 26) Altere o nome da tabela aprovados para notas.
ALTER TABLE aprovados RENAME TO notas;
-- 27) Exclua a tabela dinheiro.
-- ) drop table dinheiro; TABELA DINHEIRO NÃO EXISTE
-- 28) Exclua a tabela notas.
Drop table notas;
-- 29) Altere o nome da tabela super_alunos para alunos.
ALTER TABLE super_alunos RENAME TO alunos;
-- 30) Altere o nome da tabela alunos para estudantes.
ALTER TABLE alunos RENAME TO estudantes;
-- 31) Altere o nome da tabela estudantes para super_estudantes.
ALTER TABLE estudantes RENAME TO super_estudantes;
-- 32) Veja se o nome foi alterado utilizando o comando “desc”
desc esturantes;
desc super_estudantes;
-- 33) Exclua a tabela super_estudantes.
drop table super_estudantes;
-- 34) desc super_estudantes e desc alunos(só para verificação).
desc super_estudantes;
desc alunos;
-- 35) Inclua o atributo estado na tabela alunos:
-- alter table alunos add estado varchar; ALUNOS NÃO EXISTE MAIS
-- 36) Crie novamente a tabela caixa.
drop table caixa;
create table caixa (
codigo int,
dataDDMMAAAA varchar(8),
descricao varchar(50),
debito float,
credito float);
-- 37) Adicione o campo observação do tipo varchar na tabela caixa.
alter table caixa add observacao varchar (200);
-- 38) Adicione o campo cpf na tabela alunos.
-- alter table alunos add cpf varchar (11); ALUNOS NÃO EXISTE MAIS
-- 39) Veja a estrutura da tabela caixa - desc.
desc caixa;
-- 40) Adicione o campo saldo na tabela caixa.
alter table caixa add saldo varchar (200);