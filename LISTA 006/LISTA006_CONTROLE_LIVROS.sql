-- RESOLUÇÃO LISTA 006 - CONSULTAS SELECT
-- 1) Selecione o nome de todos os estilos de livros em ordem alfabética.
select nome from estilo
order by nome;
-- 2) Selecione o nome de todos os autores em ordem alfabética decrescente.
select nome from autor
order by nome desc;
-- 3) Selecione o nome e o telefone de todas as editoras.
select nome, telefone from editora
order by nome;
-- 4) Selecione o nome de todas as editoras.
select nome from editora
order by nome;
-- 5) Selecione em ordem alfabética decrescente os estilos de livros.
select nome from estilo
order by nome desc;
-- 6) Selecione o estilo de código 3.
select nome from estilo 
where id_estilo=3;
-- 7) Selecione o autor de código 1.
select nome from autor
where id_autor=1;
-- 8) Selecione a editora de código 4.
select nome from editora
where id_editora=4;
-- DESAFIOS
-- 9) Selecione os títulos dos livros e os respectivos nomes das editoras.
select * from livro;
select livro.titulo,editora.nome 
from livro,editora
where livro.id_editora=editora.id_editora;
-- 10) Selecione os títulos do livro, os respectivos nomes das editoras que começam com a letra A.
select livro.titulo,editora.nome 
from livro,editora
where livro.id_editora=editora.id_editora and editora.nome like 'a%';
-- 11) Consultar titulo livro, nome editora, nome estilo e nome autor;
select livro.titulo, editora.nome, estilo.nome, autor.nome
from livro, editora, estilo, autor
where editora.id_editora=livro.id_editora and
	  estilo.id_estilo=livro.id_estilo and
      autor.id_autor=livro.id_autor;
-- 12) Consultar titulo livro, nome editora. Onde o telefone da editora seja igual a 12345;
select livro.titulo, editora.nome
from livro, editora
where livro.id_editora=editora.id_editora and editora.telefone ='123345';
-- 13) Consultar titulo livro, nome autor. Onde autor tenha idade igual a 35;
select livro.titulo, autor.nome
from livro, autor
where livro.id_autor=autor.id_autor and autor.idade ='35';
-- 14) Consultar titulo livro, nome autor e editora. Onde autor tenha o nome de Dan Brown
select livro.titulo, autor.nome
from livro, autor
where livro.id_autor=autor.id_autor and autor.nome = 'Dan Brown';
-- 15) Consultar titulo livro, nome autor e editora. Onde autor tenha o nome de Dan Brown e idade
-- igual a 35
select livro.titulo, autor.nome
from livro, autor
where livro.id_autor=autor.id_autor and (autor.idade ='35' or autor.nome = 'Dan Brown');
-- 16) – Consultar titulo livro, nome autor e editora. Onde autor tenha o nome de Dan Brown ou 
-- editora com o telefone igual a 123345;
select livro.titulo, autor.nome, editora.nome
from livro, autor, editora
where livro.id_autor=autor.id_autor and livro.id_editora=editora.id_editora and (editora.telefone ='123345' or autor.nome = 'Dan Brown');
-- 17) – Consulta titulo livro, nome estilo dos livros do estilo Romance;
select livro.titulo, estilo.nome as estilo
from livro, estilo
where livro.id_estilo=estilo.id_estilo and estilo.nome='Romance';
-- 18) – Consulta titulo livro, nome estilo dos livros da editora Globo;
select livro.titulo, estilo.nome as estilo, editora.nome as editora
from livro, estilo, editora
where livro.id_estilo=estilo.id_estilo and livro.id_editora=editora.id_editora and editora.nome='Globo';
-- 19) Faça uma consulta para retornar informações de três tabelas diferentes:
-- Atributo título da tabela livro.
-- Atributo nome da tabela editora.
-- Atributo nome da tabela autor.
select livro.titulo, editora.nome as editora ,autor.nome as autor
from livro, editora, autor
where livro.id_editora=editora.id_editora and livro.id_autor=autor.id_autor;

