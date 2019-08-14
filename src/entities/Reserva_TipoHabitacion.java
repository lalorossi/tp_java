package entities;

public class Reserva_TipoHabitacion extends Entidad {

	/* Atributos */
	int idReserva;
	int idTipoHabitacion;
	int cantidad;
	/* -- Atributos -- */

	/* Getters y Setters */

	public int getIdReserva() {
		return idReserva;
	}

	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
	}

	public int getIdTipoHabitacion() {
		return idTipoHabitacion;
	}

	public void setIdTipoHabitacion(int idTipoHabitacion) {
		this.idTipoHabitacion = idTipoHabitacion;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	/* -- Getters y Setters -- */

}
