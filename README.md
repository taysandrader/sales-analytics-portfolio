# Sales Analytics | Portfólio de Análise de Dados

Projeto de estudo para simular a análise de desempenho comercial de quatro unidades, com **dados 100% fictícios**. Objetivo: praticar SQL, cálculos de KPIs e comunicação de insights.

## Perguntas de negócio
- Qual unidade teve maior faturamento?
- Quais produtos mais contribuíram para as vendas?
- Qual foi o atingimento percentual de metas por mês e unidade?

## Tecnologias
- **SQL (SQLite):** consultas, agregações, junções e indicadores
- **Python 3 (biblioteca padrão):** criação do banco de dados local a partir de arquivos CSV
- **Power BI (etapa futura):** visualização de indicadores

## Estrutura
```text
sales-analytics-portfolio/
├── dados/
│   ├── vendas.csv
│   └── metas.csv
├── docs/
│   └── atividades.md
├── scripts/
│   └── criar_banco.py
├── sql/
│   ├── 01_criar_tabelas.sql
│   └── 02_consultas_iniciais.sql
├── .gitignore
└── README.md
```

## Como executar (Windows, macOS ou Linux)
1. Instale Python 3, caso não tenha.
2. Abra um terminal na pasta do projeto.
3. Execute `python scripts/criar_banco.py` (em alguns sistemas, `python3`; no Windows também pode ser `py`).
4. Abra o arquivo criado `sales_analytics.db` em um programa de SQLite, por exemplo **DB Browser for SQLite**.
5. Execute as consultas do arquivo `sql/02_consultas_iniciais.sql`, uma por vez.

**Não precisa instalar pacotes de Python**; o script usa apenas bibliotecas que acompanham o Python. Se desejar começar sem Python, os arquivos CSV também podem ser abertos no Excel e importados em uma ferramenta SQLite.

## Modelo dos dados
- **vendas:** uma linha por venda, com identificador, data, unidade, produto, quantidade, valor unitário e total.
- **metas:** uma linha por mês e unidade, com o valor-alvo de vendas.
- **Relacionamento lógico:** mês extraído de `vendas.data_venda` + `unidade` correspondem a `metas.mes` + `unidade`.

## Indicador principal
`atingimento (%) = faturamento realizado / meta × 100`

## Próximas etapas
- [x] Criar dados simulados e banco SQLite
- [x] Preparar consultas SQL para estudo
- [ ] Analisar resultados e redigir insights próprios
- [ ] Criar gráficos no Power BI
- [ ] Publicar capturas de tela do dashboard

## Transparência
Todo o conteúdo numérico é **simulado para fins educacionais**; não contém informações de clientes, colegas ou instituições reais. O projeto só deve ser descrito no currículo com as etapas efetivamente concluídas.
