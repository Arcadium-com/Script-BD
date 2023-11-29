DROP DATABASE IF EXISTS Arcadium;

CREATE DATABASE Arcadium;

USE Arcadium;

CREATE TABLE totem(
id INT PRIMARY KEY,
fksistemaoperacional INT, 
dtInstalacao DATE,
RAMtotal INT,
CPUtotal DOUBLE,
DISCOtotal INT,
hostname VARCHAR(45)
);

CREATE TABLE dados (
dt_hora DATETIME,
valorDisco DOUBLE,
valorMemoriaRAM DOUBLE,
valorCPU DOUBLE,
USB INT,
fktotem INT, CONSTRAINT fktot FOREIGN KEY (fktotem) REFERENCES totem(id),
PRIMARY KEY (dt_hora, fktotem)
);

CREATE TABLE alerta (
dtHoraAlerta DATETIME
fkTotem INT, CONSTRAINT fkTotemAlerta FOREIGN KEY (fkTotem) REFERENCES totem(id), 
PRIMARY KEY (dtHoraAlerta, fkTotem)
);