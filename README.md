# Descrição do Projeto

Este projeto consiste na criação de um banco de dados para gerenciar as operações de uma oficina mecânica. O objetivo é modelar e implementar um esquema relacional que permita o armazenamento e manipulação de informações sobre clientes, veículos, mecânicos, equipes, ordens de serviço, serviços prestados e peças utilizadas. 

# Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas:

- **cliente**: Armazena informações sobre os clientes da oficina.
- **veiculo**: Registra informações dos veículos associados aos clientes.
- **mecanico**: Contém dados dos mecânicos que prestam serviço na oficina.
- **equipe**: Representa equipes de mecânicos para atendimento das ordens de serviço.
- **ordem_servico**: Registra as ordens de serviço abertas para cada veículo.
- **servico**: Contém a descrição dos serviços oferecidos.
- **peca**: Armazena informações sobre as peças utilizadas nos serviços.
- **equipe_mecanico**: Relaciona equipes e seus respectivos mecânicos.
- **ordem_servico_servico**: Associa serviços às ordens de serviço.
- **ordem_servico_peca**: Relaciona peças utilizadas a uma ordem de serviço.

# Funcionalidades do Projeto

O banco de dados possibilita:
- Cadastro e gerenciamento de clientes e seus veículos.
- Registro de ordens de serviço para cada veículo.
- Alocação de equipes e mecânicos para cada ordem de serviço.
- Armazenamento dos serviços realizados e peças utilizadas.
- Monitoramento do status das ordens de serviço.

# Queries SQL

Para testar a funcionalidade do banco de dados, foram criadas as seguintes consultas SQL:

1. **Recuperação de Dados:**
   ```sql
   SELECT * FROM cliente;
   ```
   
2. **Filtragem de Dados:**
   ```sql
   SELECT * FROM veiculo WHERE ano >= 2020;
   ```

3. **Atributos Derivados:**
   ```sql
   SELECT id_ordem_servico, valor_total, (valor_total * 1.1) AS valor_com_taxa
   FROM ordem_servico;
   ```

4. **Ordenação de Dados:**
   ```sql
   SELECT * FROM ordem_servico ORDER BY data_emissao DESC;
   ```

5. **Filtro em Agrupamento:**
   ```sql
   SELECT equipe_id, COUNT(*) AS total_servicos 
   FROM ordem_servico
   GROUP BY equipe_id
   HAVING COUNT(*) > 5;
   ```

6. **Junção entre Tabelas:**
   ```sql
   SELECT c.nome, v.placa, os.status
   FROM cliente c
   JOIN veiculo v ON c.id_cliente = v.cliente_id
   JOIN ordem_servico os ON v.id_veiculo = os.veiculo_id;
   ```

# Implementação

O banco de dados foi implementado utilizando **MySQL**, com o script gerado pelo **MySQL Workbench**. 

# Repositório

O projeto será armazenado em um repositório no **GitHub** para futura avaliação. 

# Considerações Finais

Este projeto foi desenvolvido como parte de um desafio prático, aplicando conhecimentos sobre modelagem de dados, SQL e implementação de bancos de dados relacionais. Com isso, garantimos um sistema eficiente para a gestão de ordens de serviço em oficinas mecânicas.

