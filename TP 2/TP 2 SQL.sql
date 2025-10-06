USE club_nautico;


DROP TABLE IF EXISTS Salidas;
DROP TABLE IF EXISTS Barcos;
DROP TABLE IF EXISTS Socios;

CREATE TABLE Socios (
    id_Socio INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255)
);

CREATE TABLE Barcos (
    matricula VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100),
    numero_amarre INT,
    cuota DECIMAL(10,2),
    id_socio INT,
    FOREIGN KEY (id_socio) REFERENCES Socios(id_socio)
);

CREATE TABLE Salidas (
    id_Salida INT PRIMARY KEY,
    matricula VARCHAR(20),
    fecha_salida DATE,
    hora_salida TIME,
    destino VARCHAR(100),
    patron_nombre VARCHAR(100),
    patron_direccion VARCHAR(255),
    FOREIGN KEY (matricula) REFERENCES Barcos(matricula)
);
