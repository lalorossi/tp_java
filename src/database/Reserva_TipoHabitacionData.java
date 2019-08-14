package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import database.TipoHabitacionData;
import entities.Reserva;
import entities.Reserva_TipoHabitacion;

public class Reserva_TipoHabitacionData {

	public void Create(Reserva_TipoHabitacion rth) throws Exception {
		Statement stmt = null;
		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();

			stmt.executeUpdate("insert into reserva_tipo_habitacion (id_reserva, id_tipo_habitacion, cantidad) values ("
					+ rth.getIdReserva() + "," + rth.getIdTipoHabitacion() + "," + rth.getCantidad() + ")");

		} catch (Exception e) {
			System.out.println("Error al crear la RESERVA_TipoHabitacion en la DB");
			throw e;
		}
	}

}
