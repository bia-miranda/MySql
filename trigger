create database db06_06;
use db06_06;


create table tbl_Cidade(
cid_cod int primary key,
cid_nome varchar(30) not null
);

create table tbl_Cliente(
cli_cod int not null primary key,
cli_nome varchar(30) not null,
cid_cod int not null,
constraint  foreign key(cid_cod) references tbl_Cidade(cid_cod)
);

create table tbl_Venda(
ven_cod int primary key,
ven_data date,
cli_cod int,
ven_total decimal(10,2),
constraint foreign key(cli_cod) references tbl_Cliente(cli_cod)
);

create table tbl_Produto(
pro_cod int primary key,
pro_nome varchar(30),
pro_estoque int
);

create table tbl_itensVenda(
ven_cod int not null,
pro_cod int not null,
qtde_vendida int,
preco_venda numeric(10,2),
constraint primary key(ven_cod,pro_cod),
constraint foreign key(ven_cod) references tbl_Venda(ven_cod),
constraint foreign key(pro_cod) references tbl_Produto(pro_cod)
);



 -- INSERTS 
insert into tbl_Cidade values(1,'Araraquara');
insert into tbl_Cidade values(2,'Matão');
insert into tbl_Cidade values(3,'Taquaritinga');


insert into tbl_cliente values(1,'João Pereira',1);
insert into tbl_cliente values(2,'Vitor Barbosa',2);
insert into tbl_cliente values(3,'João Aparecido',3);
insert into tbl_cliente values(4,'Aparecido Pereira',3);

insert into tbl_Produto values(1,'mouse optico',600);
insert into tbl_Produto values(2,'mouse pad',400);
insert into tbl_Produto values(3,'teclado ergometrico',500);
insert into tbl_Produto values(4,'cadeira giratoria',200);
insert into tbl_Produto values(457,'monitor',546);

insert into tbl_Venda values(499,'2021-09-13',1,1000.00);
insert into tbl_Venda values(500,'2021-09-14',1,500.00);
insert into tbl_Venda values(501,'2021-09-20',2,200.00);
insert into tbl_Venda values(502,'2021-09-21',3,100.00);
insert into tbl_Venda values(503,'2021-09-25',3,150.00);
insert into tbl_Venda values(504,'2021-09-30',1,200.00);
insert into tbl_Venda values(505,'2021-10-02',2,100.00);
insert into tbl_Venda values(506,'2021-10-05',3,50.00);



 
-- ATENÇÃO LEIA DOCUMENTO NO MICROSOFT WORD ANTES DE PROSSEGUIR
-- Para os inserts na tbl_itensvenda serão implementadas triggers específicas para controle de estoque. 
-- Nossa base de dados foi configurada da melhor maneira para visualizar os resultados obtidos da implementação das triggers e stored procedures.
-- Tente criar a trigger e após cria-la, execute os códigos abaixo para inserir na tabela de itens da venda os seguintes valores nos campos codigo da venda, codigo do produto, quantidade vendida, preço da venda

delimiter $$
create trigger  tgi_baixaestoque after insert on tbl_itensVenda FOR EACH ROW 
begin
update tbl_produto set pro_estoque = (pro_estoque - new.qtde_vendida) where pro_cod = new.pro_cod;
end $$
delimiter ;


insert into tbl_itensVenda values(499,1,2,50.00);
insert into tbl_itensVenda values(499,2,1,50.00);
insert into tbl_itensVenda values(499,3,2,300.00);
insert into tbl_itensVenda values(499,4,1,600.00);

select * from tbl_itensVenda;
select * from tbl_produto;



 















