-- Insert 100 salas into the coworking schema
DO $$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO coworking.salas (nombre) VALUES ('Sala ' || i);
    END LOOP;
END $$;

-- Insert 100 espacios, each associated with a unique sala in the coworking schema
DO $$
DECLARE
    id_sala2 INT;
BEGIN
    FOR i IN 1..100 LOOP
        SELECT id_sala INTO id_sala2 FROM coworking.salas WHERE nombre = 'Sala ' || i;
        INSERT INTO coworking.espacios (fila, columna, id_sala) VALUES (i, i, id_sala2);
    END LOOP;
END $$;

-- Insert 100 usuarios into the coworking schema
DO $$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO coworking.usuarios (nombre) VALUES ('Usuario ' || i);
    END LOOP;
END $$;

-- Insert 100 sesiones into the coworking schema
DO $$
BEGIN
    FOR i IN 1..100 LOOP
        INSERT INTO coworking.sesion (nombre, hora_inicio, hora_final) VALUES ('Sesion ' || i, '08:00', '10:00');
    END LOOP;
END $$;

-- Insert 100 reservas, each with unique combinations in the coworking schema
DO $$
DECLARE
    id_espacio2 INT;
    id_usuario2 INT;
    id_sesion2 INT;
BEGIN
    FOR i IN 1..100 LOOP
        SELECT id_espacio INTO id_espacio2 FROM coworking.espacios WHERE fila = i AND columna = i;
        SELECT id_usuario INTO id_usuario2 FROM coworking.usuarios WHERE nombre = 'Usuario ' || i;
        SELECT id_sesion INTO id_sesion2 FROM coworking.sesion WHERE nombre = 'Sesion ' || i;
        INSERT INTO coworking.reservas (id_espacio, id_usuario, id_sesion, fecha_reserva, status) VALUES (id_espacio2, id_usuario2, id_sesion2, NOW(), 'confirmed');
    END LOOP;
END $$;

-- SELECT * from coworking.usuarios

-- SELECT * from coworking.espacios

-- SELECT * from coworking.reservas

