
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

	quantidade integer not null,
	codigoproduto integer not null,
	cpffuncionario char(14)not null,
	foreign key(codigoproduto)references produto(codigoproduto),
	foreign key(cpffuncionario)references funcionario(cpffuncionario));
	
	
/**continuação**/
insert into endereco(cep,rua,bairro,cidade,uf)VALUES
('23085-610','Rua Padre Pauwels','Campo Grande','Rio de Janeiro','RJ'),
('26551-090','Travessa Elpidio','Cruzeiro do Sul','Mesquita','RJ');

1
insert into aluno(nome,telefone,rg,cpf,datanascimento,cep,numerocasa,complemento,foto,sexo)VALUES
('Maria','(21)99886-1055','12555','123456893-10','2001-08-01','23085-610',31,'ap 102','feminino','vazio'),
('Pedro','(21)99999-1055','00012','123456789-10','1997-10-20','26551-090',100,'fundos','masculino','vazio');
	
insert into funcionario(cpffuncionario,nome,telefone,rg,cep,numerocasa,complemento,foto,sexo)VALUES
('123','Mário Silva','(21)9999-8888','0001','23085-610',40,'ap 202','masculino','vazio'),
('456','Gabriel Silva','(21)9999-7777','0002','26551-090',100,'casa','masculino','vazio'),
('789','Mariana Souza','(21)9999-5555','1234','23085-610',1820,'casa','feminino','vazio');

insert into professor(disponibilidade,cpffuncionario)VALUES
('segunda e sexta dia todo','123'),
('terca,quarta e quinta dia todo','456');

insert into atividade(nomeatividade,descricao)VALUES
('jumpp','atividade realizada pulando em um trampolim'),
('spinning','atividade realizada em uma bicicleta com subidas');

insert into habilitaprofessor(idatividade,idprofessor)VALUES
(1,1),(2,1),(2,2);

insert into aula(dataaula,horario,idprofessor,idatividade)VALUES
('2022-12-05','de 15:00 às 15:30h',1,1),
('2022-12-09','de 08:00 às 9:00h',1,2),
('2022-12-06','de 07:00 às 08:00h',2,2);

insert into aulaaluno(matricula,idaula)VALUES
(1,1),(1,2),(2,3);

insert into produto(nome,cor,valor,tamanho,quantidade)VALUES
('mochila Paloma','rosa',150,'un',20),
('mochila Raissa','azul',120,'un',30);

insert into venda(data,valor,quantidade,codigoproduto,cpffuncionario)VALUES
('2022-12-05',300,2,1,'789'),
('2022-12-05',120,1,2,'789');


PESQUISAS NAS TABELAS

1) Pesquisar todas as colunas com todos os registros.

select * from aluno;

2) Pesquisar nome e telefone de todos os alunos.

select nome,telefone from aluno;

3) Pesquisar nome e telefone dos alunos que moram em apartamentos.

select nome,telefone from aluno 
where
complemento like '%ap%'; 

4) Pesquisar nome e preço de todos os produtos com estoque maior ou igual a
 30 unidades.
 
 select nome,valor from produto where quantidade >= 30;

5) Pesquisar qual a soma do valor dos produtos em estoque.(soma dos valores).

select sum(valor) from produto;

6)Verificar qual o valor total de mercadorias em estoque.

select sum(valor*quantidade) from produto;

/*Nomeando pesquisas / colunas */

select sum(valor*quantidade) as 'Total do Estoque' from produto;

7) Pesquisar as informações das aulas executadas entre os dias
06/12/2022 a 10/12/2022.

select * from aula WHERE
dataaula >= '2022-12-06' AND
dataaula <= '2022-12-10';

select * from aula WHERE
dataaula BETWEEN '2022-12-06' and '2022-12-10';

8)Pesquisar as informações das aulas executadas nos dias 
06/12/2022 e 10/12/2022.

select * from aula where
dataaula in ('2022-12-06','2022-12-10');

9)Pesquisar o nome, telefone e cpf  de todas as alunas que o nome comece com a letra m.

select nome,telefone,cpf from aluno
WHERE
nome like 'm%';

10)Alterar a tabela de alunos para inserir o sobrenome nos alunos
de matrícula 1 e 2.

update aluno
set nome = 'Maria Silva dos Santos'
where matricula = 1;

update aluno
set nome = 'Pedro Melo de Souza'
where matricula = 2;

11)Pesquisar o nome e telefone dos alunos que o último sobrenome é
Souza.

select nome,telefone from aluno
where 
nome like '%Souza';

/*avg = média*/
select avg (valor) from produto;
13) Pesquisar o produto com o menor preço em estoque.

select min(valor) from produto;
14) Pesquisar oproduto com maior valor em estoque.

select max(valor) from produto;

15)Pesquisar nome do aluno, telefone, rua, numero da casa e bairro.

select aluno.nome, aluno.telefone,endereco.rua,aluno.numero,endereco.bairro
from aluno inner join enderecoon endereco.cep = aluno.cep;

/*dando um apelido a tabela*/

select a.nome, a.telefone, e.rua, a.numerocasa, e.bairro
from aluno a inner join endereco e 
on e.cep = a.cep;

16)Pesquisar nome da atividade, data da aula e horário de todas as aulas do mês de dezembro 2022

select ati.nomeatividade,a.dataaula,a.horario
from atividade ati inner join aula a
on ati.idatividade=ati.idatividade
and a.dataaula BETWEEN '2022-12-01' and '2022-12-11'

17)Pesquisar nome telefone de todos os professores

select f.nome,f.telefone 
from funcionario f inner join professor p
on f.cpffuncionario = f.cpffuncionario;

18) Pesquisar o nome funcionario e valor das vendas de todos os funcionarios que fizeram venda no mes de dezembro

select f.nome,v.valor
from funcionario f inner join venda v
on f.cpffuncionario = v.cpffuncionario
and v.data BETWEEN '2022-12-01' and '2022-12-31';

19) Pesquisar nome da atividade, nome dos alunos, data da aula e horario de todas as aula do mes de dezembro
select ati.nomeatividade,a.dataaula,a.horario,alu.nome
from atividade ati  inner join aula a
on ati.idatividade = a.idatividade
inner join aulaaluno aa
on a.idaula = aa.idaula 
inner join aluno alu
on alu.matricula = aa.matricula
and a.dataaula between '2022-12-01' and '2022-12-31';

/*Nomeando pesquisas / colunas */

20)pesquisando nome e telefone de todos os personais que tiverem aula no dia 10/12/2022
select f.nome,f.telefone
from  funcionario f inner join professor
on cpffuncionario = cpffuncionario
inner join idatividade

and dataaula in ('10/12/2022');

21)pesquisar nome e telefone de todos os professores que podem dar aulas de spinning
select f.nome,f.telefone, ati.nomeatividade, idatividade
from atividade ati inner join aula a
on ati.atividade = f.atividade;

22)mostrar ototal de vendas do dia 05/12/22



select ati.nomeatividade,a.dataaula,a.horario
from atividade ati inner join aula a
on ati.idatividade=ati.idatividade
and a.dataaula in '2022-12-11'

                }
            }

        }
    }
    }