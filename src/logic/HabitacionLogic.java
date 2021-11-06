package logic;

import java.util.ArrayList;

import database.HabitacionData;
import entities.Habitacion;;

public class HabitacionLogic {
	HabitacionData hData = new HabitacionData();

	public int getCantidadPorTipo(int idTipo) throws Exception {
		return hData.getCantidadPorTipo(idTipo);
	}

	public ArrayList<Habitacion> getFromReserva(int idReserva) throws Exception {
		return hData.getFromReserva(idReserva);
	}

	public ArrayList<Habitacion> getDisponiblesPorTipo(int idTipoHabitacion) throws Exception{
		return hData.getDisponiblesPorTipo(idTipoHabitacion);
	}

	public void reservar(String idString, int idReserva) throws Exception{
		hData.reservar(idString, idReserva);
	}

}
