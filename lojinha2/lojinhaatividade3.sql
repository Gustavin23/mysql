/**
	Lojinha
    @author Gustavo Rene
    @version 1.0
*/

create database lojinharene2;
use lojinharene2;

create table produtos(
	id int primary key auto_increment,
    barcode varchar(255), -- codigo de barras
    produto varchar(255) not null,
    descricao varchar(255) not null,
    fabricante varchar(255) not null,
    datacad timestamp default current_timestamp, -- data de cadastro
    dataval date, -- data de validade
    setor varchar(255) not null,
    estoque int not null,
    estoquemin int not null,
    unidade varchar(255) not null,
    localizacao varchar(255),
	custo decimal(10,2) not null,
    lucro decimal(10,2),
    venda decimal(10,2)
);
describe produtos;

select * from produtos;

insert into produtos(barcode, produto, descricao,fabricante,dataval,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values 
('1234567890','Shape Marfim','Shape de madeira nacional','Element',
20500523,'Shape',100,20,'UN','SkateShop',100,100,200);

describe produtos;

select * from produtos;

select produto as Produto, setor as Setor from produtos order by produto;

create table usuarios (
	idusu int primary key auto_increment,
    usuario varchar(255) not null,
    login varchar(255) not null unique, -- unique não permite valores duplicados (exemplo: não vai conseguir criar um login com o nome de usuario)
    senha varchar(255) not null,
    perfil varchar(255) not null
);

describe usuarios;

-- para inserir uma senha com criptografia, usamos md5()
insert into usuarios(usuario,login,senha,perfil)
values ('Administrador','admin',md5('admin'),'admin');

insert into usuarios(usuario,login,senha,perfil)
values ('Rene','rene',md5('123456'),'user');

select * from usuarios; 

-- Acessando o sistema pela tela de login
-- and (função lógica onde todos as condições devem ser verdadeiras)

select * from usuarios where login='admin' and senha=md5('admin');

-- Criando os registros e estoque baixo --

insert into produtos(barcode, produto, descricao,fabricante,dataval,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values 
('1010101010','Rolamento','Rolamento Bones','Bones',
20210110,'Rolamento',50,20,'UN','SkateShop',90,50,135);

insert into produtos(barcode, produto, descricao,fabricante,dataval,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values 
('9090909090','Rolamento','Rolamento Spitfire','Spitfire',
20220310,'Rolamento',50,20,'UN','SkateShop',90,100,180);

insert into produtos(barcode, produto, descricao,fabricante,dataval,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values 
('1010101010','Bucha de borracha','Bucha de truck','Brasa',20210703,'Borracha',30,20,'UN','SkateShop',10,20,12);

insert into produtos(barcode, produto, descricao,fabricante,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values 
('8080808080','Roda','Roda Bones','Bones','Rodas',0,10,'UN','SkateShop',150,100,300);

insert into produtos(barcode, produto, descricao,fabricante,dataval,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values 
('7070707070','Shape Maple','Shape de madeira de Maple','Primitive','Não Obrigatório','Shape',4,1
0,'UN','SkateShop',120,50,180);

insert into produtos(barcode, produto, descricao,fabricante,dataval,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values 
('6060606060','Lixa','Lixa emborrachada','Sigilo','Não Obrigatório','Lixa',80,20,'UN','SkateShop',70,50,105);

insert into produtos(barcode, produto, descricao,fabricante,dataval,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values 
('5050505050','Lixa','Lixa Nacional','Brasa','Não Obrigatório','Lixa',30,20,'UN','SkateShop',20,50,30);

insert into produtos(barcode, produto, descricao,fabricante,dataval,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values 
('4040404040','Truck','Truck Importado','Independent','Não Obrigatório','Truck',30,20,'UN','SkateShop',170,100,340);

insert into produtos(barcode, produto, descricao,fabricante,dataval,setor,estoque,estoquemin,unidade,localizacao,custo,lucro,venda)
values 
('3030303030','Truck','Truck Nacional','Intruder','Não Obrigatório','Truck',25,20,'UN','SkateShop',180,100,360);

update produtos set estoque=4 where id=6;
update produtos set estoquemin=10 where id=6;
update produtos set barcode=1235541543 where id=2;
alter table produtos modify column barcode varchar(255) unique;

/* Relatórios */

-- Inventário do estoque (patrimônio) --
-- sum() função de soma no banco de dados
select sum(estoque * custo) as total from produtos; 

-- Relatório de reposição de estoque 1
select * from produtos where estoque < estoquemin;

-- Relatório de reposição de estoque 2
-- date_format() função usada para formatar a data
-- %d/%n/%Y dd/mm/aaaa | %d/%n/%y dd/mm/aa

select id as código, produto,
date_format(dataval,'%d/%m/%Y') as data_validade,
estoque, estoquemin as estoque_minímo
from produtos where estoque < estoquemin;

-- Relatório de validade de produtos 1
select id as código, produto, 
date_format(dataval,'%d/%m/%Y') as data_validade
from produtos;

-- Relatório de validade de produtos 2
-- datediff() calcula a diferença em dias
-- curdate() obtém a data atual 
select id as código, produto,
date_format(dataval,'%d/%m/%Y') as data_validade,
datediff(dataval,curdate()) as dias_restantes
from produtos;

-- Criando uma tabela de clientes --
create table clientes (
	idcli int primary key auto_increment,
    nome varchar(255) not null,
	fone varchar(255) not null,
    cpf varchar(255) unique,
    email varchar(255),
    marketing varchar(255) not null,
    cep varchar(255),
    endereco varchar(255),
    numero varchar(255),
    complemento varchar(255),
    bairro varchar(255),
    cidade varchar(255),
    uf char(2)
);

describe clientes;

-- CRUD Clientes --

insert into clientes(nome, datanasc, fone, cpf, email, marketing, cep, endereco, numero, complemento, bairro, cidade, uf)
values('Gustavo',20030702,940028922,23451363690,'gustavin@gmail.com', 'N', 04125643, 'Rua dos guimarães', 432, 'casa', 'Vila Mariana', 'São Paulo', 'SP');
insert into clientes(nome, datanasc, fone, cpf, email, marketing, cep, endereco, numero, complemento, bairro, cidade, uf)
values('Jefferson',20030612,'954351355',23147854315,'jefferson@gmail.com', 'S', 43125431, 'Rua Itapura ', 1302, 'casa', 'Tatuape', 'São Paulo', 'SP');
insert into clientes(nome, datanasc, fone, cpf, email, marketing)
values('João',20031012,'954325342',89089053498,'joao@gmail.com', 'S');
insert into clientes(nome, datanasc, fone, cpf, email, marketing)
values('Lucas',20020112,'958543289',54235423523,'lucas@gmail.com', 'N');
insert into clientes(nome, datanasc, fone, cpf, email, marketing, cep, endereco, numero, complemento, bairro, cidade, uf)
values('Ana',20030714,'954237524',74328194321,'ana@gmail.com', 'S', 02342140, 'Rua Mongi', 1324, 'casa', 'Diadema', 'Diadema', 'SP');
insert into clientes(nome, datanasc, fone, cpf, email, marketing)
values('Maria',20021115,'943218443',43214249420,'maria@gmail.com', 'S');

select * from clientes;

alter table clientes add column datanasc date not null after nome;

update clientes set fone=943211234 where idcli=4;    

delete from clientes where idcli=6;

-- Contatos
select nome, fone, email
from clientes;

-- Aniversariantes
select nome,
date_format(datanasc,'%d/%m/%Y') as aniversario
from clientes;

-- Marketing
select email from clientes where marketing=('S');


