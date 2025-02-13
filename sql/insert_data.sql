-- Inserir Cliente PF
INSERT INTO Cliente (tipo_cliente, nome_razao_social, email, telefone, data_cadastro)
VALUES ('PF', 'João da Silva', 'joao.silva@example.com', '(11) 1234-5678', '2022-01-01');

-- Obter o ID do cliente recém-inserido
SET @id_cliente = LAST_INSERT_ID();

-- Inserir Endereço do Cliente
INSERT INTO Endereco (id_cliente, logradouro, numero, bairro, cidade, estado, cep, tipo)
VALUES (@id_cliente, 'Rua A', '123', 'Centro', 'São Paulo', 'SP', '12345678', 'Entrega');

-- Obter o ID do endereço recém-inserido
SET @id_endereco = LAST_INSERT_ID();

-- Inserir Cliente PF
INSERT INTO Cliente_PF (id_cliente, cpf, data_nascimento)
VALUES (@id_cliente, '12345678900', '1990-01-01');

-- Inserir Pagamento
INSERT INTO Pagamento (id_cliente, tipo_pagamento, dados_pagamento, data_cadastro)
VALUES (@id_cliente, 'Boleto', '123456789', '2022-01-01');