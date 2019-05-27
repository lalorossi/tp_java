package entities;

public class TipoHabitacion extends Entidad  {

	enum tipo {
		Doble,
		DoblePremium,
		Triple,
		TriplePremium,
		Cuadruple
	}

	/* Atributos */
	tipo tipoHabitacion;
	String descripcion;
	int capacidad;
	/* -- Atributos -- */


	/* Getters y Setters */

	public tipo getTipoHabitacion() {
		return tipoHabitacion;
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

	/* -- Getters y Setters -- */

}
