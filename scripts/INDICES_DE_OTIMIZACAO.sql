-- Índice para acelerar a Query 1
CREATE INDEX idx_pecas_estoque_preco
ON PECAS (QUANTIDADE_ESTOQUE, PRECO);

-- Índice para aniquilar o gargalo da Query 2 e Query 4
CREATE INDEX idx_pecas_fk_plateleira_metricas
ON PECAS (ID_PLATELEIRAS, PRECO, QUANTIDADE_ESTOQUE);

-- Índice temporal para acelerar a Query 3
CREATE INDEX idx_movimentacao_data
ON MOVIMENTACAO_ESTOQUE (DATA_MOVIMENTACAO);
