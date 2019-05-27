package entities;

public class Habitacion extends Entidad {

	enum estado{
		Libre,
		Ocupada,
		Reservada,
		FueraDeServicio
	}

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

	/* -- Getters y Setters -- */

}
