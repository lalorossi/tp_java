package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import entities.TipoHabitacion;

public class TipoHabitacionData {

	public TipoHabitacion getOne(int id_tipo) throws Exception{

		Statement stmt=null;
		ResultSet rs=null;
		TipoHabitacion th = new TipoHabitacion();

		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();
			rs = stmt.executeQuery("select * from tipo_habitacion where id_tipo_habitacion = '" + id_tipo + "'");
			if(rs!=null){
				while(rs.next()){
					th.setId(rs.getInt("id_tipo_habitacion"));
					th.setTipoHabitacion(TipoHabitacion.tipo.valueOf(rs.getString("tipo_habitacion")));
					th.setCapacidad(rs.getInt("capacidad"));
					th.setDescripcion(rs.getString("descripcion"));
					th.setPrecio(rs.getInt("precio"));
				}
			}
		} catch (Exception e){
			throw e;
		}

		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			FactoryConection.getInstancia().releaseConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return th;
	}


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
