package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import entities.Reserva;
import entities.TipoHabitacion;

public class TipoHabitacionData {

	public ArrayList<TipoHabitacion> getAll() throws Exception {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<TipoHabitacion> tipoHabitaciones = new ArrayList<TipoHabitacion>();

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select * from tipo_habitacion");
			if (rs != null) {
				while (rs.next()) {
					TipoHabitacion th = new TipoHabitacion();

					th.setId(rs.getInt("id_tipo_habitacion"));
					th.setDescripcion(rs.getString("descripcion"));
					th.setPrecio(rs.getInt("precio"));
					th.setTipoHabitacion(TipoHabitacion.tipo.valueOf(rs.getString("tipo_habitacion")));
					th.setCapacidad(rs.getInt("capacidad"));

					tipoHabitaciones.add(th);

				}
			}
		} catch (Exception e) {
			System.out.println("Error getAll TipoHabitacion");
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

		return tipoHabitaciones;
	}


}
