package entities;

public class Servicio extends Entidad {

	/* Atributos */
	int idServicio;
	int idReserva;
	int idHabitacion;
	int idTipoServicio;
	int cantidad;
	/* -- Atributos -- */

	/* Getters y Setters */

	public void setIdServicio(int setIdServicio) {
		this.idServicio = setIdServicio;
	}
	public int getIdServicio() {
		return idServicio;
	}

	public void setIdReserva(int setIdReserva) {
		this.idReserva = setIdReserva;
	}
	public int getIdReserva() {
		return idReserva;
	}

	public void setIdHabitacion(int setIdHabitacion) {
		this.idHabitacion = setIdHabitacion;
	}
	public int getIdHabitacion() {
		return idHabitacion;
	}

	public void setIdTipoServicio(int setIdTipoServicio) {
		this.idTipoServicio = setIdTipoServicio;
	}
	public int getIdTipoServicio() {
		return idTipoServicio;
	}

	public void setCantidad(int setCantidad) {
		this.cantidad = setCantidad;
	}
	public int getCantidad() {
		return cantidad;
	}

	/* -- Getters y Setters -- */

}
