package logic;

import database.TarjetaData;
import entities.Tarjeta;

public class TarjetaLogic {

	TarjetaData tarjetaData = new TarjetaData();

	public Tarjeta getOne(int idTarjeta) throws Exception {
		return tarjetaData.getOne(idTarjeta);
	}

}
