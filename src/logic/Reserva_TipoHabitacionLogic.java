package logic;

import database.Reserva_TipoHabitacionData;

public class Reserva_TipoHabitacionLogic {
	Reserva_TipoHabitacionData rthData = new Reserva_TipoHabitacionData();

	public void Create(int idReserva, int idTipoHabitacionn, int cantidadReservada) throws Exception {
		rthData.Create(idReserva, idTipoHabitacionn, cantidadReservada);
	};


}
