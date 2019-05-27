package entities;

import java.util.*;

public class Reserva extends Entidad  {

	enum estado {
		Pendiente,
		Cancelada,
		NoShow,
		EnCurso,
		Cerrada
	};

	/* Atributos */
	estado estadoActual;
	Date fechaInicio;
	Date fechaFin;
	/* -- Atributos -- */


	/* Getters y Setters */

	public estado getEstadoActual() {
		return estadoActual;
	}
	public void setEstadoActual(estado estadoActual) {
		this.estadoActual = estadoActual;
	}

	public Date getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Date getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

	/* -- Getters y Setters -- */

}
