package entities;

import java.util.*;

public class Reserva extends Entidad  {
	Date fechaInicio;
	Date fechaFin;
	enum estado {
		Pendiente,
		Cancelada,
		NoShow,
		EnCurso,
		Cerrada
	};
	

}
