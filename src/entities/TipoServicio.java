package entities;

public class TipoServicio extends Entidad  {

	/* Atributos */
	String idServicio;
	String nombre;
	float precio;
	/* -- Atributos -- */


	/* Getters y Setters */

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public float getPrecio() {
		return precio;
	}
	public void setPrecio(float precio) {
		this.precio = precio;
	}

	/* -- Getters y Setters -- */

}
