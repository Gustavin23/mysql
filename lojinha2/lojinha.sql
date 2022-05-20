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