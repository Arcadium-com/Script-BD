DROP DATABASE IF EXISTS Arcadium;

CREATE DATABASE Arcadium;

USE Arcadium;

CREATE TABLE totem(
id INT PRIMARY KEY,
dtInstalacao DATE,
RAMtotal INT,
CPUtotal DOUBLE,
DISCOtotal INT,
enderecoMAC VARCHAR(45)
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
