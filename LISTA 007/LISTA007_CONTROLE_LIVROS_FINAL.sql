use controledelivrosFinal;
-- LISTA 007 - CONTROLE DE LIVROS FINAL
-- EDUARDO DOTTO
-- 1) Consultar titulo livro, nome editora, nome estilo e nome autor;
select L.titulo, E.nome, ED.nome, A.nome from livro as L
join livro_estilo as LE on L.id_livro = LE.id_livro
join estilo as E on E.id_estilo = LE.id_estilo
join editora as ED on ED.id_editora = L.id_editora
join livro_autor as LA on LA.id_livro = L.id_livro
join autor as A on A.id_autor = LA.id_autor;
-- 2) Consultar titulo livro, nome editora. Onde o telefone da editora seja igual a 123345;
select L.titulo, ED.nome from livro as L
join editora as ED on  L.id_editora = ED.id_editora and ED.telefone = '123345';
-- 3) Consultar titulo livro, nome autor. Onde autor tenha idade igual a 35;
select L.titulo, A.nome from livro as L
join livro_autor as LA on LA.id_livro = L.id_livro
join autor as A on A.id_autor = LA.id_autor and A.idade = '35';
-- 4) Consultar titulo livro, nome autor e editora. Onde autor tenha o nome de Dan Brown
select L.titulo, A.nome as Autor, ED.nome as Editora from livro as L
join editora as ED on ED.id_editora = L.id_editora 
join livro_autor as LA on LA.id_livro = L.id_livro
join autor as A on A.id_autor = LA.id_autor and A.nome = 'Dan Brown';
-- 5) Consultar titulo livro, nome autor e editora. Onde autor tenha o nome de Dan Brown e idade igual a 35
select L.titulo, A.nome as Autor, ED.nome as Editora from livro as L
join editora as ED on ED.id_editora = L.id_editora 
join livro_autor as LA on LA.id_livro = L.id_livro
join autor as A on A.id_autor = LA.id_autor and A.nome = 'Dan Brown' and A.idade = 35;
-- 6) Consultar titulo livro, nome autor e editora. Onde autor tenha o nome de Dan Brown e editora com o telefone igual a 123345;
select L.titulo, A.nome as Autor, ED.nome as Editora from livro as L
join editora as ED on ED.id_editora = L.id_editora and ED.telefone = 123345
join livro_autor as LA on LA.id_livro = L.id_livro
join autor as A on A.id_autor = LA.id_autor and A.nome = 'Dan Brown';
-- 7) Consulta titulo livro, nome estilo dos livros do estilo Romance;
select L.titulo, E.nome as Estilo from livro as L
join livro_estilo as LE on L.id_livro = LE.id_livro
join estilo as E on LE.id_estilo = E.id_estilo and E.nome = 'Romance';
-- 8) Consulta titulo livro, nome estilo dos livros da editora Globo;
select L.titulo, E.nome as Estilo, ED.nome as Editora from livro as L
join livro_estilo as LE on LE.id_livro = L.id_livro
join estilo as E on E.id_estilo = LE.id_estilo
join editora as ED on ED.id_editora=L.id_editora and ED.nome = 'Globo';
-- 9) Consultar o livro de maior valor;
select L.titulo, L.valor  from livro as L
where L.valor = (
	select MAX(valor) from livro);
-- 10)Consultar o livro de menor valor;
select L.titulo, L.valor  from livro as L
where L.valor = (
	select MIN(valor) from livro);
-- 11)Consultar a média de custo do livros;
select avg (valor) as Valor_Medio from livro;
-- 12)Consultar a média de custo dos autores;
select avg(valor_hr) as Media_Custo_Autor from autor;
-- 13)Contar o número de livros;
select count(id_livro) as Numero_Livros from livro;
-- 14)Consultar a quantidade de livros que editora de id_editora = 2;
select count(id_livro) as Numero_de_Livros from livro
where id_editora = 2;
-- 15)Consultar quantos livros o id_estilo = 5 possui
select count(id_livro) as Numero_de_Livros from livro_estilo
where id_estilo = 5;
-- 16)Selecione os títulos dos livros e os respectivos nomes das editoras.
select L.titulo, ED.nome as Editora from livro as L
join editora as ED on ED.id_editora = L.id_editora;
-- 17)Selecione os títulos do livro, os respectivos nomes das editoras que começam com a letra A.
select L.titulo, ED.nome as Editora from livro as L
join editora as ED on ED.id_editora = L.id_editora 
where ED.nome like 'A%';
-- 18)Consultar apenas os autores que não possuem nenhum livro;
select A.nome as Autor from autor as A
left join livro_autor as LA on A.id_autor = LA.id_autor
where LA.id_livro is null;
-- 19)Consultar apenas as editoras que não possuem nenhum livro;
select ED.nome as Editora from editora as ED
left join livro as L on L.id_editora = ED.id_editora
where L.id_livro is null;
-- 20)Consultar apenas os estilo que não possuem nenhum livro;
select E.nome as Estilos from estilo as E
left join livro_estilo as LE on LE.id_estilo = E.id_estilo
where LE.id_livro is null;
-- 21)Consultar os nomes dos autores e quantos livros cada autor possui; 
select A.nome as Autores, count(LA.id_livro) as Num_Livros from autor as A
left join livro_autor as LA on LA.id_autor = A.id_autor
group by A.nome;
-- 22)Consultar os nomes das editoras e quantos livros cada editora possui;
select ED.nome as Editora, count(L.id_livro) as Num_Livros from livro as L
left join editora as ED on ED.id_editora = L.id_editora
group by ED.nome;
-- 23)Consultar os nomes das estilo e quantos livros cada estilo possui;
select E.nome as Estilo, count(LE.id_livro) as Num_Livros from estilo as E
left join livro_estilo as LE on LE.id_estilo = E.id_estilo
group by E.nome
order by E.nome;
-- 24)Consultar quantos livros a editora CCCC possui; 
select ED.nome as Editora, count(L.id_livro) as Num_Livros from livro as L
join editora as ED on ED.id_editora = L.id_editora and ED.nome = 'CCCC';
-- 25)Consultar quantos livros o autor J R R Tolkien possui;
select A.nome as Autor, count(LA.id_livro) as Num_Livros from autor as A
join livro_autor as LA on LA.id_autor = A.id_autor and A.nome = 'J R R Tolkien';


