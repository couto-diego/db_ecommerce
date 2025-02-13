-- Consulta 1: Listar todos os clientes PF
SELECT 
    c.nome_razao_social AS nome, 
    pf.cpf, 
    pf.data_nascimento
FROM Cliente c
JOIN Cliente_PF pf ON c.id_cliente = pf.id_cliente;

-- Consulta 2: Listar pagamentos de um cliente específico (id_cliente = 1)
SELECT 
    tipo_pagamento, 
    dados_pagamento
FROM Pagamento
WHERE id_cliente = 1;