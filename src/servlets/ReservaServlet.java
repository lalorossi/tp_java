package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Reserva;
import entities.Reserva_TipoHabitacion;
import entities.TipoHabitacion;

import logic.ReservaLogic;
import logic.Reserva_TipoHabitacionLogic;

/**
 * Servlet implementation class TarjetaServlet
 */
@WebServlet("/Reserva")
public class ReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// getAll TipoHabitaciones
//		TipoHabitacionLogic thLogic = new TipoHabitacionLogic();
//		try {
//			ArrayList<TipoHabitacion> tipoHabitaciones = new ArrayList<TipoHabitacion>();
//			tipoHabitaciones = thLogic.getAll();
//			for (int i = 0; i < tipoHabitaciones.size(); i++) {
//				TipoHabitacion th = new TipoHabitacion();
//				th = tipoHabitaciones.get(i);
//				System.out.println(th.getId());
//
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

		// getCantHabitacionPorIDTipo
//		HabitacionLogic hLogic = new HabitacionLogic();
//		try {
//			System.out.println(hLogic.getCantHabitacionPorIDTipo(1));
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

		// Create de RESERVA y RESERVA_TIPOHABITACION(falta lo ultimo)
//		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
//		Reserva rsv = new Reserva();
//		Date desde;
//		ReservaLogic rsvLogic = new ReservaLogic();
//		ArrayList<Reserva_TipoHabitacion> reservasTH = new ArrayList<Reserva_TipoHabitacion>();
//
//		Reserva_TipoHabitacion rsvTH1 = new Reserva_TipoHabitacion();
//		rsvTH1.setIdTipoHabitacion(3);
//		rsvTH1.setCantidad(1);
//		reservasTH.add(rsvTH1);
//
//		Reserva_TipoHabitacion rsvTH2 = new Reserva_TipoHabitacion();
//		rsvTH2.setIdTipoHabitacion(2);
//		rsvTH2.setCantidad(1);
//		reservasTH.add(rsvTH2);
//		try {
//			desde = formatter1.parse("1997-07-07");
//			Date hasta = formatter1.parse("2004-07-07");
//			Date creacion = formatter1.parse("2004-07-07");
//			rsv.setFechaCreacion(creacion);
//			rsv.setFechaInicio(desde);
//			rsv.setFechaFin(hasta);
//			rsv.setIdCliente(1);
//			rsvLogic.Create(rsv, reservasTH);
//
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

		ArrayList<TipoHabitacion> thConDisp = new ArrayList<TipoHabitacion>();
		ReservaLogic rsvLogic = new ReservaLogic();

		SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
		Date desde;
		try {
			desde = formatter1.parse("2006-07-07");
			Date hasta = formatter1.parse("2008-07-07");
			thConDisp = rsvLogic.getTipoDisponible(desde, hasta);
			for (int i = 0; i < thConDisp.size(); i++) {
				TipoHabitacion th = new TipoHabitacion();
				th = thConDisp.get(i);
				System.out.println(th.getId() + "  " + th.getDisponibilidad());
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


//		Reserva_TipoHabitacion rth = new Reserva_TipoHabitacion();
//		Reserva_TipoHabitacionLogic rthLogic = new Reserva_TipoHabitacionLogic();
//		rth.setIdReserva(3);
//		rth.setIdTipoHabitacion(4);
//		rth.setCantidad(1);
//		try {
//			rthLogic.Create(rth);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// RequestDispatcher requestDispatcher;

		/// Declaraciones para que no tiere error el pseudocodigo///
		int paso = 1;
		int camasSolicitadas;

		ArrayList<Reserva_TipoHabitacion> reservasTH = new ArrayList<Reserva_TipoHabitacion>();
		Reserva rsv = new Reserva();
		ReservaLogic rsvLogic = new ReservaLogic();
		/// ---///

		if (paso == 1) {
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date desde = formatter1.parse("1111-22-33"); // request.getRequestDispatcher
				Date hasta = formatter1.parse("1111-22-33"); // request.getRequestDispatcher
				camasSolicitadas = 2; // request.getRequestDispatcher

				ArrayList<TipoHabitacion> thConDisp = new ArrayList<TipoHabitacion>();

				thConDisp = rsvLogic.getTipoDisponible(desde, hasta);

				if (thConDisp.size() == 0) {
					System.out.println("No hay piezas disponibles");
				} else {
					TipoHabitacion th = new TipoHabitacion();
					int camasDisponibles = 0;

					for (int i = 0; i < thConDisp.size(); i++) {
						th = thConDisp.get(i);
						camasDisponibles = camasDisponibles + (th.getCapacidad() * th.getDisponibilidad());
					}

					if (camasSolicitadas > camasDisponibles) {
						System.out.println("No hay suficientes camas");
					} else {

					}
				}

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (paso == 2) {
			// No entendi
		}

		if (paso == 3) {
			try {
				rsvLogic.Create(rsv, reservasTH);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
