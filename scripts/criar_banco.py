"""Cria banco SQLite a partir dos CSVs usando apenas bibliotecas padrão."""
from pathlib import Path
import csv
import sqlite3

RAIZ = Path(__file__).resolve().parents[1]
BANCO = RAIZ / "sales_analytics.db"

def carregar_csv(conexao, arquivo, tabela, colunas):
    with (RAIZ / "dados" / arquivo).open(encoding="utf-8-sig", newline="") as f:
        registros = list(csv.DictReader(f))
    campos = ", ".join(colunas)
    parametros = ", ".join("?" for _ in colunas)
    valores = [[linha[coluna] for coluna in colunas] for linha in registros]
    conexao.executemany(
        f"INSERT INTO {tabela} ({campos}) VALUES ({parametros})", valores
    )
    return len(valores)

def main():
    if BANCO.exists():
        BANCO.unlink()  # Recria banco de demonstração do zero
    with sqlite3.connect(BANCO) as conexao:
        conexao.executescript((RAIZ / "sql" / "01_criar_tabelas.sql").read_text(encoding="utf-8"))
        nv = carregar_csv(conexao, "vendas.csv", "vendas",
                         ["id_venda", "data_venda", "unidade", "produto", "quantidade", "valor_unitario", "valor_total"])
        nm = carregar_csv(conexao, "metas.csv", "metas", ["mes", "unidade", "meta_valor"])
        total = conexao.execute("SELECT ROUND(SUM(valor_total),2) FROM vendas").fetchone()[0]
    print(f"Banco criado: {BANCO.name} | {nv} vendas | {nm} metas | R$ {total:,.2f} em vendas")

if __name__ == "__main__":
    main()
