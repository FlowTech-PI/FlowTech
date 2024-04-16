create database flowtech;
use flowtech;

-- Criação das tabelas 

create table empresa
(
idEmpresa int primary key auto_increment,
nome varchar(45),
cnpj char(14),
cep char(8),
telefone char(11),
email varchar(45)
);

create table funcionario
(
idUsuario int primary key auto_increment,
nome varchar(100),
dtNasc date,
cpf char(11),
telefone char(11),
email varchar(45),
senha varchar(20),
funcao varchar(45),
fkAdmin int,
fkEmpresa int,
constraint fkAdminFunc foreign key (fkAdmin)
references funcionario (idUsuario),
constraint fkEmpresaFunc foreign key (fkEmpresa)
references empresa (idEmpresa) 
);
alter table funcionario add constraint chkfuncao check (funcao in('Administrador', 'Gerente', 'Funcionário'));

create table linha 
(
idLinha int primary key,
nome varchar(45),
fkEmpresa int,
constraint fkEmpresaLinha foreign key (fkEmpresa)
references empresa (idEmpresa)
);

create table estacao
(
idEstacao int primary key auto_increment,
nome varchar(45),
fkLinha int,
constraint fkLinhaEstacao foreign key (fklinha)
references linha (idLinha)
);

create table sensor
(
idSensor int primary key auto_increment,
nomeLocal varchar(30),
tipoSensor varchar(40),
fkEstacao int,
constraint fkEstacaoSensor foreign key (fkEstacao)
references estacao(idEstacao)
);

create table dadoSensor
(
idDado int primary key auto_increment,
contagem bit,
horario datetime default current_timestamp,
fkSensor int,
constraint fkSensorDadoSensor foreign key (fkSensor)
references sensor(idSensor)
);

-- Inserção de Dados 

insert into empresa values
(default, 'ViaQuatro', '07682638000107','09340520', '08007707100', 'comercial.mobilidade@grupoccr.com');
select * from empresa;
insert into funcionario values
(default,  'Josival da Silva Santos', '1972-01-01', '25448868820', '11986457457', 'josival.santos@gmail.com', 'josival0101', 'Administrador', null, 1),
(default,  'Alberto Vicente Alves', '1980-04-22', '29033534843', '11985451260', 'alberto.alves@gmail.com', 'alberto@123', 'Gerente', 1, 1),
(default,  'Rafael Henrique Silva', '1990-02-20', '53589878841', '11959382646', 'rafael.silva@gmail.com', 'rafael227755', 'Funcionário',2, 1);
select * from funcionario;

insert into linha values 
(4, 'Amarela', 1);
select * from linha;

insert into estacao values
(default, 'Vila Sônia', 4),
(default, 'São Paulo - Morumbi', 4),
(default, 'Butantã', 4),
(default, 'Pinheiros', 4),
(default, 'Faria Lima', 4),
(default, 'Fradique Coutinho', 4),
(default, 'Oscar Freire', 4),
(default, 'Paulista - Pernambucanas', 4),
(default, 'Higienópolis - Mackenzie', 4),
(default, 'República', 4),
(default, 'Luz', 4);
select * from estacao;

insert into sensor values
(default, 'esacada rolante 1', 'Sensor de bloqueio', 8),
(default, 'Passarela', 'Sensor de bloqueio', 11),
(default, 'Catraca de entrada', 'Sensor de bloqueio', 2),
(default, 'esacada rolante 2', 'Sensor de bloqueio', 1);
select * from sensor;

insert into dadoSensor values
(default, 1, default, 2),
(default, 0, '2024-04-14 06:00:00', 3),
(default, 1, default, 4);
select * from dadoSensor;
