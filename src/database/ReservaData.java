package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import entities.Reserva;
import entities.TipoHabitacion;
import logic.Reserva_TipoHabitacionLogic;
import logic.TipoHabitacionLogic;
import util.AppDataException;

public class ReservaData {

	public ArrayList<Reserva> ocupadosEntre(Date desde, Date hasta) throws Exception {
		ArrayList<Reserva> ocupados = new ArrayList<Reserva>();
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String fechaDesde = formatter.format(desde);
			String fechaHasta = formatter.format(hasta);
			rs = stmt.executeQuery(
					"select * from reservas where (('" + fechaDesde + "' between fecha_inicio and  fecha_fin) or ('"
							+ fechaHasta + "' between fecha_inicio and  fecha_fin) or ( (fecha_inicio between '"
							+ fechaDesde + "' and '" + fechaHasta + "') and (fecha_fin between '" + fechaDesde
							+ "' and '" + fechaHasta + "') ) ) and ( estado = 1 or  estado = 3);");

			if (rs != null) {
				while (rs.next()) {
					Reserva rsv = new Reserva();

					rsv.setId(rs.getInt("id_reserva"));
					rsv.setIdCliente(rs.getInt("id_cliente"));
					rsv.setFechaInicio(rs.getDate("fecha_inicio"));
					rsv.setFechaFin(rs.getDate("fecha_fin"));
					rsv.setEstadoActual(Reserva.estado.valueOf(rs.getString("estado")));
					rsv.setFechaCreacion(rs.getDate("fecha_creacion"));

					ocupados.add(rsv);
				}
			}
		} catch (Exception e) {
			System.out.println("Error ocupadosEntre Reserva");
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

		return ocupados;
	}

	public int habitacionesOcupadasPorTipo(ArrayList<Reserva> reservas, int idTH) {
		int cantOcupados = 0;

		Statement stmt = null;
		ResultSet rs = null;

		String idReservas = "(";
		for(int i = 0; i < reservas.size(); i++) {
			idReservas += String.valueOf(reservas.get(i).getId());
			if(i != reservas.size()-1)
				idReservas += ", ";
		}
		idReservas += ")";

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select cantidad from reserva_tipo_habitacion where id_reserva in " + idReservas
					+ " and id_tipo_habitacion = '" + idTH + "';");

			if (rs != null) {
				while (rs.next()) {
					cantOcupados = cantOcupados + rs.getInt("cantidad");

				}
			}
		} catch (SQLException e) {
			System.out.printf("Error en cantOcupadosXTH, ReservaData");
			e.printStackTrace();
		} catch (AppDataException e) {
			e.printStackTrace();
		}


		return cantOcupados;
	}

	public int Create(Reserva reserva) throws Exception {
		Statement stmt = null;
		ResultSet rs = null;
		int idReserva = 0;

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");

			stmt.executeUpdate(
					"insert into reservas (id_cliente, fecha_inicio, fecha_fin, estado, fecha_creacion) values ('"
							+ reserva.getIdCliente() + "','" + formatter1.format(reserva.getFechaInicio()) + "','"
							+ formatter1.format(reserva.getFechaFin()) + "','" + Reserva.estado.valueOf("espera") + "','"
							+ formatter1.format(reserva.getFechaCreacion()) + "');",
					Statement.RETURN_GENERATED_KEYS);

			rs = stmt.getGeneratedKeys();

			if (rs != null) {
				while (rs.next()) {
					idReserva = rs.getInt(1);
					Reserva_TipoHabitacionLogic rthLogic = new Reserva_TipoHabitacionLogic();
					for(int i = 0; i < reserva.getHabitacionesReservadas().size(); i++) {
						int idTipoHabitacion = reserva.getHabitacionesReservadas().get(i).getId();
						int cantidadReservada = reserva.getHabitacionesReservadas().get(i).getCantidadReservada();
						rthLogic.Create(idReserva, idTipoHabitacion, cantidadReservada);
					}
				}
			}

		} catch (Exception e) {
			System.out.println("Error al crear la RESERVA en la DB");
			throw e;
		}

		return idReserva;
	}

	public void cancelarReservar(int idReserva) throws Exception {
		Statement stmt = null;
		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();

			stmt.executeUpdate("UPDATE reservas SET estado = '2' WHERE (id_reserva = '" + idReserva + "');");

		} catch (Exception e) {
			System.out.println("Error al cancelar la resrva" + idReserva);
			throw e;
		}
	}

	public ArrayList<Reserva> getAllxUsr(int idUsuario) throws Exception {
		ArrayList<Reserva> reservas = new ArrayList<Reserva>();
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet rsTH = null;

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select * from reservas where id_cliente = '" + idUsuario + "';");

			if (rs != null) {
				while (rs.next()) {
					Reserva rsv = new Reserva();
					ArrayList<TipoHabitacion> tipoHabitaciones = new ArrayList<TipoHabitacion>();

					rsv.setId(rs.getInt("id_reserva"));
					rsv.setIdCliente(rs.getInt("id_cliente"));
					rsv.setFechaInicio(rs.getDate("fecha_inicio"));
					rsv.setFechaFin(rs.getDate("fecha_fin"));
					rsv.setEstadoActual(Reserva.estado.valueOf(rs.getString("estado")));
					rsv.setFechaCreacion(rs.getDate("fecha_creacion"));


					reservas.add(this.getCantidadesReservadas(rsv));

				}
			}
		} catch (Exception e) {
			System.out.println("Error al buscar las reservasr del usuario " + idUsuario);
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

		return reservas;
	}

	public ArrayList<Reserva> getAll() throws Exception {
		ArrayList<Reserva> reservas = new ArrayList<Reserva>();
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet rsTH = null;

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select * from reservas");

			if (rs != null) {
				while (rs.next()) {
					Reserva rsv = new Reserva();
					ArrayList<TipoHabitacion> tipoHabitaciones = new ArrayList<TipoHabitacion>();

					rsv.setId(rs.getInt("id_reserva"));
					rsv.setIdCliente(rs.getInt("id_cliente"));
					rsv.setFechaInicio(rs.getDate("fecha_inicio"));
					rsv.setFechaFin(rs.getDate("fecha_fin"));
					rsv.setEstadoActual(Reserva.estado.valueOf(rs.getString("estado")));
					rsv.setFechaCreacion(rs.getDate("fecha_creacion"));


					reservas.add(this.getCantidadesReservadas(rsv));

				}
			}
		} catch (Exception e) {
			System.out.println("Error al buscar todas las reservas");
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

		return reservas;
	}

public Reserva getCantidadesReservadas(Reserva reserva) throws Exception {
	Statement stmt = null;
	ResultSet rs = null;
		stmt = FactoryConection.getInstancia().getConn().createStatement();
		rs = stmt.executeQuery("select * from reserva_tipo_habitacion rsvTH inner join tipo_habitacion th on th.id_tipo_habitacion = rsvTH.id_tipo_habitacion where id_reserva = '"
				+ reserva.getId() + "';");

		if (rs != null) {
			while (rs.next()) {
				TipoHabitacion th = new TipoHabitacionLogic().getOne(rs.getInt("id_tipo_habitacion"));

				th.setCantidadReservada(rs.getInt("cantidad"));
				reserva.getHabitacionesReservadas().add(th);

			}
		}


	return reserva;
}

}