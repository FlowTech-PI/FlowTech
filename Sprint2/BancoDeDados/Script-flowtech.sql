-- Criação do Banco de Dados
CREATE DATABASE flowtech;
USE flowtech;
/*----------------------------------------------------------------------------------------------------------------------------------------*/

-- ENTIDADE EMPRESA

CREATE TABLE empresa
(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cnpj CHAR(14),
cep CHAR(8),
telefone CHAR(11),
email VARCHAR(45)
);

INSERT INTO empresa VALUES
	(DEFAULT, 'ViaQuatro', '07682638000107','09340520', '08007707100', 'comercial.mobilidade@grupoccr.com');

SELECT * FROM empresa;

/*----------------------------------------------------------------------------------------------------------------------------------------*/

-- ENTIDADE FUNCIONÁRIO

CREATE TABLE usuario
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
	REFERENCES usuario(idUsuario),
CONSTRAINT fkEmpresaFunc FOREIGN KEY (fkEmpresa)
	REFERENCES empresa(idEmpresa),
CONSTRAINT chkFuncao CHECK (funcao IN('Administrador', 'Gerente', 'Funcionário'))
);

INSERT INTO usuario VALUES
	(DEFAULT, 'Josival da Silva Santos', '1972-01-01', '25448868820', '11986457457', 'josival.santos@gmail.com', 'josival0101', 'Administrador', NULL, 1),
	(DEFAULT, 'Alberto Vicente Alves', '1980-04-22', '29033534843', '11985451260', 'alberto.alves@gmail.com', 'alberto@123', 'Gerente', 1, 1),
	(DEFAULT, 'Rafael Henrique Silva', '1990-02-20', '53589878841', '11959382646', 'rafael.silva@gmail.com', 'rafael227755', 'Funcionário',2, 1);
    
SELECT * FROM funcionario;
/*----------------------------------------------------------------------------------------------------------------------------------------*/

-- ENTIDADE LINHA

CREATE TABLE linha 
(
idLinha INT PRIMARY KEY,
nome VARCHAR(45),
fkEmpresa INT,
CONSTRAINT fkEmpresaLinha FOREIGN KEY (fkEmpresa)
	REFERENCES empresa(idEmpresa)
);

INSERT INTO linha VALUES
	(4, 'Amarela', 1);

SELECT * FROM linha;
/*----------------------------------------------------------------------------------------------------------------------------------------*/

-- ENTIDADE ESTAÇÃO

create table estacao
(
idEstacao INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkLinha INT,
CONSTRAINT fkLinhaEstacao FOREIGN KEY (fklinha)
	REFERENCES linha(idLinha)
);

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
/*----------------------------------------------------------------------------------------------------------------------------------------*/

-- ENTIDADE SENSOR

create table sensor
(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nomeLocal VARCHAR(30),
tipoSensor VARCHAR(40),
fkEstacao INT,
CONSTRAINT fkEstacaoSensor FOREIGN KEY (fkEstacao)
	REFERENCES estacao(idEstacao)
);

INSERT INTO sensor VALUES
	(DEFAULT, 'Esacada Rolante 1', 'Sensor de Bloqueio', 8),
	(DEFAULT, 'Passarela', 'Sensor de Bloqueio', 11),
	(DEFAULT, 'Catraca de Entrada', 'Sensor de Bloqueio', 2),
	(DEFAULT, 'Esacada rolante 2', 'Sensor de Bloqueio', 1);

SELECT * FROM sensor;
/*----------------------------------------------------------------------------------------------------------------------------------------*/

-- ENTIDADE DADO SENSOR -> PK COMPOSTA (idDadoSensor E fkSensor)

CREATE TABLE dadoSensor
(
idDado INT AUTO_INCREMENT,
fkSensor INT,
CONSTRAINT pkDadoSensor PRIMARY KEY (idDado, fkSensor),
contagem BIT,
horario DATETIME DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fkSensorDadoSensor FOREIGN KEY (fkSensor)
	REFERENCES sensor(idSensor)
);

INSERT INTO dadoSensor VALUES
	(DEFAULT, 2, 1, DEFAULT),
	(DEFAULT, 3, 0, '2024-04-14 06:00:00'),
	(DEFAULT, 4, 1, DEFAULT);

SELECT * FROM dadoSensor;
/*----------------------------------------------------------------------------------------------------------------------------------------*/
 
/*-------------------------------------------------------SELECTS COM JOINS ---------------------------------------------------------------*/
 
 -- Empresa e seus Funcionários
 
 SELECT empresa.nome AS Empresa,
        empresa.email AS 'Email - Empresa',
		usuario.nome AS Funcionário,
		usuario.email AS 'Email - Funcionário',
		usuario.funcao AS Função
        FROM empresa
			JOIN usuario ON idEmpresa = fkEmpresa;
            
-- Funcionários e seus Supervisores
            
SELECT usuario.nome AS Funcionário,
		usuario.email AS 'Email - Funcionário',
		usuario.funcao AS Função,
        ifnull(supervisor.nome, 'Usuário sem Supervisor') AS Supervisor,
        ifnull(supervisor.email, 'Usuário sem Supervisor') AS 'Email - Supervisor',
        ifnull(supervisor.funcao, 'Usuário sem Supervisor') AS 'Função - Supervisor'
		FROM usuario
			LEFT JOIN usuario AS supervisor ON usuario.fkAdmin = supervisor.idUsuario;
            
-- Empresa e suas Linhas
SELECT concat('A ', empresa.nome, ' administra a linha: ', linha.idLinha, ' - ', linha.nome) AS 'Proprietárias das Linhas'
		FROM linha 
			JOIN empresa ON fkEmpresa = idEmpresa;
            
-- Estações, suas Linhas e sua Empresa Proprietária
SELECT concat('A estação ', estacao.nome, ' pertence à linha ', linha.idLinha, ' - ', linha.nome, ', que é administrada pela ', empresa.nome) AS Estações
		FROM estacao 
			JOIN linha ON fkLinha = idLinha
			JOIN empresa ON fkEmpresa = idEmpresa;
            
-- Sensores insalados nas Estações
SELECT  sensor.nomeLocal AS 'Local de Instalação',
		sensor.tipoSensor AS 'Tipo de Sensor',
        estacao.nome AS Estação,
        concat(linha.idLinha, ' - ', linha.nome) AS Linha
		FROM sensor
			JOIN estacao ON fkEstacao = idEstacao
            JOIN linha ON fkLinha = idLinha;
            
-- Dados dos Sensores Onde Houve Fluxo (contagem = 1)
SELECT  sensor.nomeLocal AS 'Local de Instalação',
		sensor.tipoSensor AS 'Tipo de Sensor',
        estacao.nome AS Estação,
        concat(linha.idLinha, ' - ', linha.nome) AS Linha,
        date_format(dadoSensor.horario, '%d/%m/%Y') AS 'Data de Registro',
		date_format(dadoSensor.horario, '%H:%i:%s') AS 'Horário de Registro'
		FROM dadoSensor
			JOIN sensor ON fkSensor = idSensor
			JOIN estacao ON fkEstacao = idEstacao
            JOIN linha ON fkLinha = idLinha
            WHERE contagem = 1;
	