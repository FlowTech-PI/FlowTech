CREATE DATABASE flowtech;
USE flowtech;

-- Criação das tabelas 

CREATE TABLE empresa
(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cnpj CHAR(14),
cep CHAR(8),
telefone CHAR(11),
email VARCHAR(45)
);

CREATE TABLE funcionario
(
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
dtNasc DATE,
cpf CHAR(11),
telefone CHAR(11),
email VARCHAR(45),
senha VARCHAR(20),
funcao VARCHAR(45),
fkAdmin INT,
fkEmpresa INT,
CONSTRAINT fkAdminFunc FOREIGN KEY (fkAdmin)
	REFERENCES funcionario(idUsuario),
CONSTRAINT fkEmpresaFunc FOREIGN KEY (fkEmpresa)
	REFERENCES empresa(idEmpresa),
CONSTRAINT chkFuncao CHECK (funcao IN('Administrador', 'Gerente', 'Funcionário'))
);

CREATE TABLE linha 
(
idLinha INT PRIMARY KEY,
nome VARCHAR(45),
fkEmpresa INT,
CONSTRAINT fkEmpresaLinha FOREIGN KEY (fkEmpresa)
	REFERENCES empresa(idEmpresa)
);

create table estacao
(
idEstacao INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkLinha INT,
CONSTRAINT fkLinhaEstacao FOREIGN KEY (fklinha)
	REFERENCES linha(idLinha)
);

create table sensor
(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nomeLocal VARCHAR(30),
tipoSensor VARCHAR(40),
fkEstacao INT,
CONSTRAINT fkEstacaoSensor FOREIGN KEY (fkEstacao)
	REFERENCES estacao(idEstacao)
);

CREATE TABLE dadoSensor
(
idDado INT PRIMARY KEY AUTO_INCREMENT,
contagem BIT,
horario DATETIME DEFAULT CURRENT_TIMESTAMP,
fkSensor INT,
CONSTRAINT fkSensorDadoSensor FOREIGN KEY (fkSensor)
	REFERENCES sensor(idSensor)
);

-- Inserção de Dados 

INSERT INTO empresa VALUES
	(DEFAULT, 'ViaQuatro', '07682638000107','09340520', '08007707100', 'comercial.mobilidade@grupoccr.com');

SELECT * FROM empresa;

INSERT INTO funcionario VALUES
	(DEFAULT,  'Josival da Silva Santos', '1972-01-01', '25448868820', '11986457457', 'josival.santos@gmail.com', 'josival0101', 'Administrador', null, 1),
	(DEFAULT,  'Alberto Vicente Alves', '1980-04-22', '29033534843', '11985451260', 'alberto.alves@gmail.com', 'alberto@123', 'Gerente', 1, 1),
	(DEFAULT,  'Rafael Henrique Silva', '1990-02-20', '53589878841', '11959382646', 'rafael.silva@gmail.com', 'rafael227755', 'Funcionário',2, 1);
SELECT * FROM funcionario;

INSERT INTO linha VALUES
	(4, 'Amarela', 1);

SELECT * FROM linha;

INSERT INTO estacao VALUES
	(DEFAULT, 'Vila Sônia', 4),
	(DEFAULT, 'São Paulo - Morumbi', 4),
	(DEFAULT, 'Butantã', 4),
	(DEFAULT, 'Pinheiros', 4),
	(DEFAULT, 'Faria Lima', 4),
	(DEFAULT, 'Fradique Coutinho', 4),
	(DEFAULT, 'Oscar Freire', 4),
	(DEFAULT, 'Paulista - Pernambucanas', 4),
	(DEFAULT, 'Higienópolis - Mackenzie', 4),
	(DEFAULT, 'República', 4),
	(DEFAULT, 'Luz', 4);

SELECT * FROM estacao;

INSERT INTO sensor VALUES
	(DEFAULT, 'esacada rolante 1', 'Sensor de bloqueio', 8),
	(DEFAULT, 'Passarela', 'Sensor de bloqueio', 11),
	(DEFAULT, 'Catraca de entrada', 'Sensor de bloqueio', 2),
	(DEFAULT, 'esacada rolante 2', 'Sensor de bloqueio', 1);

SELECT * FROM sensor;

INSERT INTO dadoSensor VALUES
	(DEFAULT, 1, DEFAULT, 2),
	(DEFAULT, 0, '2024-04-14 06:00:00', 3),
	(DEFAULT, 1, DEFAULT, 4);

SELECT * FROM dadoSensor;
