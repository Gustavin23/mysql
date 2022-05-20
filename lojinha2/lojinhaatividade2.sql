/**
	Lojinha
    @author Gustavo Rene
    @version 1.0
*/

create database lojinharene2;
use lojinharene2;

create table produtos (
	codigo int primary key auto_increment,
    produto varchar(255) not null,
	quantidade int not null,
    valor decimal(10,2)
);
describe produtos;

select * from produtos;

insert into produtos(produto,quantidade,valor) values('Shape Maple','4','249.90');
insert into produtos(produto,quantidade,valor) values('Shape Marfim','3','109.90');
insert into produtos(produto,quantidade,valor) values('Truck','4','300.90');
insert into produtos(produto,quantidade,valor) values('Lixa','4','100.00');
insert into produtos(produto,quantidade,valor) values('Roda','5','249.90');
insert into produtos(produto,quantidade,valor) values('Rolamento','6','100.00');

select produto,quantidade,valor from produtos order by produto;

update produtos set valor='149.90' where codigo=5;

delete from produtos where codigo=7;
