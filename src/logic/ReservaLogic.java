package logic;

import java.util.ArrayList;
import java.util.Date;

import database.ReservaData;
import entities.Habitacion;
import entities.Reserva;
import entities.TipoHabitacion;
import entities.Usuario;
import logic.TipoHabitacionLogic;
import logic.HabitacionLogic;

public class ReservaLogic {
	ReservaData rsvData = new ReservaData();

	public Reserva getOne(int id_reserva) throws Exception {
		return rsvData.getOne(id_reserva);
	}

	public ArrayList<Reserva> ocupadosEntre(Date desde, Date hasta) throws Exception {
		return rsvData.ocupadosEntre(desde, hasta);
	}

	public ArrayList<Reserva> activasEntre(Date desde, Date hasta) throws Exception {
		return rsvData.ocupadosEntre(desde, hasta);
	}

	public int getHabitacionesOcupadasPorTipo(ArrayList<Reserva> reservas, int idTH) {
		return rsvData.habitacionesOcupadasPorTipo(reservas, idTH);
	}

	public void Create(Reserva reserva) throws Exception {
		rsvData.Create(reserva);
	}

	public ArrayList<TipoHabitacion> getTiposDisponible(Date desde, Date hasta) {
		ArrayList<TipoHabitacion> tiposDisponibles = new ArrayList<TipoHabitacion>();

		TipoHabitacionLogic thLogic = new TipoHabitacionLogic();
		HabitacionLogic habitacionLogic = new HabitacionLogic();
		try {
			ArrayList<TipoHabitacion> todasTipoHabitacion = thLogic.getAll();
			ArrayList<Reserva> reservas = this.ocupadosEntre(desde, hasta);

			for (int i = 0; i < todasTipoHabitacion.size(); i++) {
				TipoHabitacion tipoHabitacionDisponible;
				tipoHabitacionDisponible = todasTipoHabitacion.get(i);
				int cantTotal = habitacionLogic.getCantidadPorTipo(tipoHabitacionDisponible.getId());
				int cantOcupados = 0;
				if(reservas.size() > 0) {
					cantOcupados = this.getHabitacionesOcupadasPorTipo(reservas, tipoHabitacionDisponible.getId());
				}
				int disponibilidad = cantTotal - cantOcupados;
				if (disponibilidad > 0) {
					tipoHabitacionDisponible.setDisponibilidad(disponibilidad);
					tiposDisponibles.add(tipoHabitacionDisponible);
				}
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return tiposDisponibles;
	}

	// crear MisReservasServlet
	// idUsuario viene de session
	// idReseva viene de parametro de request ver submitAction en homeServlet
	// ArrayList<Reserva> Getall (idUsuario) todo
	// Todas las reserva
	// for en servlet que te muestre todo
	// void cancelarReserva (idReserva)

	public ArrayList<Reserva> getReservasDeUsuario(int idUsuario) throws Exception {
		return rsvData.getAllxUsr(idUsuario);
	}

	public ArrayList<Reserva> getAll() throws Exception {
		return rsvData.getAll();
	}

	public void cancelarReservar(int idReserva) throws Exception {
		rsvData.cancelarReservar(idReserva);
	}

	public ArrayList<Reserva> excluirReserva(int idExcluida, ArrayList<Reserva> reservas) {
		ArrayList<Reserva> nuevasReservas = new ArrayList<Reserva>();
		for(int i =0; i < reservas.size(); i++) {
			if(reservas.get(i).getId() != idExcluida) reservas.add(reservas.get(i));
		}
		return nuevasReservas;
	}

	public boolean retenida(int idReserva) throws Exception {
		Reserva reserva = rsvData.getOne(idReserva);
		Reserva reservaConCantidades = rsvData.getCantidadesReservadas(reserva);
		HabitacionLogic habitacionLogic = new HabitacionLogic();
		ArrayList<Reserva> reservasActivas = this.activasEntre(reserva.getFechaInicio(), reserva.getFechaFin());
		reservasActivas = this.excluirReserva(idReserva, reservasActivas);
		for(int i = 0; i < reservaConCantidades.getHabitacionesReservadas().size(); i++) {
			TipoHabitacion tipoHab = reservaConCantidades.getHabitacionesReservadas().get(i);
			int cantidadNecesaria = tipoHab.getCantidadReservada();
			int cantOcupadas = this.getHabitacionesOcupadasPorTipo(reservasActivas, tipoHab.getId());
			int cantTotal = habitacionLogic.getCantidadPorTipo(tipoHab.getId());
			System.out.println("cantidad reservada: " + String.valueOf(cantidadNecesaria));
			System.out.println("cantidad ocupadas: " + String.valueOf(cantOcupadas));
			System.out.println("cantidad total: " + String.valueOf(cantTotal));
			int cantDisponible = cantTotal-cantOcupadas;
			if(cantDisponible < cantidadNecesaria)
				return true;
		}
		return false;
	}

	public void checkIn(int idReserva) throws Exception {
		Reserva reserva = rsvData.getOne(idReserva);
		rsvData.checkIn(idReserva, reserva.getRetenida());
		Reserva reservaConCantidades = rsvData.getCantidadesReservadas(reserva);
		HabitacionLogic habitacionLogic = new HabitacionLogic();
		for (int i = 0; i < reservaConCantidades.getHabitacionesReservadas().size(); i++) {
			TipoHabitacion tipoHab = reservaConCantidades.getHabitacionesReservadas().get(i);
			int cantidadNecesaria = tipoHab.getCantidadReservada();
			ArrayList<Habitacion> habitacionesDisponibles = habitacionLogic.getDisponiblesPorTipo(tipoHab.getId());
			ArrayList idHabitacionesParaReserva = new ArrayList();
			int cantTotal = habitacionLogic.getCantidadPorTipo(tipoHab.getId());
			String idString = "";
			for(int c = 0; c < cantidadNecesaria; c++) {
				int idHabitacionParaReserva = habitacionesDisponibles.get(c).getId();
				idString += idHabitacionParaReserva;
				idString += ",";
			}
			idString = idString.substring(0, idString.length() - 1);
			habitacionLogic.reservar(idString, idReserva);
		}
	}

	public void checkOut(int idReserva) throws Exception {
		Reserva reserva = rsvData.getOne(idReserva);
		HabitacionLogic habitacionLogic = new HabitacionLogic();
		rsvData.checkOut(idReserva);
		ArrayList<Habitacion> habitacionesDeReserva = this.getHabitaciones(reserva);
		String idString = "";
		for (int i = 0; i < habitacionesDeReserva.size(); i++) {
			int idHabitacionParaLibrear = habitacionesDeReserva.get(i).getId();
			idString += idHabitacionParaLibrear ;
			idString += ",";
		}
		idString = idString.substring(0, idString.length() - 1);
		habitacionLogic.liberar(idString);
	}

	public void retener(int idReserva) throws Exception {
		rsvData.retener(idReserva);
	}

	public ArrayList<Habitacion> getHabitaciones(Reserva reserva) throws Exception {
		HabitacionLogic habLogic = new HabitacionLogic();
		return habLogic.getFromReserva(reserva.getId());
	}

	public void pedirServicio(String idReserva, String idHabitacion, String idTipoServicio, int cantidad) throws Exception {
		// Si no existe el servicio, crearlo
		int cantidadYaPedida = rsvData.getServicios(idReserva, idHabitacion, idTipoServicio);
		if(cantidadYaPedida== 0) {
			rsvData.pedirServicio(idReserva, idHabitacion, idTipoServicio, cantidad);
		}
		else {
			rsvData.agregarServicio(idReserva, idHabitacion, idTipoServicio, cantidadYaPedida + cantidad);
		}
	}
}
