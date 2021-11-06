package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import entities.Habitacion;
import entities.Reserva;
import entities.TipoHabitacion;


public class HabitacionData {

	public int getCantidadPorTipo(int idTipo) throws Exception {
		Statement stmt = null;
		ResultSet rs = null;
		int cantidad = 0;

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery(
					"select count(*) as 'cantidad' from habitaciones where id_tipo_habitacion = '" + idTipo + "';");
			if (rs != null) {
				while (rs.next()) {
					cantidad = rs.getInt("cantidad");
				}
			}
		} catch (Exception e) {
			throw e;
		}

		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			FactoryConection.getInstancia().releaseConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return cantidad;
	}

	public ArrayList<Habitacion> getFromReserva(int idReserva) throws Exception {

		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Habitacion> habitaciones = new ArrayList<Habitacion>();

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select * from habitaciones where id_reserva = '" + idReserva+ "';");

			if (rs != null) {
				while (rs.next()) {
					Habitacion th = new Habitacion();

					th.setId(rs.getInt("id_habitacion"));
					th.setIdTipoHabitacion(rs.getInt("id_tipo_habitacion"));
					if(rs.getString("id_reserva") != "") {
						th.setIdReserva(rs.getInt("id_reserva"));
					}
					th.setNumero(rs.getInt("numero"));

					habitaciones.add(th);

				}
			}
		} catch (Exception e) {
			throw e;
		}

		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			FactoryConection.getInstancia().releaseConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return habitaciones;
	}

	public ArrayList<Habitacion> getDisponiblesPorTipo(int idTipoHabitacion) throws Exception {

		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Habitacion> habitaciones = new ArrayList<Habitacion>();

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select * from habitaciones where id_reserva IS NULL AND id_tipo_habitacion = '" + idTipoHabitacion + "';");

			if (rs != null) {
				while (rs.next()) {
					Habitacion th = new Habitacion();

					th.setId(rs.getInt("id_habitacion"));
					th.setIdTipoHabitacion(rs.getInt("id_tipo_habitacion"));
					if(rs.getString("id_reserva") != "") {
						th.setIdReserva(rs.getInt("id_reserva"));
					}
					th.setNumero(rs.getInt("numero"));

					habitaciones.add(th);

				}
			}
		} catch (Exception e) {
			throw e;
		}

		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			FactoryConection.getInstancia().releaseConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return habitaciones;
	}


	public void reservar(String idString, int idReserva) throws Exception {
		Statement stmt = null;
		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			String query = "UPDATE habitaciones SET id_reserva = '" + idReserva + "'";
			query += " WHERE (id_habitacion IN (" + idString + "))";

			stmt.executeUpdate(query);

		} catch (Exception e) {
			System.out.println("Error al iniciar la resrva" + idReserva);
			throw e;
		}
	}
}
