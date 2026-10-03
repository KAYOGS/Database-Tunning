INSERT INTO PECAS (CODIGO_SKU, NOME_PECA, PRECO, QUANTIDADE_ESTOQUE, ID_PLATELEIRAS)
WITH RECURSIVE gera_dados(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1 FROM gera_dados WHERE n < 10000000
)
SELECT
    'SKU-AUTO-' || printf('%08d', n) AS CODIGO_SKU,
    'Peca Automotiva Codigo ' || n AS NOME_PECA,
    ROUND(15.0 + (abs(random()) % 350000) / 100.0, 2) AS PRECO,
    (abs(random()) % 250) + 1 AS QUANTIDADE_ESTOQUE,
    (abs(random()) % 205) + 1 AS ID_PLATELEIRAS
FROM gera_dados;

INSERT INTO MOVIMENTACAO_ESTOQUE (ID_PECA, TIPO_MOVIMENTACAO, QUANTIDADE, DATA_MOVIMENTACAO, DESCRICAO)
WITH RECURSIVE gera_movimentacoes(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1 FROM gera_movimentacoes WHERE n < 500000
)
SELECT
    (abs(random()) % 100000) + 1 AS ID_PECA, -- Relaciona com os 100.000 registos de PECAS
    CASE WHEN (abs(random()) % 2) = 0 THEN 'ENTRADA' ELSE 'SAIDA' END AS TIPO_MOVIMENTACAO,
    (abs(random()) % 50) + 1 AS QUANTIDADE,
    datetime('2025-01-01 08:00:00', '+' || (abs(random()) % 500) || ' days', '+' || (abs(random()) % 86400) || ' seconds') AS DATA_MOVIMENTACAO,
    'Movimentacao automatica de teste ' || n AS DESCRICAO
FROM gera_movimentacoes;
