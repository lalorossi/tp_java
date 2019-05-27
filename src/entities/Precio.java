package entities;

import java.util.Date;

public class Precio extends Entidad {

	/* Atributos */
	Date fechaDesde;
	Date fechaHasta;
	int monto;
	/* -- Atributos -- */


	/* Getters y Setters */

	public Date getFechaDesde() {
		return fechaDesde;
	}
	public void setFechaDesde(Date fechaDesde) {
		this.fechaDesde = fechaDesde;
	}

	public Date getFechaHasta() {
		return fechaHasta;
	}
	public void setFechaHasta(Date fechaHasta) {
		this.fechaHasta = fechaHasta;
	}

	public int getMonto() {
		return monto;
	}
	public void setMonto(int monto) {
		this.monto = monto;
	}

	/* -- Getters y Setters -- */

}
