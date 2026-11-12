# 🏥 Sistema de Gerenciamento Hospitalar

Projeto acadêmico de Banco de Dados Relacional desenvolvido utilizando **MySQL**, com o objetivo de organizar e gerenciar informações de um hospital.

O banco de dados permite armazenar e relacionar informações de pacientes, médicos, quartos, internações, consultas e prescrições médicas, garantindo a organização dos dados por meio de chaves primárias, chaves estrangeiras e relacionamentos.

---

## 📌 Contextualização

A administração de um hospital envolve diversas informações que precisam ser armazenadas e consultadas constantemente.

O cadastro de pacientes, o controle de médicos, a disponibilidade de quartos, as internações e o histórico de consultas são processos fundamentais para o funcionamento de uma instituição hospitalar.

Quando essas informações são armazenadas separadamente, podem ocorrer problemas como:

- Dificuldade para localizar informações de pacientes.
- Falta de organização dos registros de consultas.
- Dificuldade no acompanhamento das internações.
- Falta de controle sobre os quartos hospitalares.
- Dificuldade para consultar prescrições médicas.
- Repetição e inconsistência de informações.

## 🎯 Proposta

Desenvolver um banco de dados relacional utilizando MySQL para centralizar e organizar as informações hospitalares.

A estrutura foi planejada para conectar as diferentes áreas do hospital por meio de relacionamentos entre tabelas, facilitando consultas, atualizações e o gerenciamento das informações.

## ⚙️ Tecnologias utilizadas

- **MySQL 8.0:** Sistema de gerenciamento de banco de dados.
- **MySQL Workbench:** Ferramenta para modelagem, administração e visualização do banco.

---

## 🗄️ Modelagem do Banco de Dados

O banco de dados possui o nome `hospital_db` e é composto por **6 tabelas relacionadas**.

### Diagrama Entidade-Relacionamento (DER)

O diagrama apresenta a estrutura do banco, suas entidades e os relacionamentos entre elas.

<p align="center">
<img width="703" alt="Captura de tela 2026-11-11 185735" src="https://github.com/user-attachments/assets/5ad4a94b-6235-4aa4-9447-e44e897d4a58" />
</p>

### 1. Criar o banco de dados

Execute o seguinte comando:

```sql
CREATE DATABASE IF NOT EXISTS hospital_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_0900_ai_ci;

USE hospital_db;
```

### 2. Executar os arquivos SQL

Após criar o banco de dados, importe os arquivos na seguinte ordem:

1. `hospital_db_pacientes.sql`
2. `hospital_db_medicos.sql`
3. `hospital_db_quartos.sql`
4. `hospital_db_internacoes.sql`
5. `hospital_db_consultas.sql`
6. `hospital_db_prescricoes.sql`

**No MySQL Workbench:**

1. Abra sua conexão com o MySQL.
2. Selecione o banco de dados `hospital_db`.
3. Acesse **File → Open SQL Script**.
4. Escolha o primeiro arquivo SQL.
5. Execute o script pelo botão de raio.
6. Repita o procedimento para os demais arquivos, respeitando a ordem indicada.

**Atenção:** Os arquivos SQL possuem comandos `DROP TABLE IF EXISTS` e inserções de dados. Portanto, executá-los novamente recria as respectivas tabelas e pode apagar os dados existentes.

### 3. Verificar a criação do banco

Após executar todos os arquivos, utilize:

```sql
USE hospital_db;

SHOW TABLES;

```

### Modelagem lógica

O resultado deverá apresentar as seis tabelas:

- pacientes
- medicos
- quartos
- internacoes
- consultas
- prescricoes

Para conferir os registros:

```sql
SELECT * FROM pacientes;
SELECT * FROM medicos;
SELECT * FROM quartos;
SELECT * FROM internacoes;
SELECT * FROM consultas;
SELECT * FROM prescricoes;
```

A seguir estão as principais tabelas e seus respectivos atributos.

#### 1. Pacientes

Armazena as informações cadastrais dos pacientes.

| Campo | Tipo | Descrição |
|---|---|---|
| id_paciente | INT | Chave primária |
| nome_paciente | VARCHAR(100) | Nome do paciente |
| cpf | CHAR(14) | CPF único |
| data_nascimento | DATE | Data de nascimento |
| telefone_paciente | CHAR(15) | Telefone |
| convenio | CHAR(50) | Convênio médico |

### Na Prática

<img width="381" alt="image" src="https://github.com/user-attachments/assets/0b011153-2fe8-407d-b2b4-45caa9dccd1b" />


#### 2. Médicos

Armazena os dados dos profissionais responsáveis pelos atendimentos.

| Campo | Tipo | Descrição |
|---|---|---|
| id_medico | INT | Chave primária |
| nome_medico | CHAR(100) | Nome do médico |
| crm | CHAR(12) | CRM único |
| especialidade | CHAR(50) | Especialidade médica |

### Na Prática

<img width="369" alt="image" src="https://github.com/user-attachments/assets/e9464518-ddbd-42d9-9415-be2d591eba33" />

#### 3. Quartos

Responsável pelo armazenamento das informações dos quartos hospitalares.

| Campo | Tipo | Descrição |
|---|---|---|
| id_quarto | INT | Chave primária |
| numero_quarto | CHAR(3) | Número único do quarto |
| andar | CHAR(3) | Andar do quarto |
| tipo_quarto | CHAR(30) | Categoria do quarto |
| status_quarto | CHAR(20) | Situação do quarto |

### Na Prática

<img width="411" alt="image" src="https://github.com/user-attachments/assets/dff379be-6c86-400f-8ec0-89675656d5a1" />

#### 4. Internações

Registra as internações dos pacientes e os quartos utilizados.

| Campo | Tipo | Descrição |
|---|---|---|
| id_internacao | INT | Chave primária |
| id_paciente | INT | Chave estrangeira |
| id_quarto | INT | Chave estrangeira |
| data_entrada | DATE | Data de entrada |
| data_saida | DATE | Data de saída |
| valor_diaria | DECIMAL(10,2) | Valor da diária |

### Na Prática

<img width="507" alt="image" src="https://github.com/user-attachments/assets/649c5c0a-e66d-49f2-8a3f-0ac64e6bb37c" />

#### 5. Consultas

Armazena os atendimentos realizados pelos médicos.

| Campo | Tipo | Descrição |
|---|---|---|
| id_consulta | INT | Chave primária |
| data_consulta | DATETIME | Data e horário |
| status_consulta | CHAR(20) | Situação da consulta |
| valor_consulta | DECIMAL(10,2) | Valor do atendimento |
| id_paciente | INT | Chave estrangeira |
| id_medico | INT | Chave estrangeira |

### Na Prática

<img width="496" alt="image" src="https://github.com/user-attachments/assets/f0a33c07-5581-494d-9606-b18a6a8f04b2" />

#### 6. Prescrições

Armazena os medicamentos e as orientações prescritas durante as consultas.

| Campo | Tipo | Descrição |
|---|---|---|
| id_prescricao | INT | Chave primária |
| id_consulta | INT | Chave estrangeira |
| medicamento | CHAR(100) | Nome do medicamento |
| dosagem | CHAR(50) | Orientação de uso |
| quantidade | CHAR(30) | Quantidade prescrita |

### Na Prática

<img width="484" alt="image" src="https://github.com/user-attachments/assets/154e6f22-c5f8-485e-8697-53eb3ceeb4c2" />

---

## 🔗 Relacionamentos e Cardinalidade

O banco utiliza relacionamentos para conectar as informações das diferentes tabelas.

### Relacionamentos 1:N (Um para Muitos)

- **Pacientes → Internações:** Um paciente pode possuir várias internações, mas cada internação pertence a um único paciente.
- **Quartos → Internações:** Um quarto pode aparecer em várias internações ao longo do tempo, mas cada internação está vinculada a um único quarto.
- **Pacientes → Consultas:** Um paciente pode realizar várias consultas, mas cada consulta pertence a um único paciente.
- **Médicos → Consultas:** Um médico pode realizar várias consultas, mas cada consulta está vinculada a um único médico.
- **Consultas → Prescrições:** Uma consulta pode possuir várias prescrições, mas cada prescrição pertence a uma única consulta.

### Integridade referencial

Os relacionamentos são implementados por meio de chaves estrangeiras (FK), garantindo que os registros relacionados respeitem as referências existentes no banco.

As chaves primárias (PK) identificam exclusivamente cada registro.

---

## 🚀 Como executar o projeto

### Pré-requisitos

Antes de executar o projeto:

- MySQL 8.0 ou superior.
- MySQL Workbench ou outra ferramenta compatível com MySQL.
- 
---

## 📊 Índices e Otimização

Foram criados índices para facilitar buscas frequentes e melhorar o desempenho de determinadas consultas.

| Índice | Tabela | Campo |
|---|---|---|
| idx_pacientes_nome | pacientes | nome_paciente |
| idx_medicos_especialidade | medicos | especialidade |
| idx_consultas_data | consultas | data_consulta |

Também são utilizados índices associados às chaves primárias, chaves estrangeiras e restrições de unicidade.

---

## 📝 Consultas SQL

A estrutura permite desenvolver consultas para extrair informações importantes do hospital, utilizando recursos da linguagem SQL, como:

- `SELECT`: Consultar informações.
- `WHERE`: Filtrar registros.
- `JOIN`: Relacionar diferentes tabelas.
- `GROUP BY`: Agrupar informações.
- `ORDER BY`: Ordenar resultados.
- `COUNT()`: Contabilizar registros.
- `SUM()`: Calcular valores acumulados.
- `AVG()`: Calcular médias.
- `HAVING`: Filtrar resultados agrupados.
- `Like`: buscar padrões de texto em colunas de uma tabela.

---

### 1. Faturamento Total de Consultas por Convênio
Contextualização e Situação-Problema: O setor financeiro necessita de um levantamento simples do valor total arrecadado em consultas para os convênios que possuem "Saúde" no nome, visando acompanhar o faturamento por parceiro.

<img width="600" alt="image" src="https://github.com/user-attachments/assets/d32c352c-48d7-4067-aa84-c76313394f5e" />

---

### 2. Média do Valor de Consulta por Especialidade Médica
Contextualização e Situação-Problema: A coordenação clínica deseja verificar a média do valor das consultas realizadas apenas nas especialidades ligadas à Cardiologia.

<img width="600" alt="image" src="https://github.com/user-attachments/assets/7c031104-40d1-46d0-ab2d-fcc952a121f8" />

---

### 3. Valor Médio das Diárias por Tipo de Quarto
Contextualização e Situação-Problema: A gerência de infraestrutura hospitalar precisa analisar o valor médio da diária praticado nas internações em acomodações do tipo "Apartamento" ou "UTI".

<img width="600" alt="image" src="https://github.com/user-attachments/assets/cf13e27e-a43a-42cd-bba8-a5a5b475d2eb" />

---

### 4. Total de Consultas Realizadas por Médico
Contextualização e Situação-Problema: A diretoria de atendimento quer um relatório que liste o nome dos médicos e a soma total dos valores de suas consultas, filtrando apenas consultas com status de "Realizada" ou "Finalizada".

<img width="600" alt="image" src="https://github.com/user-attachments/assets/d6e13e2c-1760-4d82-abca-010aaa157c44" />

---

### 5. Soma de Diárias por Paciente com Sobrenome "Silva"
Contextualização e Situação-Problema: O setor de cobrança precisa identificar a soma acumulada do valor das diárias de internação para todos os pacientes que tenham o sobrenome "Silva".

<img width="600" alt="image" src="https://github.com/user-attachments/assets/0fd69b5a-3a7f-4673-a54b-d281170ac7e3" />

---

### 6. Contagem de Prescrições por Status da Consulta
Contextualização e Situação-Problema: A farmácia hospitalar solicita a quantidade total de medicamentos prescritos agrupada pelo status da consulta correspondente, considerando apenas prescrições onde o medicamento contenha "Dipirona" ou "Paracetamol".

<img width="600" alt="image" src="https://github.com/user-attachments/assets/d6509662-eb64-4831-9d9c-8577c32498d4" />

---

### 7. Média de Valor de Consultas por Convênio e Especialidade
Contextualização e Situação-Problema: Em negociação contratual, a auditoria do hospital quer saber o valor médio pago por consulta cruzando os convênios que contêm "Unimed" com a especialidade do médico.

<img width="600" alt="image" src="https://github.com/user-attachments/assets/3f71aa9f-a3fc-4e53-8e3c-2f0a8a3bf355" />

---

### 8. Média de Diária de Internação por Convênio em Quartos de UTI
Contextualização e Situação-Problema: A regulação hospitalar precisa calcular o valor médio gasto em diárias de internação agrupado por convênio, considerando unicamente os quartos classificados como "UTI".

<img width="600" alt="image" src="https://github.com/user-attachments/assets/2a531142-90b0-4a9c-80d5-1e5a26845bde" />

---

### 9. Medicamentos Prescritos por Médico em Consultas Realizadas
Contextualização e Situação-Problema: A comissão de farmácia e terapêutica deseja saber a quantidade total de itens prescritos por médico nas consultas que foram marcadas como "Realizada".

<img width="600" alt="image" src="https://github.com/user-attachments/assets/0f1ee5f6-3074-4c7b-ba49-4ffac97306eb" />

---

### 10. Valor Total e Média de Consultas por Paciente
Contextualização e Situação-Problema: O atendimento ao cliente precisa de um extrato financeiro simples mostrando a soma e a média dos valores gastos em consultas por pacientes cujo nome começa com a letra "M".

<img width="600" alt="image" src="https://github.com/user-attachments/assets/a3c6dd3d-6e9e-4e83-b27d-06756487c1bc" />

Esses recursos permitem elaborar relatórios de consultas, internações, pacientes e valores hospitalares.

---

## 👨‍💻 Autor

Projeto desenvolvido como atividade acadêmica de Banco de Dados.

**Autor:** Felipe Lisboa Carvalho

---

## 📚 Objetivo Educacional

Este projeto tem como finalidade colocar em prática os conceitos de Banco de Dados Relacionais, incluindo:

- Desenvolvimento de consultas SQL.
- Criação e estruturação de tabelas.
- Definição de chaves primárias e estrangeiras.
- Relacionamentos e cardinalidade.
- Inserção e manipulação de dados.

**Projeto desenvolvido para fins educacionais.** Os dados utilizados são fictícios e destinados exclusivamente a testes e demonstrações.
