SELECT nome, cpf, email FROM hospedes;

SELECT tipo, andar, valor_diaria
FROM quartos
WHERE disponivel = TRUE

SELECT h.nome, q.tipo AS quarto, q.andar, r.data_checkin, r.data_checkout
FROM reservas AS r  
JOIN hospedes AS h ON h.cpf = r.cpf_hospede
JOIN quartos AS q ON q.quarto_id = r.quarto_id
WHERE h.cpf = '12345678901'

SELECT h.nome, q.tipo AS quarto, q.andar, r.data_checkin, r.data_checkout
FROM reservas AS r  
JOIN hospedes AS h ON h.cpf = r.cpf_hospede
JOIN quartos AS q ON q.quarto_id = r.quarto_id
WHERE r.data_checkin BETWEEN '2025-09-02' AND '2025-09-05'

SELECT reservas_id, total_consumos, total_servicos, percentual_descontos
FROM reservas
ORDER BY total_reserva DESC;

SELECT p.descricao, SUM(cp.quantidade) AS qtde_total
FROM produtos AS p
JOIN consumos_produtos AS cp
ON cp.produtos_id = p.produtos_id
GROUP BY p.descricao
ORDER BY qtde_total DESC;

SELECT h.nome, h.cpf, (r.total_consumos + r.total_servicos + r.total_reserva ) AS qtde_total
FROM reservas as r
JOIN hospedes AS h on h.cpf = r.cpf_hospede
ORDER BY qtde_total DESC;

SELECT h.nome, r.data_checkin, r.data_checkout, r.status
FROM reservas as r
JOIN hospedes AS h on h.cpf = r.cpf_hospede
WHERE r.status = 'Pendente'
