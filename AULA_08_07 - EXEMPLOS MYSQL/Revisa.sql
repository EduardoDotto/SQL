create database preprova;
use preprova;

create table revisao(
	id_revisao int primary key);
    
alter table revisao rename to revisaoofc;

alter table revisaoofc add nota int;

create table aluno (
id_aluno int primary key,
nome varchar (200) not null,
-- chave estrangeira
id_revisao int,
constraint aluno_revisao foreign key (id_revisao) references revisaoofc(id_revisao)
);
 
 create table professor (
 id_professor int primary key);
 
 -- tabela associativa 
 create table prof_aluno (
 id_aluno int,
 id_professor int,
 primary key (id_aluno,id_professor),
 constraint fk_id_aluno foreign key (id_aluno) references aluno(id_aluno),
 constraint fk_id_professor foreign key (id_professor) references professor(id_professor)
 );
 
 alter table prof_aluno add tempo time;
 
 alter table prof_aluno rename column tempo to temponovo;
 
 create table jogo (
 id_jogo int primary key,
 jogador  set ('joao','maria'));
 desc jogo;
 
 create table nunjogo (
 id_numjogo int primary key,
 jogador set ('1','2'));
 
 
 
 
 