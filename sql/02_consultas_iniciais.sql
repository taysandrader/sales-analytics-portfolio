-- 1. Visualizar as primeiras vendas
SELECT * FROM vendas LIMIT 10;

-- 2. Total de faturamento (receita simulada)
SELECT ROUND(SUM(valor_total), 2) AS faturamento_total
FROM vendas;

-- 3. Faturamento por unidade
SELECT unidade, ROUND(SUM(valor_total), 2) AS faturamento
FROM vendas
GROUP BY unidade
ORDER BY faturamento DESC;

-- 4. Faturamento por produto
SELECT produto, ROUND(SUM(valor_total), 2) AS faturamento
FROM vendas
GROUP BY produto
ORDER BY faturamento DESC;

-- 5. Percentual de atingimento da meta por mês e unidade
WITH realizado AS (
    SELECT substr(data_venda, 1, 7) AS mes, unidade, SUM(valor_total) AS valor_realizado
    FROM vendas
    GROUP BY substr(data_venda, 1, 7), unidade
)
SELECT m.mes, m.unidade,
       ROUND(COALESCE(r.valor_realizado, 0), 2) AS realizado,
       m.meta_valor AS meta,
       ROUND(100.0 * COALESCE(r.valor_realizado, 0) / m.meta_valor, 1) AS atingimento_pct
FROM metas m
LEFT JOIN realizado r ON m.mes = r.mes AND m.unidade = r.unidade
ORDER BY m.mes, m.unidade;
