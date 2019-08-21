package logic;

import database.HabitacionData;;

public class HabitacionLogic {
	HabitacionData hData = new HabitacionData();

	public int getCantidadPorTipo(int idTipo) throws Exception {
		return hData.getCantidadPorTipo(idTipo);
	}

}
