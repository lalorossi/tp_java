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
					rsv.setFechaInicio(formatter.parse(rs.getString("fecha_inicio")));
					rsv.setFechaFin(formatter.parse(rs.getString("fecha_fin")));
					rsv.setEstadoActual(Reserva.estado.valueOf(rs.getString("estado")));
					rsv.setFechaCreacion(formatter.parse(rs.getString("fecha_creacion")));

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

	public ArrayList<Reserva> activasEntre(Date desde, Date hasta) throws Exception {
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
							+ "' and '" + fechaHasta + "') ) ) and ( estado = 1);");

			if (rs != null) {
				while (rs.next()) {
					Reserva rsv = new Reserva();

					rsv.setId(rs.getInt("id_reserva"));
					rsv.setIdCliente(rs.getInt("id_cliente"));
					rsv.setFechaInicio(formatter.parse(rs.getString("fecha_inicio")));
					rsv.setFechaFin(formatter.parse(rs.getString("fecha_fin")));
					rsv.setEstadoActual(Reserva.estado.valueOf(rs.getString("estado")));
					rsv.setFechaCreacion(formatter.parse(rs.getString("fecha_creacion")));

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
					"insert into reservas (id_cliente, fecha_inicio, fecha_fin, estado, fecha_creacion, precio_base) values ('"
							+ reserva.getIdCliente() + "','" + formatter1.format(reserva.getFechaInicio()) + "','"
							+ formatter1.format(reserva.getFechaFin()) + "','" + Reserva.estado.valueOf("espera") + "','"
							+ formatter1.format(reserva.getFechaCreacion()) + "', "
							+ String.valueOf(reserva.getPrecioBase()) + ");",
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

			stmt.executeUpdate("UPDATE reservas SET estado = '" + Reserva.estado.cancelada + "' WHERE (id_reserva = '" + idReserva + "');");

		} catch (Exception e) {
			System.out.println("Error al cancelar la resrva" + idReserva);
			throw e;
		}
	}

	public void retener(int idReserva) throws Exception {
		Statement stmt = null;
		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();

			stmt.executeUpdate("UPDATE reservas SET retenida = 1 WHERE (id_reserva = '" + idReserva + "');");

		} catch (Exception e) {
			System.out.println("Error al cancelar la resrva" + idReserva);
			throw e;
		}
	}

	public void checkIn(int idReserva, boolean retenida) throws Exception {
		Statement stmt = null;
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String fechaIngreso = formatter.format(new Date(System.currentTimeMillis()));
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			String query = "UPDATE reservas SET estado = '" + Reserva.estado.activa + "'";
			if(retenida) {
				query+= ", fecha_ingreso_real = '" + fechaIngreso + "'";
			}
			query += " WHERE (id_reserva = '" + idReserva + "')";

			stmt.executeUpdate(query);

		} catch (Exception e) {
			System.out.println("Error al iniciar la resrva" + idReserva);
			throw e;
		}
	}

	public void checkOut(int idReserva) throws Exception {
		Statement stmt = null;
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String fechaSalidaReal = formatter.format(new Date(System.currentTimeMillis()));
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			String query = "UPDATE reservas SET estado = '" + Reserva.estado.terminada + "', fecha_salida_real = '" + fechaSalidaReal + "'";
			query += " WHERE (id_reserva = '" + idReserva + "')";

			stmt.executeUpdate(query);

		} catch (Exception e) {
			System.out.println("Error al terminar la resrva" + idReserva);
			throw e;
		}
	}

	public ArrayList<Reserva> getAllxUsr(int idUsuario) throws Exception {
		ArrayList<Reserva> reservas = new ArrayList<Reserva>();
		Statement stmt = null;
		ResultSet rs = null;

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select * from reservas where id_cliente = '" + idUsuario + "';");
			System.out.println("select * from reservas where id_cliente = '" + idUsuario + "';");

			if (rs != null) {
				while (rs.next()) {
					Reserva rsv = new Reserva();

					rsv.setId(rs.getInt("id_reserva"));
					rsv.setIdCliente(rs.getInt("id_cliente"));
					rsv.setFechaInicio(formatter.parse(rs.getString("fecha_inicio")));
					rsv.setFechaFin(formatter.parse(rs.getString("fecha_fin")));
					rsv.setEstadoActual(Reserva.estado.valueOf(rs.getString("estado")));
					rsv.setFechaCreacion(formatter.parse(rs.getString("fecha_creacion")));
					Date fechaIngresoReal = rs.getDate("fecha_ingreso_real");
					Date fechaSalidaReal = rs.getDate("fecha_salida_real");
					if(fechaIngresoReal != null) {
						rsv.setFechaIngresoReal(formatter.parse(rs.getString("fecha_ingreso_real")));
					}
					if(fechaSalidaReal != null) {
						rsv.setFechaSalidaReal(formatter.parse(rs.getString("fecha_salida_real")));
					}
					rsv.setRetenida(rs.getBoolean("retenida"));
					rsv.setPrecioBase(rs.getFloat("precio_base"));
					rsv.setPrecioFinal(rs.getFloat("precio_final"));


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
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("select * from reservas");

			if (rs != null) {
				while (rs.next()) {
					Reserva rsv = new Reserva();
					ArrayList<TipoHabitacion> tipoHabitaciones = new ArrayList<TipoHabitacion>();


					System.out.println(rs.getInt("id_reserva"));
					System.out.println(formatter.parse(rs.getString("fecha_inicio")));
					System.out.println(rs.getString("fecha_inicio"));
					System.out.println(formatter.parse(rs.getString("fecha_inicio")));
					System.out.println("-----------");
					rsv.setId(rs.getInt("id_reserva"));
					rsv.setIdCliente(rs.getInt("id_cliente"));
					rsv.setFechaInicio(formatter.parse(rs.getString("fecha_inicio")));
					rsv.setFechaFin(formatter.parse(rs.getString("fecha_fin")));
					rsv.setEstadoActual(Reserva.estado.valueOf(rs.getString("estado")));
					rsv.setFechaCreacion(formatter.parse(rs.getString("fecha_creacion")));
					Date fechaIngresoReal = rs.getDate("fecha_ingreso_real");
					Date fechaSalidaReal = rs.getDate("fecha_salida_real");
					if(fechaIngresoReal != null) {
						rsv.setFechaIngresoReal(formatter.parse(rs.getString("fecha_ingreso_real")));
					}
					if(fechaSalidaReal != null) {
						rsv.setFechaSalidaReal(formatter.parse(rs.getString("fecha_salida_real")));
					}
					rsv.setRetenida(rs.getBoolean("retenida"));
					rsv.setPrecioBase(rs.getFloat("precio_base"));
					rsv.setPrecioFinal(rs.getFloat("precio_final"));


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

	public Reserva getOne(int idReserva) throws Exception{

		Statement stmt = null;
		ResultSet rs = null;
		Reserva rsv = new Reserva();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();
			rs = stmt.executeQuery("select * from reservas where id_reserva = '" + idReserva + "'");
			if(rs!=null){
				while(rs.next()){
					rsv.setId(rs.getInt("id_reserva"));
					rsv.setIdCliente(rs.getInt("id_cliente"));
					rsv.setFechaInicio(formatter.parse(rs.getString("fecha_inicio")));
					rsv.setFechaFin(formatter.parse(rs.getString("fecha_fin")));
					rsv.setEstadoActual(Reserva.estado.valueOf(rs.getString("estado")));
					rsv.setFechaCreacion(formatter.parse(rs.getString("fecha_creacion")));
					Date fechaIngresoReal = rs.getDate("fecha_ingreso_real"));
					Date fechaSalidaReal = rs.getDate("fecha_salida_real"));
					if(fechaIngresoReal != null) {
						rsv.setFechaIngresoReal(formatter.parse(rs.getString("fecha_ingreso_real")));
					}
					if(fechaSalidaReal != null) {
						rsv.setFechaSalidaReal(formatter.parse(rs.getString("fecha_salida_real")));
					}
					rsv.setRetenida(rs.getBoolean("retenida"));
					rsv.setPrecioBase(rs.getFloat("precio_base"));
					rsv.setPrecioFinal(rs.getFloat("precio_final"));
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

		return rsv;
	}

	public int getServicios(String idReserva, String idHabitacion, String idTipoServicio) throws Exception {
		Statement stmt = null;
		ResultSet rs=null;
		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			String query = "SELECT SUM(cantidad) as cnt FROM servicios WHERE";
			query += " id_reserva = " + idReserva + " AND id_habitacion = " + idHabitacion + " AND id_tipo_servicio = " + idTipoServicio + ";";

			rs = stmt.executeQuery(query);
			System.out.println("1111");
			if(rs!=null){
				System.out.println("222");
				while(rs.next()){
					System.out.println("333");
					System.out.println(rs.getInt("cnt"));
					return rs.getInt("cnt");
				}
			}
			System.out.println("444");
			return 0;

		} catch (Exception e) {
			System.out.println("Error al buscar servicio");
			throw e;
		}
	}

	public void pedirServicio(String idReserva, String idHabitacion, String idTipoServicio, int cantidad) throws Exception {
		Statement stmt = null;
		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			String query = "INSERT INTO servicios (id_reserva, id_habitacion, id_tipo_servicio, cantidad)";
			query += " VALUES (" + idReserva + ", " + idHabitacion + ", " + idTipoServicio + "," + cantidad + ")";

			stmt.executeUpdate(query);

		} catch (Exception e) {
			System.out.println("Error al pedir servicio");
			throw e;
		}
	}

	public void agregarServicio(String idReserva, String idHabitacion, String idTipoServicio, int cantidad) throws Exception {
		Statement stmt = null;
		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			String query = "UPDATE servicios SET cantidad = " + cantidad + " WHERE";
			query += " id_reserva = " + idReserva + " AND id_habitacion = " + idHabitacion + " AND id_tipo_servicio = " + idTipoServicio + ";";

			stmt.executeUpdate(query);

		} catch (Exception e) {
			System.out.println("Error al a�adir servicio");
			throw e;
		}
	}

}