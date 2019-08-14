package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import entities.Admin;
import entities.Cliente;
import entities.Reserva;
import entities.TipoHabitacion;
import entities.Usuario;
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
					"select * from reservas where ((fecha_fin between '" + fechaDesde + "' and '" + fechaHasta
							+ "') or (fecha_fin between '" + fechaDesde + "' and '" + fechaHasta
							+ "')) and ( estado = 1 or  estado =3);");
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

	public int cantOcupadosXTH(ArrayList<Reserva> reservas, int idTH) {
		int cantOcupados = 0;

		Statement stmt = null;
		ResultSet rs = null;

		Reserva rsv = new Reserva();

		for (int i = 0; i < reservas.size(); i++) {
			rsv = reservas.get(i);
			try {
				stmt = FactoryConection.getInstancia().getConn().createStatement();
				rs = stmt.executeQuery("select cantidad from reserva_tipo_habitacion where id_reserva = '" + rsv.getId()
						+ "' and id_tipo_habitacion = '" + idTH + "';");
				if (rs != null) {
					while (rs.next()) {
						cantOcupados = cantOcupados + rs.getInt("cantidad");

					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.printf("Error en cantOcupadosXTH, ReservaData");
				e.printStackTrace();
			} catch (AppDataException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return cantOcupados;
	}

	public int Create(Reserva rsv) throws Exception {
		Statement stmt = null;
		ResultSet rs = null;
		int idReserva = 0;

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");

			stmt.executeUpdate(
					"insert into reservas (id_cliente, fecha_inicio, fecha_fin, estado, fecha_creacion) values ('"
							+ rsv.getIdCliente() + "','" + formatter1.format(rsv.getFechaInicio()) + "','"
							+ formatter1.format(rsv.getFechaFin()) + "','" + Reserva.estado.valueOf("espera") + "','"
							+ formatter1.format(rsv.getFechaCreacion()) + "');",
					Statement.RETURN_GENERATED_KEYS);

			rs = stmt.getGeneratedKeys();

			if (rs != null) {
				while (rs.next()) {
					idReserva = rs.getInt(1);
				}
			}

		} catch (Exception e) {
			System.out.println("Error al crear la RESERVA en la DB");
			throw e;
		}

		return idReserva;
	}
}
