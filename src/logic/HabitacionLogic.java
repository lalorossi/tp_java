package logic;

import database.HabitacionData;;

public class HabitacionLogic {
	HabitacionData hData = new HabitacionData();

	public int getCantHabitacionPorIDTipo(int idTipo) throws Exception {
		return hData.getCantHabitacionPorIDTipo(idTipo);
	}

}
