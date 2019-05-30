package logic;

import java.util.ArrayList;
import java.util.Date;

import database.EventoData;
import entities.Entidad;
import entities.EventoTarjeta;

public class EventosLogic extends Entidad {

	EventoData evtData = new EventoData();

	public ArrayList<EventoTarjeta> getFromDate(String from) throws Exception{
		return evtData.getFromDate(from);
	}

	public void create(EventoTarjeta evtTar) throws Exception {
		evtData.Create(evtTar);
	}
}
