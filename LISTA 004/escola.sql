CREATE DATABASE ESCOLA_ATIV3;
USE ESCOLA_ATIV3;

CREATE TABLE instrutores (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  valor_hora INTEGER UNSIGNED NULL,
  certificados VARCHAR(255) NULL,
  PRIMARY KEY(id)
);
CREATE TABLE cursos (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  requisito VARCHAR(255) NULL,
  carga_horaria SMALLINT UNSIGNED NULL,
  preco DOUBLE UNSIGNED NULL,
  PRIMARY KEY(id)
);
 
CREATE TABLE alunos (
  id INT NOT NULL AUTO_INCREMENT,
  cpf CHAR(11) NOT NULL,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  fone CHAR(14) NOT NULL,
  data_nascimento DATE NULL,
  PRIMARY KEY(id)
);
 
CREATE TABLE turmas (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  instrutores_id INT NOT NULL,
  cursos_id INTEGER UNSIGNED NOT NULL,
  data_inicio DATE NULL,
  data_final DATE NULL,
  carga_horaria SMALLINT UNSIGNED NULL,
  PRIMARY KEY(id),
  INDEX turmas_FKIndex1(cursos_id),
  INDEX turmas_FKIndex2(instrutores_id),
  CONSTRAINT CURSO_TURMA_FK FOREIGN KEY(cursos_id)
    REFERENCES cursos(id),
  CONSTRAINT INSTRUTOR_TURMA_FK FOREIGN KEY(instrutores_id)
    REFERENCES instrutores(id)
);
 
CREATE TABLE matriculas (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  turmas_id INTEGER UNSIGNED NOT NULL,
  alunos_id INT NOT NULL,
  data_matricula DATE NULL,
  PRIMARY KEY(id),
   CONSTRAINT ALUNO_MATRICULA_FK FOREIGN KEY(alunos_id)
    REFERENCES alunos(id),
  CONSTRAINT TURMA_MATRICULA_FK FOREIGN KEY(turmas_id)
    REFERENCES turmas(id)
);
-- 1) Fazer 5 INSERT INTO em cada Tabela do banco de dados;
select * from instrutores;
insert into instrutores (nome,email,valor_hora,certificados)
Values ('Eduardo','eduardo-dotto@hotmail.com','10000','Eng. Eletricista'),
	   ('Eduardo','eduardo-dotto@hotmail.com','10000','Eng. Eletricista'),
       ('Eduardo','eduardo-dotto@hotmail.com','10000','Eng. Eletricista'),
       ('Eduardo','eduardo-dotto@hotmail.com','10000','Eng. Eletricista'),
       ('Eduardo','eduardo-dotto@hotmail.com','10000','Eng. Eletricista')
;

select * from cursos;
insert into cursos (nome,requisito,carga_horaria,preco)
Values('Connect','Nenhum','36','14000.00'),
	  ('Connect','Nenhum','36','14000.00'),
      ('Connect','Nenhum','36','14000.00'),
      ('Connect','Nenhum','36','14000.00'),
      ('Connect','Nenhum','36','14000.00')
;

select * from alunos;
insert into alunos (cpf,nome,email,fone,data_nascimento)
Values('01234567890','Edaurdo','eduardo-dotto@hotmail.com','+5544999999999','19950521'),
	  ('01234567890','Edaurdo','eduardo-dotto@hotmail.com','+5544999999999','19950521'),
      ('01234567890','Edaurdo','eduardo-dotto@hotmail.com','+5544999999999','19950521'),
      ('01234567890','Edaurdo','eduardo-dotto@hotmail.com','+5544999999999','19950521'),
      ('01234567890','Edaurdo','eduardo-dotto@hotmail.com','+5544999999999','19950521')
;

select * from turmas;
insert into turmas(instrutores_id,cursos_id,data_inicio,data_final,carga_horaria)
Values('1','1','20220807','20221225','360'),
	  ('2','2','20220807','20221225','360'),
      ('3','3','20220807','20221225','360'),
      ('4','4','20220807','20221225','360'),
      ('5','5','20220807','20221225','360')
;

alter table matriculas add observacao varchar (200);
select * from matriculas;
insert into matriculas(turmas_id, alunos_id, data_matricula,observacao)
Values('1','1','20220807','Sem Obs.'),
	  ('1','2','20220807','Sem Obs.'),
      ('1','3','20220807','Sem Obs.'),
      ('1','4','20220807','Sem Obs.'),
      ('1','5','20220807','Sem Obs.')
;

-- 2) Fazer um UPDATE na tabela instrutores, alterando o nome de um dos instrutores(Filtrar pelo id do instrutor);
update instrutores 
	SET nome='Willian'
	where id=1;
select * from instrutores;

-- 3) Fazer um UPDATE na tabela instrutores, alterando o e-mail de um dos instrutores(Filtrar pelo nome do instrutor);
update instrutores 
	SET email='willian@biopark.com.br'
	where nome='Willian';
select * from instrutores;

-- 4) Fazer dois UPDATE na tabela cursos, seguindo a mesma lógica do exercício 2 e 3;
update cursos 
	SET nome='ADS' , carga_horaria='400'
	where id=1 or id=2;
update cursos 
	SET requisito='Ensino superior' , preco='28000'
	where id=3 or id=4;
Select * from cursos;

-- 5) Fazer dois UPDATE na tabela turmas trocando o instrutor de 2 turmas diferentes;
update turmas 
	SET instrutores_id='4'
	where id=1;
 -- MANTENDO O MODELO DE NEGOCIO 
 -- Um instrutor pode ter varias turmas, mas uma turma só pode ter um instrutor
update turmas 
	SET instrutores_id='1'
	where id=4;
Select * from turmas;

-- 6) fazer 2 DELETE por tabela do banco de dados;
delete from matriculas
where id=5 or id=4;
select * from matriculas;

delete from alunos
where id=5 or id=4;
select * from alunos;

delete from turmas
where id=5 or id=4;
select * from turmas;

delete from instrutores
where id=5 or id=1;
select * from instrutores;

delete from cursos
where id=5 or id=4;
select * from cursos;
