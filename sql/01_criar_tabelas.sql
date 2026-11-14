-- Estrutura relacional no SQLite. Execute antes de importar os CSVs manualmente.
CREATE TABLE IF NOT EXISTS vendas (
    id_venda TEXT PRIMARY KEY,
    data_venda TEXT NOT NULL, -- AAAA-MM-DD
    unidade TEXT NOT NULL,
    produto TEXT NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    valor_unitario REAL NOT NULL CHECK (valor_unitario >= 0),
    valor_total REAL NOT NULL CHECK (valor_total >= 0)
);

CREATE TABLE IF NOT EXISTS metas (
    mes TEXT NOT NULL, -- AAAA-MM
    unidade TEXT NOT NULL,
    meta_valor REAL NOT NULL CHECK (meta_valor > 0),
    PRIMARY KEY (mes, unidade)
);
