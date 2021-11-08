package logic;

import java.util.ArrayList;

import database.TarjetaData;
import database.TipoServicioData;
import entities.Tarjeta;
import entities.TipoServicio;

public class TipoServicioLogic {

	TipoServicioData tsData = new TipoServicioData();

	public ArrayList<TipoServicio> getAll() throws Exception {
		return tsData.getAll();
	}

}
