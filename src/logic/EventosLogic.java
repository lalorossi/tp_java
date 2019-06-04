package logic;

import java.util.ArrayList;
import java.util.Date;

import database.EventoData;
import entities.Entidad;
import entities.Evento;

public class EventosLogic extends Entidad {

	EventoData evtData = new EventoData();

	public ArrayList<Evento> getFromDate(String from) throws Exception{
		return evtData.getFromDate(from);
	}

	public void create(Evento evtTar) throws Exception {
		evtData.Create(evtTar);
	}
}
