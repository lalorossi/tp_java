package database;

import java.sql.Statement;


public class Reserva_TipoHabitacionData {

	public void Create(int idReserva, int idTipoHabitacion, int cantidadReservada) throws Exception {
		Statement stmt = null;
		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			String query = "insert into reserva_tipo_habitacion (id_reserva, id_tipo_habitacion, cantidad) values ("
					+ idReserva + "," + idTipoHabitacion + "," + cantidadReservada + ")";
			System.out.println("Se va a ejecutar la query: " + query);
			stmt.executeUpdate(query);

		} catch (Exception e) {
			System.out.println("Error al crear la Reserva_TipoHabitacion en la DB");
			throw e;
		}
	}

}
