package entities;

import java.util.Date;

public class Evento extends Entidad {

	public enum Tipos{
		tarjeta,
		usuario
	}

	/* Atributos */
	Tipos tipo;
	int idRelacionado;
	Date horaEvento;
	/* -- Atributos -- */


	/* Getters y Settesrs */

	public int getIdRelacionado() {
		return idRelacionado;
	}
	public void setIdRelacionado(int idRelacionado) {
		this.idRelacionado = idRelacionado;
	}

	public Date getHoraEvento() {
		return horaEvento;
	}
	public void setHoraEvento(Date horaEvento) {
		this.horaEvento = horaEvento;
	}
	public Tipos getTipo() {
		return tipo;
	}
	public void setTipo(Tipos tipo) {
		this.tipo = tipo;
	}

	/* -- Getters y Setters -- */

}
