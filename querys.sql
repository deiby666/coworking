/*View the list of available workspaces for a room in a
session x.*/
SELECT * from coworking.reservas

SELECT * from coworking.sesion

SELECT e.id_espacio, e.fila, e.columna, s.id_sesion, s.nombre
FROM coworking.espacios e
LEFT JOIN coworking.reservas r ON e.id_espacio = r.id_espacio
LEFT JOIN coworking.sesion s ON r.id_sesion = s.id_sesion
WHERE r.id_sesion = 1
  AND (r.id_reserva IS NULL OR r.status = 'cancelled'); 

/*View the list of occupied workspaces for a room in a
session x.*/

SELECT e.id_espacio, e.fila, e.columna, s.id_sesion, s.nombre
FROM coworking.espacios e
LEFT JOIN coworking.reservas r ON e.id_espacio = r.id_espacio
LEFT JOIN coworking.sesion s ON r.id_sesion = s.id_sesion
WHERE r.id_sesion = 50 
  AND (r.status = 'confirmed'); 


/*View the sessions in order of the busiest.*/
SELECT s.id_sesion, s.nombre, s.hora_inicio, s.hora_final,
       COUNT(r.id_reserva) AS total_persons
FROM coworking.sesion s
LEFT JOIN coworking.reservas r ON s.id_sesion = r.id_sesion AND r.status = 'confirmed'
GROUP BY s.id_sesion, s.nombre, s.hora_inicio, s.hora_final
ORDER BY total_persons DESC;


/*View the sessions in order by the most available.*/

SELECT s.id_sesion, s.nombre, s.hora_inicio, s.hora_final,
       COUNT(e.id_espacio) AS num_espacios_disponibles
FROM coworking.sesion s
LEFT JOIN coworking.reservas r ON s.id_sesion = r.id_sesion AND r.status = 'confirmed'
LEFT JOIN coworking.espacios e ON r.id_espacio = e.id_espacio
GROUP BY s.id_sesion, s.nombre, s.hora_inicio, s.hora_final
ORDER BY num_espacios_disponibles DESC;


/*View the list of workspaces assigned to a user.*/

SELECT u.id_usuario, u.nombre, e.id_espacio, e.fila, e.columna
FROM coworking.usuarios u
JOIN coworking.reservas r ON u.id_usuario = r.id_usuario
JOIN coworking.espacios e ON r.id_espacio = e.id_espacio
WHERE u.id_usuario = 50;

/*View the list of workspaces assigned to a session.*/

SELECT s.id_sesion, s.nombre, e.id_espacio, e.fila, e.columna
FROM coworking.sesion s
JOIN coworking.reservas r ON s.id_sesion = r.id_sesion
JOIN coworking.espacios e ON r.id_espacio = e.id_espacio
WHERE s.id_sesion = 60;

