CREATE TABLE salas (
    id_Sala SERIAL PRIMARY KEY,
    nombre VARCHAR(40),
    filas INT,
    columnas INT
);

CREATE TABLE espacios (
    id_espacio SERIAL PRIMARY KEY ,
    fila INT,
    columna INT,
    id_Sala INT
);


CREATE TABLE reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_espacio INT,
    id_usuario INT,
    fecha_reserva TIMESTAMP
);

CREATE TABLE sesion (
    id_sesion SERIAL PRIMARY KEY,
    hora_inicio VARCHAR(10),
    hora_final VARCHAR(10),
    id_reserva INT
);


CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY ,
    nombre VARCHAR(40)
);

DROP table sesion 

ALTER TABLE espacios ADD FOREIGN KEY(id_sala) REFERENCES salas(id_sala)

ALTER TABLE reservas ADD FOREIGN KEY(id_espacio) REFERENCES espacios(id_espacio)

ALTER TABLE reservas ADD FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario)

ALTER TABLE sesion ADD FOREIGN KEY(id_reserva) REFERENCES reservas(id_reserva)


