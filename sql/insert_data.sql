-- Inserir Cliente PF
INSERT INTO Cliente (tipo_cliente, nome, cpf, email, telefone, endereco, data_cadastro) VALUES
('PF', 'João da Silva', '123.456.789-00', 'KZ2Oq@example.com', '(11) 1234-5678', 'Rua A, 123', '2022-01-01');

INSERT INTO Cliente_PF (id_cliente, cpf, data_nascimento) VALUES
(1, '123.456.789-00', '1990-01-01');

-- Inserir Pagamento
INSERT INTO Pagamento (id_cliente, tipo_pagamento, dados_pagamento, data_cadastro) VALUES
(1, 'Boleto', '123456789', '2022-01-01');

