package entities;

public class Habitacion extends Entidad {
	enum estado{
		Libre,
		Ocupada,
		Reservada,
		FueraDeServicio
	}
	
	estado estadoActual;
	public estado getEstadoActual() {
		return estadoActual;
	}
	public void setEstadoActual(estado estadoActual) {
		this.estadoActual = estadoActual;
	}

}
