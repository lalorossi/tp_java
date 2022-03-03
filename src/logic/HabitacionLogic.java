package logic;

import java.util.ArrayList;

import database.HabitacionData;
import entities.Habitacion;
import entities.Servicio;;

public class HabitacionLogic {
	HabitacionData hData = new HabitacionData();

	public int getCantidadPorTipo(int idTipo) throws Exception {
		return hData.getCantidadPorTipo(idTipo);
	}

	public ArrayList<Habitacion> getFromReserva(int idReserva) throws Exception {
		return hData.getFromReserva(idReserva);
	}

	public ArrayList<Habitacion> getFromServicios(ArrayList<Servicio> servicios) throws Exception {
		return hData.getFromServicios(servicios);
	}

	public ArrayList<Habitacion> getDisponiblesPorTipo(int idTipoHabitacion) throws Exception{
		return hData.getDisponiblesPorTipo(idTipoHabitacion);
	}

	public void reservar(String idString, int idReserva) throws Exception{
		hData.reservar(idString, idReserva);
	}

	public void liberar(String idString) throws Exception{
		hData.liberar(idString);
	}

}
