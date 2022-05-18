/**
	Lojinha rene
    @author Gustavo Rene 
*/

create database lojinharene;

use lojinharene;

create table produtos (
	id int primary key auto_increment,
	nome varchar(255) not null,
    estoque int(255) not null,
    valor decimal(10,2) not null
);

describe produtos;

