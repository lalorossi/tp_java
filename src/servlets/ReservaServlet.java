package servlets;

import java.io.IOException;
import java.io.StringWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import entities.Reserva;
import entities.TipoHabitacion;
import entities.Usuario;

import logic.ReservaLogic;
import logic.TipoHabitacionLogic;

/**
 * Servlet implementation class TarjetaServlet
 */
@WebServlet({ "/Reserva", "/reserva" })
public class ReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservaServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object usuarioActual = request.getSession().getAttribute("usuarioActual");
		if (usuarioActual == null) {
			System.out.println("Usuario no loggeado. Lo mando al login");
			response.sendRedirect("login");
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String submitAction = request.getParameter("cancelar_reserva");

		if (submitAction != null && submitAction.equals("cancelar")) {
			request.getSession().removeAttribute("camasSolicitadas");
			request.getSession().removeAttribute("reservaActual");

			request.setAttribute("alert", "Se cancel� el proceso de reserva exitosamente");
			request.setAttribute("alert_mode", "success");
			request.setAttribute("alert_title", "Reserva candelada");

			request.getRequestDispatcher("home.jsp").forward(request, response);
			return;
		}

		int paso = Integer.parseInt(request.getParameter("paso"));

		ReservaLogic reservaLogic = new ReservaLogic();

		if (paso == 1) {
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");

			try {
				Date desde = formatter1.parse(request.getParameter("fechaDesde"));
				Date hasta = formatter1.parse(request.getParameter("fechaHasta"));
				int camasSolicitadas = Integer.parseInt(request.getParameter("cantidadPersonas"));

				ArrayList<TipoHabitacion> thDisponibles = new ArrayList<TipoHabitacion>();

				// Esto deber�a ir en tipo habitaci�n
				thDisponibles = reservaLogic.getTiposDisponible(desde, hasta);

				if (thDisponibles.size() == 0) {
					JSONObject objetoJSON = new JSONObject();
					objetoJSON.put("alert", true);
					objetoJSON.put("mensaje", "No contamos con habitaciones disponibles en el per�odo seleccionado");
					objetoJSON.put("titulo", "No hay habitaciones disponibles");

					StringWriter output = new StringWriter();
					objetoJSON.writeJSONString(output);
					String textoJSON = output.toString();
					response.getWriter().write(textoJSON);

					return;

				} else {
					TipoHabitacion th;
					int camasDisponibles = 0;

					for (int i = 0; i < thDisponibles.size(); i++) {
						th = thDisponibles.get(i);
						camasDisponibles = camasDisponibles + (th.getCapacidad() * th.getDisponibilidad());

					}

					if (camasSolicitadas > camasDisponibles) {
						System.out.println("No hay suficientes camas");

						JSONObject objetoJSON = new JSONObject();
						objetoJSON.put("alert", true);
						objetoJSON.put("mensaje", "Las habitaciones disponibles no cuentan con capacidad suficiente para " + camasSolicitadas + " personas");
						objetoJSON.put("titulo", "Capacidad disponible excedida");

						StringWriter output = new StringWriter();
						objetoJSON.writeJSONString(output);
						String textoJSON = output.toString();
						response.getWriter().write(textoJSON);

						return;

					} else {

						JSONObject objetoJSON = new JSONObject();
						JSONArray arrayJSON = new JSONArray();

						for (int i = 0; i < thDisponibles.size(); i++) {
							th = thDisponibles.get(i);
							objetoJSON.put("tipo", th.getTipoHabitacion().toString());
							objetoJSON.put("cantidad", th.getDisponibilidad());
							objetoJSON.put("precio", th.getPrecio());
							arrayJSON.add(objetoJSON);
							objetoJSON = new JSONObject();
						}

						Reserva rsv = new Reserva();
						rsv.setFechaInicio(desde);
						rsv.setFechaFin(hasta);
						rsv.setFechaCreacion(new Date());

						rsv.setIdCliente(((Usuario) request.getSession().getAttribute("usuarioActual")).getId());

						request.getSession().setAttribute("reservaActual", rsv);
						request.getSession().setAttribute("camasSolicitadas", camasSolicitadas);

						StringWriter output = new StringWriter();
						arrayJSON.writeJSONString(output);
						String textoJSON = output.toString();
						response.getWriter().write(textoJSON);

						return;
					}
				}

			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		if (paso == 2) {
			Reserva reservaActual = (Reserva) request.getSession().getAttribute("reservaActual");

			int cantidadCamas = 0;

			Enumeration<String> nombresParametros = request.getParameterNames();
			TipoHabitacionLogic thLogic = new TipoHabitacionLogic();
			int contadorIdTipoHabitacion = 0;

			while(nombresParametros.hasMoreElements()) {
				String parametro = nombresParametros.nextElement();
				if( !parametro.equals("paso")) {
					contadorIdTipoHabitacion ++;
					if (Integer.parseInt(request.getParameter(parametro)) > 0) {
						try {
						TipoHabitacion th = thLogic.getOne(contadorIdTipoHabitacion);
						th.setCantidadReservada(Integer.parseInt(request.getParameter(parametro)));
						reservaActual.getHabitacionesReservadas().add(th);

						cantidadCamas = cantidadCamas + (Integer.parseInt(request.getParameter(parametro)) * th.getCapacidad());

						} catch (Exception e) {
							System.out.println("Error buscando los tipos de habitaci�n de la request");
							e.printStackTrace();

							JSONObject objetoJSON = new JSONObject();
							objetoJSON.put("alert", true);
							objetoJSON.put("mensaje", "Ocurri� un error interno al intentar crear la reserva. Intant� m�s tarde o comunicate con nostros");
							objetoJSON.put("titulo", "Error interno al crear la reserva");

							JSONArray arrayJSON = new JSONArray();
							StringWriter output = new StringWriter();
							arrayJSON.writeJSONString(output);
							String textoJSON = output.toString();
							response.getWriter().write(textoJSON);
							return;
						}
					}
				}
			}

			/*
			if (Integer.parseInt(request.getParameter("cantidadDeluxe")) > 0) {
				Reserva_TipoHabitacion rsvTH = new Reserva_TipoHabitacion();
				rsvTH.setCantidadReservada(Integer.parseInt(request.getParameter("cantidadDeluxe")));
				rsvTH.setIdReserva(idReservaActual);
				rsvTH.setIdTipoHabitacion(1);
				arrayRsvTH.add(rsvTH);

				cantidadCamas = cantidadCamas + (Integer.parseInt(request.getParameter("cantidadDeluxe")) * 2);
			}

			if (Integer.parseInt(request.getParameter("cantidadDeluxePlus")) > 0) {
				Reserva_TipoHabitacion rsvTH = new Reserva_TipoHabitacion();
				rsvTH.setCantidadReservada(Integer.parseInt(request.getParameter("cantidadDeluxePlus")));
				rsvTH.setIdReserva(idReservaActual);
				rsvTH.setIdTipoHabitacion(2);
				arrayRsvTH.add(rsvTH);

				cantidadCamas = cantidadCamas + (Integer.parseInt(request.getParameter("cantidadDeluxePlus")) * 2);
			}

			if (Integer.parseInt(request.getParameter("cantidadJuniorSuite")) > 0) {
				Reserva_TipoHabitacion rsvTH = new Reserva_TipoHabitacion();
				rsvTH.setCantidadReservada(Integer.parseInt(request.getParameter("cantidadJuniorSuite")));
				rsvTH.setIdReserva(idReservaActual);
				rsvTH.setIdTipoHabitacion(3);
				arrayRsvTH.add(rsvTH);

				cantidadCamas = cantidadCamas + (Integer.parseInt(request.getParameter("cantidadJuniorSuite")) * 4);
			}

			if (Integer.parseInt(request.getParameter("cantidadExecutiveSuite")) > 0) {
				Reserva_TipoHabitacion rsvTH = new Reserva_TipoHabitacion();
				rsvTH.setCantidadReservada(Integer.parseInt(request.getParameter("cantidadExecutiveSuite")));
				rsvTH.setIdReserva(idReservaActual);
				rsvTH.setIdTipoHabitacion(4);
				arrayRsvTH.add(rsvTH);

				cantidadCamas = cantidadCamas + (Integer.parseInt(request.getParameter("cantidadExecutiveSuite")) * 6);
			}

			if (Integer.parseInt(request.getParameter("cantidadSuitePresidencial")) > 0) {
				Reserva_TipoHabitacion rsvTH = new Reserva_TipoHabitacion();
				rsvTH.setCantidadReservada(Integer.parseInt(request.getParameter("cantidadSuitePresidencial")));
				rsvTH.setIdReserva(idReservaActual);
				rsvTH.setIdTipoHabitacion(5);
				arrayRsvTH.add(rsvTH);

				cantidadCamas = cantidadCamas
						+ (Integer.parseInt(request.getParameter("cantidadSuitePresidencial")) * 8);
			}
			*/

			JSONObject objetoJSON = new JSONObject();

			if (reservaActual.getHabitacionesReservadas().size() == 0) {
				objetoJSON.put("alert", true);
				objetoJSON.put("mensaje", "Por favor, seleccione una habitaci�n para continuar");
				objetoJSON.put("titulo", "No hay habitaciones seleccionadas");

			} else {
				if (cantidadCamas < (int) request.getSession().getAttribute("camasSolicitadas")) {
					objetoJSON.put("alert", true);
					objetoJSON.put("mensaje", "Seleccione m�s habitaciones, o habitaciones con mayor capacidad");
					objetoJSON.put("titulo", "Camas insuficientes en las habitaciones seleccionadas");
				} else {
					request.getSession().setAttribute("reservaActual", reservaActual);
					objetoJSON.put("alert", false);
				}

			}

			long diffInMillies = Math.abs(reservaActual.getFechaFin().getTime() - reservaActual.getFechaInicio().getTime());
			long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);

			objetoJSON.put("cantidadDias", diff);
			StringWriter output = new StringWriter();
			objetoJSON.writeJSONString(output);
			String textoJSON = output.toString();
			response.getWriter().write(textoJSON);

			return;
		}

		if (paso == 3) {
			try {
				Reserva nuevaReseva = (Reserva) request.getSession().getAttribute("reservaActual");
				float precioBase = Float.parseFloat(request.getParameter("precio_total"));
				nuevaReseva.setPrecioBase(precioBase);
				reservaLogic.Create(nuevaReseva);
				return;
			} catch (Exception e) {

				JSONObject objetoJSON = new JSONObject();
				objetoJSON.put("alert", true);
				objetoJSON.put("mensaje", "Por alguna raz�n, no pudimos crear la reserva. Intenta nuevamente o contactate con nosotros");
				objetoJSON.put("titulo", "Error interno al crear la reserva");

				JSONArray arrayJSON = new JSONArray();
				StringWriter output = new StringWriter();
				arrayJSON.writeJSONString(output);
				String textoJSON = output.toString();
				response.getWriter().write(textoJSON);

				e.printStackTrace();
				return;
			}
		}

	}

}
