package entities;

public class TipoHabitacion extends Entidad  {
	enum tipo {
		Doble,
		DoblePremium,
		Triple,
		TriplePremium,
		Cuadruple
	}
	
	tipo tipoHabitacion;	
	public tipo getTipoHabitacion() {
		return tipoHabitacion;
	}
	public void setTipoHabitacion(tipo tipoHabitacion) {
		this.tipoHabitacion = tipoHabitacion;
	}

	String descripcion;	
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	int capacidad;
	public int getCapacidad() {
		return capacidad;
	}
	public void setCapacidad(int capacidad) {
		this.capacidad = capacidad;
	}
	
}
