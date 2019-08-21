package entities;

import java.util.*;

public class Reserva extends Entidad  {

	public enum estado {
		activa, cancelada, espera, terminada
	};

	/* Atributos */
	int idCliente;
	Date fechaInicio;
	Date fechaFin;
	estado estadoActual;
	Date fechaCreacion;
	ArrayList<TipoHabitacion> _habitacionesReservadas = new ArrayList<TipoHabitacion>();
	/* -- Atributos -- */


	/* Getters y Setters */
	public ArrayList<TipoHabitacion> getHabitacionesReservadas() {
		return _habitacionesReservadas;
	}

	public void setHabitacionesReservadas(ArrayList<TipoHabitacion> habitacionesReservadas) {
		this._habitacionesReservadas = habitacionesReservadas;
	}

	public int getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

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
