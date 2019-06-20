package entities;

public class Cliente extends Usuario {

	public Cliente() {
		this.setVerificado(false);
	}

	/* Atributos */
	String dni;
	String nombre;
	String apellido;
	String telefono;
	String pais;
	String ciudad;
	int codigoPostal;
	String direccion;
	Boolean verificado;
	String friendlyID;
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

	public Boolean getVerificado() {
		return verificado;
	}

	public void setVerificado(Boolean verificado) {
		this.verificado = verificado;
	}

	public String getFriendlyID() {
		return friendlyID;
	}

	public void setFriendlyID(String friendlyID) {
		this.friendlyID = friendlyID;
	}

	/* -- Getters y Setters -- */


	@Override
	public boolean isAdmin() {
		return false;
	}

}
