package entities;

public class Habitacion extends Entidad {

	enum estado{
		Libre,
		Ocupada,
		Reservada,
		FueraDeServicio
	}

	int idHabitacion;
	int numero;
	int idTipoHabitacion;
	int _idReserva;

	/* Atributos */
	estado estadoActual;
	/* -- Atributos -- */


	/* Getters y Setters */

	public estado getEstadoActual() {
		return estadoActual;
	}
	public void setEstadoActual(estado estadoActual) {
		this.estadoActual = estadoActual;
	}

	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}

	public int getIdTipoHabitacion() {
		return idTipoHabitacion;
	}
	public void setIdTipoHabitacion(int idTipoHabitacion) {
		this.idTipoHabitacion = idTipoHabitacion;
	}

	public int getIdReserva() {
		return _idReserva;
	}
	public void setIdReserva(int idReserva) {
		this._idReserva = idReserva;
	}

	/* -- Getters y Setters -- */

}
