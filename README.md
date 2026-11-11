# 🏥 Hospital Database — Sistema de Gerenciamento Hospitalar

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
- **SQL:** Linguagem utilizada para criação, manipulação e consulta dos dados.
- **MySQL Workbench:** Ferramenta para modelagem, administração e visualização do banco.
- **InnoDB:** Mecanismo de armazenamento utilizado para garantir a integridade referencial.

---

## 🗄️ Modelagem do Banco de Dados

O banco de dados possui o nome `hospital_db` e é composto por **6 tabelas relacionadas**.

### Diagrama Entidade-Relacionamento (DER)

O diagrama apresenta a estrutura do banco, suas entidades e os relacionamentos entre elas.

![Diagrama Entidade-Relacionamento do Hospital](docs/der.png)

### Modelagem lógica

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

#### 2. Médicos

Armazena os dados dos profissionais responsáveis pelos atendimentos.

| Campo | Tipo | Descrição |
|---|---|---|
| id_medico | INT | Chave primária |
| nome_medico | CHAR(100) | Nome do médico |
| crm | CHAR(12) | CRM único |
| especialidade | CHAR(50) | Especialidade médica |

#### 3. Quartos

Responsável pelo armazenamento das informações dos quartos hospitalares.

| Campo | Tipo | Descrição |
|---|---|---|
| id_quarto | INT | Chave primária |
| numero_quarto | CHAR(3) | Número único do quarto |
| andar | CHAR(3) | Andar do quarto |
| tipo_quarto | CHAR(30) | Categoria do quarto |
| status_quarto | CHAR(20) | Situação do quarto |

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

#### 6. Prescrições

Armazena os medicamentos e as orientações prescritas durante as consultas.

| Campo | Tipo | Descrição |
|---|---|---|
| id_prescricao | INT | Chave primária |
| id_consulta | INT | Chave estrangeira |
| medicamento | CHAR(100) | Nome do medicamento |
| dosagem | CHAR(50) | Orientação de uso |
| quantidade | CHAR(30) | Quantidade prescrita |

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

## 📂 Estrutura do Repositório

O projeto está organizado em arquivos SQL separados, facilitando a identificação e execução dos scripts de cada tabela.

```text
BCD_Hospital/
│
├── README.md
│
├── hospital_db_pacientes.sql
├── hospital_db_medicos.sql
├── hospital_db_quartos.sql
├── hospital_db_internacoes.sql
├── hospital_db_consultas.sql
└── hospital_db_prescricoes.sql
│
└── docs/
    └── der.png
```

---

## 🚀 Como executar o projeto

### Pré-requisitos

Antes de executar o projeto, é necessário possuir:

- MySQL 8.0 ou superior.
- MySQL Workbench ou outra ferramenta compatível com MySQL.

### 1. Criar o banco de dados

Execute o seguinte comando:

```sql
CREATE DATABASE IF NOT EXISTS hospital_db;

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

Esses recursos permitem elaborar relatórios de consultas, internações, pacientes e valores hospitalares.

---

## 👨‍💻 Autor

Projeto desenvolvido como atividade acadêmica de Banco de Dados.

**Autor:** [Seu nome]

---

## 📚 Objetivo Educacional

Este projeto tem como finalidade colocar em prática os conceitos de Banco de Dados Relacionais, incluindo:

- Criação e estruturação de tabelas.
- Definição de chaves primárias e estrangeiras.
- Relacionamentos e cardinalidade.
- Integridade referencial.
- Inserção e manipulação de dados.
- Criação de índices.
- Desenvolvimento de consultas SQL.

**Projeto desenvolvido para fins educacionais.** Os dados utilizados são fictícios e destinados exclusivamente a testes e demonstrações.
