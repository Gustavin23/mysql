/**
	Agenda de contatos
    @author Gustavo Rene 
*/

-- Verificar bancos de dados
show databases;

-- Criar um novo banco de dados
create database teste;
create database agendagustavo;

-- Excluir um banco de dados
drop database teste;

-- Selecionar o banco de dados
use agendagustavo;

-- Criando uma tabela
-- int -> tipo de dados - números inteiros
-- decimal (10,2) - tipo de dados - números não inteiros
-- (10,2) 10 dígitos com 2 casas decimais
-- primary key (transforma o campo em chave primária)
-- auto_increment (numeração automática)
-- varchar(255) -> tipo de dados String (com variação)
-- char(255) -> tipo de dados String (sem variação)
-- (255) -> máximo de caracteres  
-- not null (obrigatório o preenchimento)



create table contatos (
	id int primary key auto_increment,
	nome varchar(255) not null,
    fone varchar(255) not null,
    email varchar(255)
);

-- verificar tabelas do banco
show tables;

-- descrever a tabela
describe contatos;

-- adicionando uma coluna(campo) a tabela
alter table contatos add column obs varchar(255);

-- adicionando uma coluna(campo) a tabela
alter table contatos add column fone2 varchar(255);

-- adicionando uma coluna(campo) a tabela após um campo
alter table contatos add column cel varchar(255) after fone;

-- modificando uma propriedade da coluna(campo) tabela
alter table contatos modify column cel varchar(255) not null;

-- excluir uma coluna (campo) da tabela
alter table contatos drop column obs;

-- excluit a tabela 
drop table contatos;

/***** CRUD *****/

-- CRUD CREATE (inserir um registro na tabela)
-- tipo varchar ou char usar 'aspas simples'
insert into contatos(nome,fone,email) values('Gustavo Rene','4002-8922','gustavinho@gmail.com');
insert into contatos(nome,fone) values('Marcelin','95034-7483');
insert into contatos(fone,email) values('90321-4324','rickson@gmail.com');

insert into contatos(nome,fone,email) values('Carol','93243-5470','carolzinha@gmail.com');
insert into contatos(nome,fone,email) values('Caroline','91233-4325','caroline@gmail.com');
insert into contatos(nome,fone) values('Robson','93212-3254');
insert into contatos(nome,fone) values('Roberto','90325-4325');
insert into contatos(nome,fone,email) values('Maria','93214-5134','maria@gmail.com');

-- CRUD READ (seleção de todos os registros da tabela)
select * from contatos;

-- seleção de um registro (contato) específico
select * from contatos where id=2;
select * from contatos where nome='Marcelin';
select * from contatos where nome like 'c%';

-- seleção de campos específicos de um registro
select nome,fone from contatos;
-- ordernar em ordem alfabetica A-Z
select nome,fone,email from contatos order by nome;
-- ordernar de Z-A
select nome,fone,email from contatos order by nome desc;
-- criando apelidos para os campos
select nome as Contato, fone as Telefone, email as Email from contatos order by nome;

-- CRUD UPDATE
-- where escolhe qual id
update contatos set email='marcelin@hotmail.com' where id=2;
update contatos set nome='Rick' where id=3;

update contatos set nome='Robson da Silva', fone='99999-9999', email='robinho@hotmail.com' where id=6;
-- CRUD DELETE
delete from contatos where id=7;

