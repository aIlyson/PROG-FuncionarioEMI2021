# Sistema Funcionários

## Índice

* [1. Sobre o Projeto](#1-sobre-o-projeto)
* [2. Funcionalidades da Aplicação](#2-funcionalidades)
* [3. Estrutura do Banco de Dados](#3-estrutura-do-banco-de-dados)
* [5. Ferramentas Utilizadas](#5-ferramentas-utilizadas)

============================================================================

### 1. Sobre o Projeto

Sistema web para monitorar e consultar informações de funcionários em empresas.

### 2. Funcionalidades

- *Cadastro de Funcionários:*
  Permite registrar novos funcionários com informações como nome, data de nascimento, e-mail e status, associando um endereço.

- *Cadastro de Dependentes:*
  Possibilita cadastrar dependentes associados a um funcionário e seu endereço.

- *Histórico de Cargo:*
  Mantém um histórico dos cargos ocupados por cada funcionário, permitindo consultar o histórico de cargos a partir do contrato.

- *Histórico de Salários:*
  Registra um histórico dos salários de cada funcionário, permitindo consultar o salário a partir do cargo contratual.

- *Consulta de Licenças e Afastamentos:*
  Permite a liberação de funcionários que solicitarem licenças e afastamentos, com a opção de consultar o histórico.

- *Consulta de Endereço de Empresa e Funcionários:*
  Permite o cadastro de endereços para funcionários e empresas.

- *Controle de Contrato (Cargo e Férias):*
  Oferece acesso ao salário e agendamento de férias para cada funcionário.

### 3. Estrutura do Banco de Dados

#### 3.1 Tabelas

##### 3.1.1 Empresa
    sql
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome_empresa VARCHAR(50),
cnpj VARCHAR(50),
email VARCHAR(100)


##### 3.1.2 Contrato
    sql
idContrato INT PRIMARY KEY,
status TINYINT,
matricula VARCHAR(60),
data_de_inicio DATE,
data_de_encerramento DATE

##### 3.1.3 Cargo
    sql
idCargo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
salario DOUBLE


##### 3.1.4 Férias
    sql
idFerias INT PRIMARY KEY AUTO_INCREMENT,
data_de_inicio DATE,
data_de_encerramento DATE


##### 3.1.5 Endereço
    sql
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
cidade VARCHAR(50),
estado VARCHAR(50),
numero VARCHAR(50),
cep VARCHAR(50),
bairro VARCHAR(50),
rua VARCHAR(50)


##### 3.1.6 Dependente
    sql
idDependentes INT,
nome VARCHAR(50),
data_nascimento DATE


##### 3.1.7 Funcionário
    sql
idFuncionarios INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
data_nascimento DATE,
status TINYINT,
email VARCHAR(100)


##### 3.1.8 Licença/Afastamento
    sql
idLicenca INT PRIMARY KEY AUTO_INCREMENT,
tipo_licenca VARCHAR(45),
data_inicio DATE,
data_fim DATE


### 4. Visualização

(Adicione informações sobre o sistema)

### 5. Ferramentas Utilizadas

* JAVA
* Eclipse
* Visual Code
* MySQL
* GitHub
* GIT# funcionario-EMI2021
