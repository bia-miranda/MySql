create database  db_lojaVirtual;
use db_lojaVirtual;

create table tbl_Cli(
	nm_cliente char(80) not null,
    no_CPF char(11) not null,
    nm_Logradouro varchar(80) not null, no_Log char(5) not null, ds_Log varchar(40) not null, 
    nm_CEP char(8) not null, nm_Bairro varchar(30) not null, sg_UF char(2) not null,
    ds_login varchar(20) not null,
    ds_senha char(6) not null
);

-- adicionando campo ds_Status na ultima coluna da tabela
alter table tbl_Cli
add column ds_Status bit not null;

-- adicionando campo na primeira coluna
alter table tbl_Cli
add column id_Cliente int primary key auto_increment first;

-- adicionando campo após uma coluna
alter table tbl_Cli
add column nm_Cidade varchar(50) not null after nm_bairro;

-- alterando estrutura de dados e restriçoes
alter table tbl_Cli
modify column nm_Cliente varchar(80) not null;

alter table tbl_Cli
modify column nm_Log varchar(80) not null;

alter table tbl_Cli
modify column no_log varchar(5) not null;

alter table tbl_Cli
modify column ds_log varchar(40) null;

-- mudando o nome das colunas
alter table tbl_Cli
change column nm_Lograd nm_Log varchar(40) not null,
change column ds_Endereco ds_Complemento varchar(40) not null
;

-- alterando o nome da tabela
alter table tbl_Cli
rename to tbl_Cliente;


-- excluindo coluna da tabela
alter table tbl_Cli
drop column nm_Cidade;

-- select * from tbl_Cli;
-- comando para ver a estrutura da tabela
desc tbl_Cliente; 
