-- Tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    tipo_cliente ENUM('PF', 'PJ') NOT NULL,
    nome_razao_social VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL
);

-- Tabela Cliente_PF
CREATE TABLE Cliente_PF (
    id_cliente_pf INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT UNIQUE NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabela Cliente_PJ
CREATE TABLE Cliente_PJ (
    id_cliente_pj INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT UNIQUE NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabela Endereco
CREATE TABLE Endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(100),
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL,
    tipo ENUM('Entrega', 'Cobrança') NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabela Pedido
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_endereco INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    status_pedido ENUM('Pendente', 'Enviado', 'Entregue', 'Cancelado', 'Devolvido') NOT NULL,
    periodo_carencia INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);

-- Tabela Produto
CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    id_fornecedor INT NOT NULL,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(255) NOT NULL
);

-- Tabela Estoque
CREATE TABLE Estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_fornecedor INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade >= 0),
    data_atualizacao DATE NOT NULL,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Tabela ItemPedido
CREATE TABLE ItemPedido (
    id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

-- Tabela Frete
CREATE TABLE Frete (
    id_frete INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_endereco INT NOT NULL,
    valor_frete DECIMAL(10, 2) NOT NULL,
    prazo_entrega INT NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);

-- Tabela Pagamento
CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    tipo_pagamento ENUM('Boleto', 'Cartão de Crédito', 'Cartão de Débito', 'Pix') NOT NULL,
    dados_pagamento VARCHAR(255) NOT NULL,
    data_cadastro DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabela Entrega
CREATE TABLE Entrega (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    status_entrega ENUM('Processamento', 'Enviado', 'Entregue') NOT NULL,
    codigo_rastreio VARCHAR(255),
    data_envio DATE,
    data_entrega DATE,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);