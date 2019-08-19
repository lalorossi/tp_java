package logic;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import database.FactoryConection;
import database.ReservaData;
import entities.Reserva;
import entities.Reserva_TipoHabitacion;
import entities.TipoHabitacion;
import logic.TipoHabitacionLogic;
import logic.HabitacionLogic;

public class ReservaLogic {
	ReservaData rsvData = new ReservaData();

	public ArrayList<Reserva> ocupadosEntre(Date desde, Date hasta) throws Exception {
		return rsvData.ocupadosEntre(desde, hasta);
	}

	public int cantOcupadosXTH(ArrayList<Reserva> reservas, int idTH) {
		return rsvData.cantOcupadosXTH(reservas, idTH);
	}

	public void Create(Reserva rsv, ArrayList<Reserva_TipoHabitacion> rth) throws Exception {
		int idReserva;
		idReserva = rsvData.Create(rsv);

		Reserva_TipoHabitacionLogic rsvTHLogic = new Reserva_TipoHabitacionLogic();
		Reserva_TipoHabitacion rsvTH = new Reserva_TipoHabitacion();
		for (int i = 0; i < rth.size(); i++) {
			rsvTH = rth.get(i);
			rsvTH.setIdReserva(idReserva);
			rsvTHLogic.Create(rsvTH);
		}

	}

	public ArrayList<TipoHabitacion> getTipoDisponible(Date desde, Date hasta) {
		ArrayList<TipoHabitacion> tiposDisponibles = new ArrayList<TipoHabitacion>();

		TipoHabitacionLogic thLogic = new TipoHabitacionLogic();
		HabitacionLogic haLogic = new HabitacionLogic();
		try {
			ArrayList<TipoHabitacion> todasTipoHabitacion = thLogic.getAll();
			ArrayList<Reserva> reservas = this.ocupadosEntre(desde, hasta);
			for (int i = 0; i < todasTipoHabitacion.size(); i++) {
				TipoHabitacion tipoHabitacionConDisp = new TipoHabitacion();
				tipoHabitacionConDisp = todasTipoHabitacion.get(i);
				int cantTotal = haLogic.getCantHabitacionPorIDTipo(tipoHabitacionConDisp.getId());
				int cantOcupados = this.cantOcupadosXTH(reservas, tipoHabitacionConDisp.getId());
				int dif = cantTotal - cantOcupados;
				if (dif > 0) {
					tipoHabitacionConDisp.setDisponibilidad(dif);
					tiposDisponibles.add(tipoHabitacionConDisp);
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

	public ArrayList<Reserva> getAllxUsr(int idUsuario) throws Exception {
		return rsvData.getAllxUsr(idUsuario);
	}

	public void cancelarReservar(int idReserva) throws Exception {
		rsvData.cancelarReservar(idReserva);
	}

}
