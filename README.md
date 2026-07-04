# Projeto Lógico de Banco de Dados - E-commerce

Este repositório contém a modelagem lógica e implementação física de um banco de dados para um cenário de E-commerce, desenvolvido como desafio de projeto.

## 📌 Refinamentos Aplicados
Com base no modelo conceitual padrão, foram implementadas as seguintes regras de negócio solicitadas:
1. **Diferenciação de Clientes (PF/PJ):** Criação de tabelas especializadas conectadas à tabela base de Clientes, garantindo integridade referencial e impedindo duplicidade de tipos para a mesma conta.
2. **Múltiplas Formas de Pagamento:** Uma tabela dedicada permite que os clientes salvem diversos métodos de pagamento (Cartões, Pix, Boleto).
3. **Gerenciamento de Entregas:** Implementação de rastreamento individualizado por pedido, contendo status e código de rastreio único.

## 🗂️ Estrutura do Repositório
* `schema_ecommerce.sql`: Script de criação de tabelas e definição de constraints (DDL).
* `data_insertion.sql`: Script com dados fictícios para testes e validação (DML).
* `queries_execution.sql`: Consultas complexas utilizando junções, agregações (`GROUP BY / HAVING`) e ordenações.

## 🚀 Como Executar
1. Instale o MySQL Server ou utilize o MySQL Workbench.
2. Execute o arquivo de criação de esquema.
3. Popule o banco com o script de inserção.
4. Execute as queries analíticas para validar os resultados.# Projeto-L-gico-de-Banco-de-Dados---E-commerce
