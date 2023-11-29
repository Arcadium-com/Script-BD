DROP DATABASE IF EXISTS Arcadium;

CREATE DATABASE Arcadium;

USE Arcadium;

CREATE TABLE Estado(
    id INT PRIMARY KEY IDENTITY(1,1),
    sigla CHAR(2) NOT NULL
);

CREATE TABLE Empresa (
  id INT IDENTITY(1,1 ) PRIMARY KEY,
  nomeResposavel VARCHAR (60) NOT NULL,
  nomeFantasia VARCHAR (60) NOT NULL,
  cnpj CHAR (14) NOT NULL,
  tel CHAR (14) NOT NULL,
  cep CHAR(10),
  tipoLogradouro VARCHAR(100),
  logradouro VARCHAR (200) NOT NULL,
  numero VARCHAR (5) NOT NULL,
  complemento VARCHAR (20),
  bairro VARCHAR (200),
  cidade VARCHAR (200) NOT NULL,
  fkEstado INT,
  FOREIGN KEY (fkEstado) REFERENCES Estado(id)
  );
  
  CREATE TABLE Permissao(
    id INT PRIMARY KEY IDENTITY(1,1),
    autoridade VARCHAR(100)
);

CREATE TABLE Usuario (
  id INT PRIMARY KEY IDENTITY(1,1),
  email VARCHAR (60) NOT NULL,
  senha VARCHAR (60) NOT NULL,
  fkPermissao INT,
  fkEmpresa INT,
  FOREIGN KEY (fkPermissao) REFERENCES Permissao(id),
  FOREIGN KEY (fkEmpresa) REFERENCES Empresa(id)
);

CREATE TABLE statusTotem (
id INT PRIMARY KEY IDENTITY(1,1),
statusTotem VARCHAR(20), 
CHECK (statusTotem = 'ativo' OR statusTotem = 'inativo'));

CREATE TABLE Indicadores (
id INT PRIMARY KEY IDENTITY(1,1),
LimiteCPU decimal(5,2),
LimiteRAM decimal(5,2),
LimiteDisco decimal(5,2),
IndicadorUSB int
);

CREATE TABLE sistemaOperacional (
id INT PRIMARY KEY IDENTITY(1,1),
distribuicao VARCHAR(20) NOT NULL,
versionamento VARCHAR(20) NOT NULL
);

CREATE TABLE totem (
id INT PRIMARY KEY IDENTITY(1,1),
fkstatus INT, 
FOREIGN KEY (fkstatus) REFERENCES statusTotem(id),
fkEmpresa INT, 
FOREIGN KEY (fkEmpresa) REFERENCES Empresa(id),
fksistemaoperacional INT, 
FOREIGN KEY (fksistemaoperacional) REFERENCES sistemaOperacional(id),
dtInstalacao DATE,
RAMtotal INT,
CPUtotal DECIMAL(5,2),
DISCOtotal INT,
hostname VARCHAR(45),
);

CREATE TABLE dados (
dt_hora DATETIME ,
valorDisco DECIMAL(5,2),
valorMemoriaRAM DECIMAL(5,2),
valorCPU DECIMAL (5,2),
USB INT,
fktotem INT,
PRIMARY KEY (dt_hora, fktotem),
FOREIGN KEY (fktotem) REFERENCES totem(id)
);