package entities;

public class TipoHabitacion extends Entidad  {

	public enum tipo {
		deluxe, deluxeplus, juniorsuite, executivesuite, suitepresidencial
	}

	/* Atributos */
	tipo tipoHabitacion;
	String descripcion;
	int capacidad;
	int precio;
	int _disponibilidad;
	int _cantidadReservada;
	/* -- Atributos -- */


	/* Getters y Setters */
	public int getCantidadReservada() {
		return _cantidadReservada;
	}

	public void setCantidadReservada(int cantidadReservada) {
		this._cantidadReservada = cantidadReservada;
	}

	public tipo getTipoHabitacion() {
		return tipoHabitacion;
	}

	public int getDisponibilidad() {
		return _disponibilidad;
	}

	public void setDisponibilidad(int disponibilidad) {
		this._disponibilidad = disponibilidad;
	}

	public void setTipoHabitacion(tipo tipoHabitacion) {
		this.tipoHabitacion = tipoHabitacion;
	}

	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getCapacidad() {
		return capacidad;
	}
	public void setCapacidad(int capacidad) {
		this.capacidad = capacidad;
	}

	public int getPrecio() {
		return precio;
	}

	public void setPrecio(int precio) {
		this.precio = precio;
	}
	/* -- Getters y Setters -- */

}
