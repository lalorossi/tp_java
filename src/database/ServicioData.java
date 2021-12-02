package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.Servicio;

public class ServicioData {

	public ArrayList<Servicio> getFromReserva(int idReserva) throws Exception {
		ArrayList<Servicio> servs = new ArrayList<Servicio>();
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery(
					"select * from servicios where id_reserva = " + Integer.toString(idReserva) + ";");

			if (rs != null) {
				while (rs.next()) {
					Servicio srv = new Servicio();

					srv.setId(rs.getInt("id_servicio"));
					srv.setIdReserva(rs.getInt("id_reserva"));
					srv.setIdHabitacion(rs.getInt("id_habitacion"));
					srv.setIdTipoServicio(rs.getInt("id_tipo_servicio"));
					srv.setCantidad(rs.getInt("cantidad"));

					servs.add(srv);
				}
			}
		} catch (Exception e) {
			System.out.println("Error getFromReserva");
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

		return servs;
	}

}