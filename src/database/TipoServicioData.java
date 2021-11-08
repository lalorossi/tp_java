package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.Tarjeta;
import entities.TipoHabitacion;
import entities.TipoServicio;
import entities.Usuario;

public class TipoServicioData {

	public ArrayList<TipoServicio> getAll() throws Exception{
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<TipoServicio> tipoServicios = new ArrayList<TipoServicio>();

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select * from tipo_servicio");
			if (rs != null) {
				while (rs.next()) {
					TipoServicio ts = new TipoServicio();

					ts.setId(rs.getInt("id_tipo_servicio"));
					ts.setNombre(rs.getString("nombre_servicio"));
					ts.setPrecio(rs.getFloat("precio"));

					tipoServicios.add(ts);

				}
			}
		} catch (Exception e) {
			System.out.println("Error getAll tipo_servicio");
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

		return tipoServicios;
	}
}
