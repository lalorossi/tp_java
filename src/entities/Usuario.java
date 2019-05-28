package entities;

public class Usuario extends Entidad {

	public Usuario() {
		// Setea un valor inicial de id imposible para poder ver si es vacio más adelante
		this.setId(-1);
	}

	/* Atributos */
	int idUsuario;	// Si la ID se hereda de Entidad, este no estaría de más?
	String email;
	String contrasena;
	/* -- Atributos -- */


	/* Getters y Setters*/

	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int id_usuario) {
		this.idUsuario = id_usuario;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getContrasena() {
		return contrasena;
	}
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	/* -- Getters y Setters -- */


	public boolean isEmpty() {
		if(this.getId() == -1)
			return true;
		return false;
	}

	public boolean isAdmin() {
		if(this.getClass().getName().equals("entities.Admin"))
			return true;
		return false;
	}
}
