package entities;

import java.util.Date;

public class EventoTarjeta extends Entidad {

	/* Atributos */
	int idTarjeta;
	Date horaEvento;
	/* -- Atributos -- */


	/* Getters y Settesrs */

	public int getIdTarjeta() {
		return idTarjeta;
	}
	public void setIdTarjeta(int idTarjeta) {
		this.idTarjeta = idTarjeta;
	}

	public Date getHoraEvento() {
		return horaEvento;
	}
	public void setHoraEvento(Date horaEvento) {
		this.horaEvento = horaEvento;
	}

	/* -- Getters y Setters -- */

}
