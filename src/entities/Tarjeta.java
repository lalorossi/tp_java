package entities;

import java.util.Date;

public class Tarjeta extends Entidad  {

	/* Atributos */
	int numeroTarjeta;
	Date fechaAlta;
	Date fechaBaja;
	/* -- Atributos -- */


	/* Getters y Setters */

	public int getNumeroTarjeta() {
		return numeroTarjeta;
	}
	public void setNumeroTarjeta(int numeroTarjeta) {
		this.numeroTarjeta = numeroTarjeta;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}
	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public Date getFechaBaja() {
		return fechaBaja;
	}
	public void setFechaBaja(Date fechaBaja) {
		this.fechaBaja = fechaBaja;
	}

	/* -- Getters y Setters -- */

}
