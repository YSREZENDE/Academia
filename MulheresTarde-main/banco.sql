
    DROP DATABASE IF EXISTS ACADEMIA1;

CREATE DATABASE ACADEMIA CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

USE ACADEMIA1;

CREATE TABLE ENDERECO (
CEP CHAR(9) PRIMARY KEY,
RUA VARCHAR(60) NOT NULL,
BAIRRO VARCHAR(40) NOT NULL,
CIDADE VARCHAR(40) NOT NULL,
UF CHAR(2) NOT NULL);

CREATE TABLE ALUNO (
MATRICULA INTEGER PRIMARY KEY,
NOME VARCHAR(60) NOT NULL,
TELEFONE VARCHAR(15) NOT NULL,
CPF CHAR(14) NOT NULL,
RG VARCHAR(15) NOT NULL,
DATANASCIMENTO DATE NOT NULL,
CEP CHAR(9) NOT NULL,
NUMEROCASA SMALLINT NOT NULL,
COMPLEMENTO VARCHAR(30),
FOTO VARCHAR(255),
FOREIGN KEY(CEP) REFERENCES ENDERECO(CEP));

CREATE TABLE FUNCIONARIO (
CPFFUNCIONARIO CHAR (14) PRIMARY KEY,
NOME VARCHAR(60) NOT NULL,
TELEFONE VARCHAR(15) NOT NULL,
RG VARCHAR(15) NOT NULL,
CEP CHAR(9) NOT NULL,
NUMEROCASA SMALLINT NOT NULL,
COMPLEMENTO VARCHAR(30),
FOTO VARCHAR(255),
FOREIGN KEY(CEP) REFERENCES ENDERECO(CEP));

CREATE TABLE PROFESSOR(
IDPROFESSOR INTEGER PRIMARY KEY,
DISPONIBILIDADE VARCHAR(40) NOT NULL,
CPFFUNCIONARIO CHAR(14) NOT NULL,
FOREIGN KEY(CPFFUNCIONARIO) REFERENCES FUNCIONARIO(CPFFUNCIONARIO));

CREATE TABLE ATIVIDADE(
IDATIVIDADE INTEGER PRIMARY KEY AUTO_INCREMENT,
NOMEATIVIDADE VARCHAR(60) NOT NULL,
DESCRICAO VARCHAR(100) NOT NULL);

CREATE TABLE HABILITAPROFESSOR(
IDHABILITACAO INTEGER PRIMARY KEY AUTO_INCREMENT,
IDATIVIDADE INTEGER NOT NULL,
IDPROFESSOR INTEGER NOT NULL,
FOREIGN KEY (IDATIVIDADE) REFERENCES ATIVIDADE (IDATIVIDADE),
FOREIGN KEY (IDPROFESSOR) REFERENCES PROFESSOR (IDPROFESSOR));

CREATE table atividade{
idatividade integer primarykey auto inerement,
nome atividade varchar(60)not NULL,
descrição varchar (100)not NULL,
descrição varchar (100)not NULL;

CREATE table habilitaprofessor{
idhabilitacao integer primary key auto_increment,
ihabilitacao integer not null,
idprofessor integer not null,
foreign key(idatividade) refrerences atividade(idatividade)
foreing key(idprofessor) references professor(idprofessor));

CREATE table aula{
idaula itegern primary key auto_increment,
dataaula date not null,
horario varchar(60)not null,
idprofessor integer not null,
idatividade integer not null,
foreign key(idprofessor)references professor(idprofessor),
foreign key(idatividade)references (idatividade));

CREATE table produto{
codigoproduto integer privacy key auto_increment,
nome varchar(60)not null,
cor varchar(30)not null,
valor double not null,
tamanho char(2)not null,
quantidade integer not null;

CREATE tabre venda{
idvenda integer primary key auto_increment,
data date not null,
valor double not null,
quantidade integer not null,
cpffuncionario char(14)not null,
foreign key(codigoproduto)references produto(codigoproduto),
foreign key(cpffuncionario) references funcionario(cpffuncionario);

                }
            }

        }
    }
    }