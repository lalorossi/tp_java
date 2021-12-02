package logic;

import java.util.ArrayList;

import database.ServicioData;
import entities.Servicio;

public class ServicioLogic {
	ServicioData srvData = new ServicioData();

	public ArrayList<Servicio> getFromReserva(int id_reserva) throws Exception {
		return srvData.getFromReserva(id_reserva);
	}
}
