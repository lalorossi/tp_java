package entities;

public class Cliente extends Usuario {

	/* Atributos */
	String dni;
	String nombre;
	String apellido;
	String telefono;
	String pais;
	String ciudad;
	int codigoPostal;
	String direccion;
	/* -- Atributos -- */


	/* Getters y Setters */

	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getPais() {
		return pais;
	}
	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getCiudad() {
		return ciudad;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public int getCodigo_postal() {
		return codigoPostal;
	}
	public void setCodigo_postal(int codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	/* -- Getters y Setters -- */


	public boolean isAdmin() {
		return false;
	}

}
