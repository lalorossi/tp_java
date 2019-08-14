package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class HabitacionData {

	public int getCantHabitacionPorIDTipo(int idTipo) throws Exception {
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

}
