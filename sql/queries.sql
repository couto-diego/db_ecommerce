-- Listar todos os clientes PF

SELECT c.nome, pf.cpf, pf.data_nascimento
FROM Cliente c
JOIN Cliente_PF pf ON c.id_cliente = pf.id_cliente


-- Listar pagamento de um cliente

SELECT tipo_pagamento, dados_pagamento
FROM Pagamento
WHERE id_cliente = 1