package logic;

import java.util.ArrayList;

import database.TipoHabitacionData;
import entities.TipoHabitacion;

public class TipoHabitacionLogic {
	TipoHabitacionData thData = new TipoHabitacionData();

	public TipoHabitacion getOne(int id) throws Exception {
		return thData.getOne(id);
	}

	public ArrayList<TipoHabitacion> getAll() throws Exception {
		return thData.getAll();
	};


}
