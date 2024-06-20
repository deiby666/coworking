CREATE SCHEMA coworking;

GRANT ALL PRIVILEGES ON SCHEMA coworking TO uaiohh7lfkwlhyhgjuto;


CREATE TABLE coworking.salas (
    id_Sala SERIAL PRIMARY KEY,
    nombre VARCHAR(40)
);

CREATE TABLE coworking.espacios (
    id_espacio SERIAL PRIMARY KEY,
    fila INT,
    columna INT,
    id_Sala INT
);


CREATE TABLE coworking.reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_espacio INT,
    id_usuario INT,
    id_sesion INT,
    fecha_reserva TIMESTAMP, 
    status VARCHAR(15)
);

CREATE TABLE coworking.sesion (
    id_sesion SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    hora_inicio VARCHAR(10),
    hora_final VARCHAR(10)
);


CREATE TABLE coworking.usuarios (
    id_usuario SERIAL PRIMARY KEY ,
    nombre VARCHAR(40)
);

-- drop table coworking.salas

-- drop table coworking.usuarios

-- drop table coworking.espacios

-- drop table coworking.reservas

-- drop table coworking.sesion


ALTER TABLE coworking.espacios ADD FOREIGN KEY(id_sala) REFERENCES coworking.salas(id_sala)

ALTER TABLE coworking.reservas ADD FOREIGN KEY(id_espacio) REFERENCES coworking.espacios(id_espacio)

ALTER TABLE coworking.reservas ADD FOREIGN KEY(id_usuario) REFERENCES coworking.usuarios(id_usuario)

ALTER TABLE coworking.reservas ADD FOREIGN KEY(id_sesion) REFERENCES coworking.sesion(id_sesion)

