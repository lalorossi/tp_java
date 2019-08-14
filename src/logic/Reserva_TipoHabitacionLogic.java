package logic;

import java.util.ArrayList;

import database.Reserva_TipoHabitacionData;
import entities.Reserva_TipoHabitacion;

public class Reserva_TipoHabitacionLogic {
	Reserva_TipoHabitacionData rthData = new Reserva_TipoHabitacionData();

	public void Create(Reserva_TipoHabitacion rth) throws Exception {
		rthData.Create(rth);
	};


}
