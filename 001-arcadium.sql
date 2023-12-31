DROP DATABASE IF EXISTS Arcadium;

CREATE DATABASE Arcadium;

USE Arcadium;

CREATE TABLE totem(
id INT PRIMARY KEY,
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
dtHoraAlerta DATETIME,
dtHoraConclusaoAlerta DATETIME,
fkTotem INT, CONSTRAINT fkTotemAlerta FOREIGN KEY (fkTotem) REFERENCES totem(id), 
PRIMARY KEY (dtHoraAlerta, fkTotem)
);

CREATE TABLE alertaSlack(
id INT AUTO_INCREMENT,
horaAlertaSlack TIME,
fkTotem INT, CONSTRAINT fkTotemSlack FOREIGN KEY (fkTotem) REFERENCES totem(id),
PRIMARY KEY(id, horaAlertaSlack, fkTotem)
);
