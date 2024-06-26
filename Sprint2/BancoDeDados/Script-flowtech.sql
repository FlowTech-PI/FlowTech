-- Criação do Banco de Dados
-- DROP DATABASE flowtech;
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
	(DEFAULT, 'ViaQuatro', '07682489000107','04390250', '08007775000', 'comercial.mobilidade@grupoccr.com');

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
    
SELECT * FROM usuario;
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
	(DEFAULT, 'Esacada Rolante 1', 'Sensor de Bloqueio', 1),
	(DEFAULT, 'Esacada Rolante 2', 'Sensor de Bloqueio', 1),
	(DEFAULT, 'Esacada Rolante 3', 'Sensor de Bloqueio', 1),
	(DEFAULT, 'Passarela 1', 'Sensor de Bloqueio', 1),
	(DEFAULT, 'Passarela 2', 'Sensor de Bloqueio', 1),
	(DEFAULT, 'Catraca de Entrada', 'Sensor de Bloqueio', 1),
	(DEFAULT, 'Esacada Rolante 1', 'Sensor de Bloqueio', 2),
	(DEFAULT, 'Esacada Rolante 2', 'Sensor de Bloqueio', 2),
	(DEFAULT, 'Esacada Rolante 3', 'Sensor de Bloqueio', 2),
	(DEFAULT, 'Passarela 1', 'Sensor de Bloqueio', 2),
	(DEFAULT, 'Passarela 2', 'Sensor de Bloqueio', 2),
	(DEFAULT, 'Catraca de Entrada', 'Sensor de Bloqueio', 2),
	(DEFAULT, 'Esacada Rolante 1', 'Sensor de Bloqueio', 3),
	(DEFAULT, 'Esacada Rolante 2', 'Sensor de Bloqueio', 3),
	(DEFAULT, 'Esacada Rolante 3', 'Sensor de Bloqueio', 3),
	(DEFAULT, 'Passarela 1', 'Sensor de Bloqueio', 3),
	(DEFAULT, 'Passarela 2', 'Sensor de Bloqueio', 3),
	(DEFAULT, 'Catraca de Entrada', 'Sensor de Bloqueio', 3),
	(DEFAULT, 'Esacada Rolante 1', 'Sensor de Bloqueio', 4),
	(DEFAULT, 'Esacada Rolante 2', 'Sensor de Bloqueio', 4),
	(DEFAULT, 'Esacada Rolante 3', 'Sensor de Bloqueio', 4),
	(DEFAULT, 'Passarela 1', 'Sensor de Bloqueio', 4),
	(DEFAULT, 'Passarela 2', 'Sensor de Bloqueio', 4),
	(DEFAULT, 'Catraca de Entrada', 'Sensor de Bloqueio', 4),
	(DEFAULT, 'Esacada Rolante 1', 'Sensor de Bloqueio', 5),
	(DEFAULT, 'Esacada Rolante 2', 'Sensor de Bloqueio', 5),
	(DEFAULT, 'Esacada Rolante 3', 'Sensor de Bloqueio', 5),
	(DEFAULT, 'Passarela 1', 'Sensor de Bloqueio', 5),
	(DEFAULT, 'Passarela 2', 'Sensor de Bloqueio', 5),
	(DEFAULT, 'Catraca de Entrada', 'Sensor de Bloqueio', 5),
	(DEFAULT, 'Esacada Rolante 1', 'Sensor de Bloqueio', 6),
	(DEFAULT, 'Esacada Rolante 2', 'Sensor de Bloqueio', 6),
	(DEFAULT, 'Esacada Rolante 3', 'Sensor de Bloqueio', 6),
	(DEFAULT, 'Passarela 1', 'Sensor de Bloqueio', 6),
	(DEFAULT, 'Passarela 2', 'Sensor de Bloqueio', 6),
	(DEFAULT, 'Catraca de Entrada', 'Sensor de Bloqueio', 6);

INSERT INTO sensor VALUES
	(DEFAULT, 'Esacada Rolante 1', 'Sensor de Bloqueio', 7),
	(DEFAULT, 'Esacada Rolante 2', 'Sensor de Bloqueio', 7),
	(DEFAULT, 'Esacada Rolante 3', 'Sensor de Bloqueio', 7),
	(DEFAULT, 'Passarela 1', 'Sensor de Bloqueio', 7),
	(DEFAULT, 'Passarela 2', 'Sensor de Bloqueio', 7),
	(DEFAULT, 'Catraca de Entrada', 'Sensor de Bloqueio', 7),
	(DEFAULT, 'Esacada Rolante 1', 'Sensor de Bloqueio', 8),
	(DEFAULT, 'Esacada Rolante 2', 'Sensor de Bloqueio', 8),
	(DEFAULT, 'Esacada Rolante 3', 'Sensor de Bloqueio', 8),
	(DEFAULT, 'Passarela 1', 'Sensor de Bloqueio', 8),
	(DEFAULT, 'Passarela 2', 'Sensor de Bloqueio', 8),
	(DEFAULT, 'Catraca de Entrada', 'Sensor de Bloqueio', 8),
	(DEFAULT, 'Esacada Rolante 1', 'Sensor de Bloqueio', 9),
	(DEFAULT, 'Esacada Rolante 2', 'Sensor de Bloqueio', 9),
	(DEFAULT, 'Esacada Rolante 3', 'Sensor de Bloqueio', 9),
	(DEFAULT, 'Passarela 1', 'Sensor de Bloqueio', 9),
	(DEFAULT, 'Passarela 2', 'Sensor de Bloqueio', 9),
	(DEFAULT, 'Catraca de Entrada', 'Sensor de Bloqueio', 9),
	(DEFAULT, 'Esacada Rolante 1', 'Sensor de Bloqueio', 10),
	(DEFAULT, 'Esacada Rolante 2', 'Sensor de Bloqueio', 10),
	(DEFAULT, 'Esacada Rolante 3', 'Sensor de Bloqueio', 10),
	(DEFAULT, 'Passarela 1', 'Sensor de Bloqueio', 10),
	(DEFAULT, 'Passarela 2', 'Sensor de Bloqueio', 10),
	(DEFAULT, 'Catraca de Entrada', 'Sensor de Bloqueio', 10),
	(DEFAULT, 'Esacada Rolante 1', 'Sensor de Bloqueio', 11),
	(DEFAULT, 'Esacada Rolante 2', 'Sensor de Bloqueio', 11),
	(DEFAULT, 'Esacada Rolante 3', 'Sensor de Bloqueio', 11),
	(DEFAULT, 'Passarela 1', 'Sensor de Bloqueio', 11),
	(DEFAULT, 'Passarela 2', 'Sensor de Bloqueio', 11),
	(DEFAULT, 'Catraca de Entrada', 'Sensor de Bloqueio', 11);

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
		(default,  1, 0, '2024-06-07 5:00:00'),
		(default,  7, 0, '2024-06-07 5:00:00'),
		(default, 13, 0, '2024-06-07 5:00:00'),
		(default, 19, 0, '2024-06-07 5:00:00'),
		(default, 25, 0, '2024-06-07 5:00:00'),
		(default, 31, 0, '2024-06-07 5:00:00'),
		(default, 37, 0, '2024-06-07 5:00:00'),
		(default, 43, 0, '2024-06-07 5:00:00'),
		(default, 49, 0, '2024-06-07 5:00:00'),
		(default, 55, 0, '2024-06-07 5:00:00'),
		(default, 61, 0, '2024-06-07 5:00:00'),
        (default,  1, 0, '2024-06-06 5:00:00'),
		(default,  7, 0, '2024-06-06 5:00:00'),
		(default, 13, 0, '2024-06-06 5:00:00'),
		(default, 19, 0, '2024-06-06 5:00:00'),
		(default, 25, 0, '2024-06-06 5:00:00'),
		(default, 31, 0, '2024-06-06 5:00:00'),
		(default, 37, 0, '2024-06-06 5:00:00'),
		(default, 43, 0, '2024-06-06 5:00:00'),
		(default, 49, 0, '2024-06-06 5:00:00'),
		(default, 55, 0, '2024-06-06 5:00:00'),
		(default, 61, 0, '2024-06-06 5:00:00'),
		(default,  1, 0, '2024-06-05 5:00:00'),
		(default,  7, 0, '2024-06-05 5:00:00'),
		(default, 13, 0, '2024-06-05 5:00:00'),
		(default, 19, 0, '2024-06-05 5:00:00'),
		(default, 25, 0, '2024-06-05 5:00:00'),
		(default, 31, 0, '2024-06-05 5:00:00'),
		(default, 37, 0, '2024-06-05 5:00:00'),
		(default, 43, 0, '2024-06-05 5:00:00'),
		(default, 49, 0, '2024-06-05 5:00:00'),
		(default, 55, 0, '2024-06-05 5:00:00'),
		(default, 61, 0, '2024-06-05 5:00:00'),
		(default,  1, 0, '2024-06-04 5:00:00'),
		(default,  7, 0, '2024-06-04 5:00:00'),
		(default, 13, 0, '2024-06-04 5:00:00'),
		(default, 19, 0, '2024-06-04 5:00:00'),
		(default, 25, 0, '2024-06-04 5:00:00'),
		(default, 31, 0, '2024-06-04 5:00:00'),
		(default, 37, 0, '2024-06-04 5:00:00'),
		(default, 43, 0, '2024-06-04 5:00:00'),
		(default, 49, 0, '2024-06-04 5:00:00'),
		(default, 55, 0, '2024-06-04 5:00:00'),
		(default, 61, 0, '2024-06-04 5:00:00'),
		(default,  1, 0, '2024-06-03 5:00:00'),
		(default,  7, 0, '2024-06-03 5:00:00'),
		(default, 13, 0, '2024-06-03 5:00:00'),
		(default, 19, 0, '2024-06-03 5:00:00'),
		(default, 25, 0, '2024-06-03 5:00:00'),
		(default, 31, 0, '2024-06-03 5:00:00'),
		(default, 37, 0, '2024-06-03 5:00:00'),
		(default, 43, 0, '2024-06-03 5:00:00'),
		(default, 49, 0, '2024-06-03 5:00:00'),
		(default, 55, 0, '2024-06-03 5:00:00'),
		(default, 61, 0, '2024-06-03 5:00:00'),
		(default,  1, 0, '2024-06-02 5:00:00'),
		(default,  7, 0, '2024-06-02 5:00:00'),
		(default, 13, 0, '2024-06-02 5:00:00'),
		(default, 19, 0, '2024-06-02 5:00:00'),
		(default, 25, 0, '2024-06-02 5:00:00'),
		(default, 31, 0, '2024-06-02 5:00:00'),
		(default, 37, 0, '2024-06-02 5:00:00'),
		(default, 43, 0, '2024-06-02 5:00:00'),
		(default, 49, 0, '2024-06-02 5:00:00'),
		(default, 55, 0, '2024-06-02 5:00:00'),
		(default, 61, 0, '2024-06-02 5:00:00'),
		(default,  1, 0, '2024-06-01 5:00:00'),
		(default,  7, 0, '2024-06-01 5:00:00'),
		(default, 13, 0, '2024-06-01 5:00:00'),
		(default, 19, 0, '2024-06-01 5:00:00'),
		(default, 25, 0, '2024-06-01 5:00:00'),
		(default, 31, 0, '2024-06-01 5:00:00'),
		(default, 37, 0, '2024-06-01 5:00:00'),
		(default, 43, 0, '2024-06-01 5:00:00'),
		(default, 49, 0, '2024-06-01 5:00:00'),
		(default, 55, 0, '2024-06-01 5:00:00'),
		(default, 61, 0, '2024-06-01 5:00:00');
    
SELECT * FROM dadoSensor;
/*----------------------------------------------------------------------------------------------------------------------------------------*/
 
/*-------------------------------------------------------SELECTS COM JOINS ---------------------------------------------------------------*/
 
 -- Empresa e seus Funcionários
CREATE VIEW viewFuncEmpresa AS ( 
	SELECT empresa.nome AS Empresa,
        empresa.email AS 'Email - Empresa',
		usuario.nome AS Funcionário,
		usuario.email AS 'Email - Funcionário',
		usuario.funcao AS Função
        FROM empresa
			JOIN usuario ON idEmpresa = fkEmpresa);
            
-- Funcionários e seus Supervisores
CREATE VIEW viewFuncSupervisor AS (
	SELECT usuario.nome AS Funcionário,
		usuario.email AS 'Email - Funcionário',
		usuario.funcao AS Função,
        ifnull(supervisor.nome, 'Usuário sem Supervisor') AS Supervisor,
        ifnull(supervisor.email, 'Usuário sem Supervisor') AS 'Email - Supervisor',
        ifnull(supervisor.funcao, 'Usuário sem Supervisor') AS 'Função - Supervisor'
		FROM usuario
			LEFT JOIN usuario AS supervisor ON usuario.fkAdmin = supervisor.idUsuario);
            
-- Empresa e suas Linhas
CREATE VIEW viewEmpresaLinha AS (
	SELECT concat('A ', empresa.nome, ' administra a linha: ', linha.idLinha, ' - ', linha.nome) AS 'Proprietárias das Linhas'
		FROM linha 
			JOIN empresa ON fkEmpresa = idEmpresa);
            
-- Estações, suas Linhas e sua Empresa Proprietária
CREATE VIEW viewEstacaoLinha AS (
	SELECT concat('A estação ', estacao.nome, ' pertence à linha ', linha.idLinha, ' - ', linha.nome, ', que é administrada pela ', empresa.nome) AS Estações
		FROM estacao 
			JOIN linha ON fkLinha = idLinha
			JOIN empresa ON fkEmpresa = idEmpresa);
            
-- Sensores insalados nas Estações
CREATE VIEW viewSensorEstacao AS (
	SELECT  sensor.nomeLocal AS 'Local de Instalação',
		sensor.tipoSensor AS 'Tipo de Sensor',
        estacao.nome AS Estação,
        concat(linha.idLinha, ' - ', linha.nome) AS Linha
		FROM sensor
			JOIN estacao ON fkEstacao = idEstacao
            JOIN linha ON fkLinha = idLinha);
            
-- Dados dos Sensores Onde Houve Fluxo (contagem = 1)
CREATE VIEW viewdadoSensor1 AS (
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
            WHERE contagem = 1);
	
/* Soma a quantidade de pessoas de cada sensor */
CREATE VIEW viewFluxoSensor1 AS (SELECT COUNT(contagem) AS 'Fluxo de Pessoas do Sensor 1' FROM dadoSensor WHERE contagem = 1);
CREATE VIEW viewFluxoSensor2 AS (SELECT COUNT(contagem) * 2 AS 'Fluxo de Pessoas do Sensor 2' FROM dadoSensor WHERE contagem = 1);
CREATE VIEW viewFluxoSensor3 AS (SELECT COUNT(contagem) * 3 AS 'Fluxo de Pessoas do Sensor 3' FROM dadoSensor WHERE contagem = 1);	

-- VIEWS

-- EMPRESAS E SEUS FUNCIONÁRIOS
SELECT * FROM viewFuncEmpresa;

-- FUNCIONÁRIOS E SEUS SUPERVISORES
SELECT * FROM viewFuncSupervisor;

-- EMPRESAS E SUAS LINHAS
SELECT * FROM viewEmpresaLinha;

-- ESTAÇÕES E SUAS LINHAS
SELECT * FROM viewEstacaoLinha;

-- SENSORES E SUAS ESTAÇÕES
SELECT * FROM viewSensorEstacao;

-- DADOS DO SENSOR 1
SELECT * FROM viewdadoSensor1;

-- FLUXO DE PESSAOS DO SENSOR 1
SELECT * FROM viewFluxoSensor1;

-- FLUXO DE PESSAOS DO SENSOR 2
SELECT * FROM viewFluxoSensor2;

-- FLUXO DE PESSAOS DO SENSOR 3
SELECT * FROM viewFluxoSensor3;

-- SELECT TESTE PARA A DASHBOARD
SELECT * FROM dadoSensor;

-- MÉDIA POR HORA DOS ÚLTIMOS 1 MÊS    

SELECT * FROM dadoSensor
	WHERE horario BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE();

SELECT sum(contagem) as contagem FROM dadoSensor ;

	SELECT (sum(contagem)) as FluxoHora, date_format(horario, '%a') as dia 
		FROM dadoSensor 
		WHERE horario BETWEEN DATE_SUB(CURDATE(), INTERVAL 2 MONTH) AND CURDATE()
		GROUP BY dia ORDER BY FIELD(dia, 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');
    

        
	SELECT (sum(contagem)) as FluxoHora 
		FROM dadoSensor 
		WHERE horario BETWEEN DATE_SUB(CURDATE(), INTERVAL 2 MONTH) AND CURDATE()
		GROUP BY date_format(horario, '%a') ORDER BY FIELD((date_format(horario, '%a')), 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');
        
	SELECT FluxoHora FROM (SELECT (sum(contagem)) as FluxoHora, date_format(horario, '%a') as dia 
		FROM dadoSensor 
		WHERE horario BETWEEN DATE_SUB(CURDATE(), INTERVAL 2 MONTH) AND CURDATE()
		GROUP BY dia ORDER BY FIELD(dia, 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat')) as subQuerry;
        
	SELECT * FROM usuario;
    
-- ////// --
    
SELECT estacao.nome AS Estação,
	sum(contagem) AS Contagem 
    FROM dadoSensor 
	right join sensor ON fkSensor = idSensor
    left join estacao on fkEstacao = idEstacao
    WHERE horario BETWEEN DATE_SUB(CURDATE(), INTERVAL 2 MONTH) AND CURDATE()
    GROUP BY idSensor;
    
    
-- OBRIGADO MURILLO !!!!!!!!!!!!!!!!!!!!!!! <3 ¨¨\_(`u´)_/¨¨ 
    
SELECT estacao.nome, nomeLocal, ifnull(sum(contagem), 0) from dadoSensor
	right join sensor on fkSensor = idSensor
    join estacao on fkEstacao = idEstacao
    group by idSensor;
    
SELECT sum(contagem) as fluxoPorSensor FROM dadoSensor 
	right JOIN sensor ON fkSensor = idSensor
    right join estacao on fkEstacao = idEstacao
    WHERE horario BETWEEN DATE_SUB(CURDATE(), INTERVAL 2 MONTH) AND CURDATE() 
    GROUP BY idSensor, fkEstacao;
    
SELECT sum(contagem) as FluxoHora, date_format(horario, '%H') as hora FROM dadoSensor
	GROUP BY hora
    ORDER BY hora;

SELECT FluxoHora FROM (SELECT sum(contagem) as FluxoHora, date_format(horario, '%H') as hora FROM dadoSensor
	GROUP BY hora
    ORDER BY hora) as subquerry;

DESCRIBE estacao;
DESCRIBE sensor;
SELECT * FROM sensor;
SELECT * FROM dadoSensor;

/*
INSERT INTO sensor VALUES
	(default, 'Escada Rolante', 'Sensor de Bloqueio', 3),
	(default, 'Passarela', 'Sensor de Bloqueio', 3),
	(default, 'Elevador', 'Sensor de Bloqueio', 3),
	(default, 'Catraca de Entrada', 'Sensor de Bloqueio', 3);
    */
    
    SELECT * FROM sensor;
    describe dadoSensor;
        
INSERT INTO dadoSensor VALUES 
	(default, 20, 0, default);
    
SELECT fluxoHora FROM  (SELECT estacao.nome, nomeLocal, ifnull(sum(contagem), 0) as fluxoHora from dadoSensor
	right join sensor on fkSensor = idSensor
    join estacao on fkEstacao = idEstacao
    group by idSensor) AS b;

SELECT ifnull(sum(contagem), 0), date_format(horario, '%a') as dia , estacao.nome
        FROM dadoSensor
        RIGHT JOIN sensor ON fkSensor = idSensor
        JOIN estacao ON idEstacao = fkEstacao
        WHERE horario BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
        GROUP BY dia, estacao.idEstacao ORDER BY idEstacao DESC, FIELD(dia, 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat') ;
        

SELECT * FROM usuario;

UPDATE usuario SET senha = 'Cmi22afael#A2775#T' WHERE idUsuario = 3;
SELECT ifnull(sum(contagem), 0) as fluxoDiaSemana, date_format(horario, '%a') as dia , estacao.nome
        FROM dadoSensor
        RIGHT JOIN sensor ON fkSensor = idSensor
        JOIN estacao ON idEstacao = fkEstacao
        WHERE horario BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
        GROUP BY dia, estacao.idEstacao ORDER BY idEstacao DESC, FIELD(dia, 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');
	
SELECT ifnull(sum(contagem), 0) as fluxoDiaSemana, date_format(horario, '%a') as dia , estacao.nome
        FROM dadoSensor
        RIGHT JOIN sensor ON fkSensor = idSensor
        JOIN estacao ON idEstacao = fkEstacao
        WHERE horario BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
        GROUP BY dia, estacao.idEstacao ORDER BY idEstacao DESC, FIELD(dia, 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');

-- ------------------------------------ CRIANDO AS VIEWS ---------------------------------------------------- --

CREATE VIEW plotar1 AS SELECT fluxoDiaSemana FROM (SELECT ifnull(sum(contagem), 0) as fluxoDiaSemana, date_format(horario, '%a') as dia , estacao.nome
        FROM dadoSensor
        RIGHT JOIN sensor ON fkSensor = idSensor
        JOIN estacao ON idEstacao = fkEstacao
        WHERE horario BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
        GROUP BY dia, estacao.idEstacao ORDER BY idEstacao DESC, FIELD(dia, 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat')) as subQuerry;

SELECT * FROM plotar1;

CREATE VIEW plotar2 AS SELECT fluxoPorSensor FROM  (SELECT estacao.nome, nomeLocal, ifnull(sum(contagem), 0) as fluxoPorSensor from dadoSensor
	right join sensor on fkSensor = idSensor
    join estacao on fkEstacao = idEstacao
    group by idSensor ORDER BY idEstacao DESC, nomeLocal) AS querry2;
SELECT * FROM plotar2;

    SELECT FluxoHora FROM (SELECT ifnull(sum(contagem), 0) as FluxoHora, date_format(horario, '%a') as dia , estacao.nome
        FROM dadoSensor
        RIGHT JOIN sensor ON fkSensor = idSensor
        JOIN estacao ON idEstacao = fkEstacao
        WHERE horario BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
        GROUP BY dia, estacao.idEstacao ORDER BY idEstacao DESC, FIELD(dia, 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat')) as subQuerry;

SELECT * FROM estacao ORDER BY idEstacao DESC;

SELECT ifnull(sum(contagem), 0) as fluxoPorHora, date_format(horario, '%H') as dia , estacao.nome
        FROM dadoSensor
        RIGHT JOIN sensor ON fkSensor = idSensor
        JOIN estacao ON idEstacao = fkEstacao
        WHERE horario BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
        GROUP BY dia, estacao.idEstacao ORDER BY idEstacao DESC, FIELD(dia, '4', '0');

SELECT fluxoPorHora FROM (SELECT ifnull(sum(contagem), 0) as fluxoPorHora, date_format(horario, '%H') as dia , estacao.nome
        FROM dadoSensor
        RIGHT JOIN sensor ON fkSensor = idSensor
        JOIN estacao ON idEstacao = fkEstacao
        WHERE horario BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
        GROUP BY dia, estacao.idEstacao ORDER BY idEstacao DESC, FIELD(dia, '4', '0')) as querry3;