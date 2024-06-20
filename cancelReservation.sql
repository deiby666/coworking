UPDATE coworking.reservas
SET status = 'cancelled'
WHERE id_reserva = 1  /* id de la reserva que se quiere actualizar*/
  AND id_usuario = 1   /* usuario que quiere cancelar la reserva*/
  AND status = 'confirmed';

SELECT * FROM coworking.reservas WHERE id_reserva = 1