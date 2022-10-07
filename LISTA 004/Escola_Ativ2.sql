-- LISTA 004 - ATIV 2
create database  escola;
use  escola;
-- CRIANDO ENTIDADES
create table professor(
	professor_id int auto_increment primary key,
	nome varchar(40) unique not null
);

create table turma(
	turma_id int auto_increment primary key,
	turno varchar(40) unique not null
);

create table aluno(
	aluno_id int auto_increment primary key,
	nome varchar(40) unique not null,
    turma_id int,
    constraint fk_aluno_turma foreign key (turma_id) references turma(turma_id)
);

create table aula(
	aula_id int auto_increment primary key,
	materia varchar(40) unique not null,
    professor_id int,
    constraint fk_prof_aula foreign key (professor_id) references professor(professor_id)
);

-- TABELAS ASSOCIATIVAS
-- ALUNO <-> AULA
create table aluno_aula(
    aluno_id int,
    aula_id int,
    primary key (aluno_id,aula_id),
    foreign key (aluno_id) references aluno(aluno_id),
    foreign key (aula_id) references aula(aula_id)
    );
 
-- TURMA <-> PROFESSOR
create table professor_turma(
	professor_id int,
    turma_id int,
    primary key (professor_id,turma_id),
    foreign key (professor_id) references professor(professor_id),
    foreign key (turma_id) references turma(turma_id)
    );

-- INSERT 
insert into professor (nome)
Values('Willian'),
	  ('Eduardo');
select * from professor;

insert into turma (turno)
Values('Manhã'),
	  ('Tarde');
select * from turma;

insert into aluno (nome)
Values('Eduardo'),
	  ('Rafael');
select * from aluno;

insert into aula (materia)
Values('Banco de dados'),
	  ('Algoritimos');
select * from aula;

insert into aluno_aula (aluno_id, aula_id)
Values('1','1'),
	  ('2','2');
select * from aluno_aula;

insert into professor_turma (professor_id, turma_id)
Values('1','1'),
	  ('2','2');
select * from professor_turma;

-- UPDATE 
update professor 
	SET nome='Leonardo'
	where professor_id=2;
select * from professor;

update turma 
	SET turno='Noite'
	where turma_id=2;
select * from turma;

update aluno 
	SET turma_id='1'
	where aluno_id=1;
update aluno 
	SET turma_id='2'
	where aluno_id=2;
select * from aluno;    

update aula 
	SET materia='SoftSkills'
	where aula_id=2;
select * from aula; 
    
-- DELETE 
delete from professor_turma
where professor_id=2;
select * from professor_turma;

delete from professor
where professor_id=2;
select * from professor;

delete from aluno_aula
where aula_id=2;
select * from aluno_aula;

delete from aula
where aula_id=2;
select * from aula;

delete from aluno
where aluno_id=2;
select * from aluno;

delete from turma
where turma_id=2;
select * from turma;






