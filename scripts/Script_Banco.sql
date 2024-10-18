create database teste_wk;
use teste_wk;

create table Clientes (
	Codigo int not null auto_increment primary key,
    Nome varchar(200) not null,
    Cidade varchar(100) not null,
    UF char(2) not null
);

create table Produtos (
	Codigo int not null auto_increment primary key,
    Descricao varchar(255) not null,
    Preco_Venda decimal(10,2) not null default '0'
);

create index idx_nome on Clientes (Nome);

create index idx_descricao on Produtos (Descricao);

create table Pedido (
    Numero_Pedido int auto_increment primary key,
    Data_Emissao date not null,
    Codigo_Cliente int not null,
    Valor_Total decimal(10,2) not null default '0',    
    constraint fk_pedido_cliente foreign key (Codigo_Cliente) references Clientes (Codigo)
);

create table Pedido_Produto (
	Autoincrem int not null auto_increment primary key,
    Numero_Pedido int not null,
    Codigo_Produto int not null,
    Quantidade decimal(10,2) not null,
    Valor_Unitario decimal(10,2) not null default '0',
    Valor_Total decimal(10,2) not null default '0',
    constraint fk_Pedido_Produto_Numero_Pedido foreign key (Numero_Pedido) references Pedido (Numero_Pedido),
    constraint fk_Pedido_Produto_Codigo_Produto foreign key (Codigo_Produto) references Produtos (Codigo)
);

create index idx_pedido_data_emissao on Pedido (Data_Emissao);
create index idx_pedido_cliente on Pedido (Codigo_Cliente);

create index idx_pedido_produto_numero_pedido on Pedido_Produto(Numero_Pedido);
create index idx_pedido_produto_codigo_produto on Pedido_Produto(Codigo_Produto);