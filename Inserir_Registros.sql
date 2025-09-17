INSERT INTO hospedes (cpf, nome, endereco, telefone, email) VALUES
('12345678901', 'Carlos Eduardo Silva', 'Rua das Palmeiras, 123 - São Paulo/SP', '(11) 98765-4321', 'carlos.silva@example.com'),
('23456789012', 'Mariana Alves Rocha', 'Av. Brasil, 456 - Rio de Janeiro/RJ', '(21) 99876-5432', 'mariana.rocha@example.com'),
('34567890123', 'Fernando Oliveira Santos', 'Rua das Flores, 789 - Belo Horizonte/MG', '(31) 91234-5678', 'fernando.santos@example.com'),
('45678901234', 'Ana Beatriz Costa', 'Av. Paulista, 1000 - São Paulo/SP', '(11) 97654-3210', 'ana.costa@example.com'),
('56789012345', 'João Pedro Martins', 'Rua XV de Novembro, 250 - Curitiba/PR', '(41) 93456-7890', 'joao.martins@example.com');

INSERT INTO quartos (tipo, andar, valor_diaria, disponivel) VALUES
('Solteiro', 1, 150.00, TRUE),
('Casal', 2, 250.00, TRUE),
('Familia', 3, 400.00, FALSE),
('Casal', 4, 300.00, TRUE),
('Solteiro', 5, 180.00, FALSE);


INSERT INTO produtos (descricao, valor_unitario) VALUES
('Água Mineral 500ml', 5.00),
('Refrigerante Lata', 7.50),
('Cerveja Long Neck', 12.00),
('Suco Natural 300ml', 9.00),
('Chocolate Barra', 6.50),
('Batata Chips', 8.00),
('Sanduíche Natural', 15.00),
('Energético Lata', 14.00),
('Vinho Taça', 25.00),
('Serviço de Lavanderia', 30.00);


INSERT INTO servicos (descricao, categoria, valor) VALUES
('Limpeza diária do quarto', 'Zeladoria', 50.00),
('Troca extra de toalhas', 'Zeladoria', 20.00),
('Lavagem de roupas até 5 peças', 'Roupas', 40.00),
('Passadoria de roupas sociais', 'Roupas', 35.00),
('Estacionamento diário coberto', 'Estacionamento', 60.00),
('Estacionamento mensal', 'Estacionamento', 500.00);


INSERT INTO colaboradores (nome, cargo) VALUES
('Ricardo Menezes', 'Gerente Geral'),
('Fernanda Carvalho', 'Recepcionista'),
('Lucas Andrade', 'Recepcionista'),
('Mariana Ferreira', 'Camareira'),
('João Batista', 'Camareiro'),
('Patrícia Oliveira', 'Cozinheira'),
('Roberto Almeida', 'Auxiliar de Cozinha'),
('Carla Souza', 'Segurança'),
('Diego Santos', 'Manobrista'),
('André Lima', 'Técnico de Manutenção');


INSERT INTO servicos_colaboradores (servicos_id, rf_colaborador) VALUES
(1, 4),
(1, 5),
(2, 4),
(3, 6),
(3, 7),
(4, 6),
(5, 9),
(6, 9),
(1, 2),
(5, 8);

INSERT INTO consumos_produtos (produtos_id, quantidade, total, data) VALUES
(1, 2, 10.00, '2025-09-01 14:30:00'),  
(2, 3, 22.50, '2025-09-01 18:45:00'),  
(3, 1, 12.00, '2025-09-02 20:10:00'),  
(4, 2, 18.00, '2025-09-02 09:15:00'),  
(5, 4, 26.00, '2025-09-03 11:00:00'),  
(6, 1, 8.00, '2025-09-03 16:40:00'),   
(7, 2, 30.00, '2025-09-04 12:20:00'),  
(8, 1, 14.00, '2025-09-04 22:00:00'),  
(9, 2, 50.00, '2025-09-05 21:30:00'),  
(10, 1, 30.00, '2025-09-06 10:00:00');

INSERT INTO consumos_servicos (servico_colaborador_id, quantidade, total, data) VALUES
(1, 1, 50.00, '2025-09-01'),  
(2, 1, 50.00, '2025-09-01'),  
(3, 2, 40.00, '2025-09-02'),  
(4, 1, 40.00, '2025-09-02'),  
(5, 1, 35.00, '2025-09-03'),  
(6, 3, 180.00, '2025-09-03'), 
(7, 1, 60.00, '2025-09-04'),  
(8, 1, 500.00, '2025-09-04'), 
(9, 2, 100.00, '2025-09-05'), 
(10, 1, 60.00, '2025-09-06'); 

INSERT INTO reservas (
    cpf_hospede, quarto_id, data_checkin, data_checkout, 
    total_consumos, total_servicos, percentual_descontos, 
    total_reserva, forma_pagamento, status, avaliacao
) VALUES
('12345678901', 1, '2025-09-01', '2025-09-03',
 32.50, 50.00, 0.00, 282.50, 'Pix', 'Finalizado',
 'Atendimento excelente, quarto bem limpo.'),
('23456789012', 2, '2025-09-02', '2025-09-05',
 44.00, 95.00, 10.00, 699.60, 'Cartão de Crédito', 'Finalizado',
 'Gostei bastante, só achei o café da manhã fraco.'),
('34567890123', 3, '2025-09-04', '2025-09-05',
 50.00, 180.00, 0.00, 630.00, 'Pix', 'Finalizado',
 'Quarto espaçoso e confortável.'),
('45678901234', 4, '2025-09-05', '2025-09-07',
 26.00, 60.00, 5.00, 634.70, 'Cartão de Crédito', 'Pendente',
 'Ainda em andamento, até agora tudo ótimo.'),
('56789012345', 5, '2025-09-06', '2025-09-07',
 14.00, 0.00, 0.00, 194.00, 'Pix', 'Finalizado',
 'Boa estadia, custo-benefício excelente.');


INSERT INTO reservas_consumos (reserva_id, consumos_produtos_id, consumos_servicos_id) VALUES
(1, 1, NULL),
(1, 2, NULL),
(1, NULL, 1),
(2, 3, NULL),
(2, 4, NULL),
(2, NULL, 3),
(2, NULL, 5),
(3, 9, NULL),
(3, NULL, 6),
(4, 5, NULL),
(4, NULL, 7),
(5, 8, NULL);
