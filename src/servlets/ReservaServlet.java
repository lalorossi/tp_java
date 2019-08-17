package servlets;

import java.io.IOException;
import java.io.StringWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import entities.Reserva;
import entities.Reserva_TipoHabitacion;
import entities.TipoHabitacion;
import entities.Usuario;

import logic.ReservaLogic;
import logic.Reserva_TipoHabitacionLogic;

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
			request.getSession().removeAttribute("arrayRsvTH");

			request.setAttribute("alert", "Se canceló el proceso de reserva exitosamente");
			request.setAttribute("alert_mode", "success");
			request.setAttribute("alert_title", "Reserva candelada");

			request.getRequestDispatcher("home.jsp").forward(request, response);
			return;
		}

		int paso = Integer.parseInt(request.getParameter("paso"));

		ReservaLogic rsvLogic = new ReservaLogic();

		if (paso == 1) {
			SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");

			try {
				Date desde = formatter1.parse(request.getParameter("fechaDesde"));
				Date hasta = formatter1.parse(request.getParameter("fechaHasta"));
				int camasSolicitadas = Integer.parseInt(request.getParameter("cantidadPersonas"));

				ArrayList<TipoHabitacion> thConDisp = new ArrayList<TipoHabitacion>();

				thConDisp = rsvLogic.getTipoDisponible(desde, hasta);

				if (thConDisp.size() == 0) {
					JSONObject objetoJSON = new JSONObject();
					objetoJSON.put("alert", true);
					objetoJSON.put("mensaje", "No hay piezas disponibles en las fechas solocitadas");
					objetoJSON.put("titulo", "No hay piezas disponibles");

					StringWriter output = new StringWriter();
					objetoJSON.writeJSONString(output);
					String textoJSON = output.toString();
					response.getWriter().write(textoJSON);

					return;

				} else {
					TipoHabitacion th = new TipoHabitacion();
					int camasDisponibles = 0;

					for (int i = 0; i < thConDisp.size(); i++) {
						th = thConDisp.get(i);
						camasDisponibles = camasDisponibles + (th.getCapacidad() * th.getDisponibilidad());

					}

					if (camasSolicitadas > camasDisponibles) {
						System.out.println("No hay suficientes camas");

						JSONObject objetoJSON = new JSONObject();
						objetoJSON.put("alert", true);
						objetoJSON.put("mensaje", "No hay camas suficientes");
						objetoJSON.put("titulo", "No hay suficientes camas");

						StringWriter output = new StringWriter();
						objetoJSON.writeJSONString(output);
						String textoJSON = output.toString();
						response.getWriter().write(textoJSON);

						return;

					} else {

						JSONObject objetoJSON = new JSONObject();
						JSONArray arrayJSON = new JSONArray();

						for (int i = 0; i < thConDisp.size(); i++) {
							th = thConDisp.get(i);
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
			ArrayList<Reserva_TipoHabitacion> arrayRsvTH = new ArrayList<Reserva_TipoHabitacion>();
			Reserva rsv = (Reserva) request.getSession().getAttribute("reservaActual");
			int IdReserva = rsv.getId();
			int cantidadCamas = 0;

			// CantidadCamas HARDCODEADO

			if (Integer.parseInt(request.getParameter("cantidadDeluxe")) > 0) {
				Reserva_TipoHabitacion rsvTH = new Reserva_TipoHabitacion();
				rsvTH.setCantidad(Integer.parseInt(request.getParameter("cantidadDeluxe")));
				rsvTH.setIdReserva(IdReserva);
				rsvTH.setIdTipoHabitacion(1);
				arrayRsvTH.add(rsvTH);

				cantidadCamas = cantidadCamas + (Integer.parseInt(request.getParameter("cantidadDeluxe")) * 2);
			}

			if (Integer.parseInt(request.getParameter("cantidadDeluxePlus")) > 0) {
				Reserva_TipoHabitacion rsvTH = new Reserva_TipoHabitacion();
				rsvTH.setCantidad(Integer.parseInt(request.getParameter("cantidadDeluxePlus")));
				rsvTH.setIdReserva(IdReserva);
				rsvTH.setIdTipoHabitacion(2);
				arrayRsvTH.add(rsvTH);

				cantidadCamas = cantidadCamas + (Integer.parseInt(request.getParameter("cantidadDeluxePlus")) * 2);
			}

			if (Integer.parseInt(request.getParameter("cantidadJuniorSuite")) > 0) {
				Reserva_TipoHabitacion rsvTH = new Reserva_TipoHabitacion();
				rsvTH.setCantidad(Integer.parseInt(request.getParameter("cantidadJuniorSuite")));
				rsvTH.setIdReserva(IdReserva);
				rsvTH.setIdTipoHabitacion(3);
				arrayRsvTH.add(rsvTH);

				cantidadCamas = cantidadCamas + (Integer.parseInt(request.getParameter("cantidadJuniorSuite")) * 4);
			}

			if (Integer.parseInt(request.getParameter("cantidadExecutiveSuite")) > 0) {
				Reserva_TipoHabitacion rsvTH = new Reserva_TipoHabitacion();
				rsvTH.setCantidad(Integer.parseInt(request.getParameter("cantidadExecutiveSuite")));
				rsvTH.setIdReserva(IdReserva);
				rsvTH.setIdTipoHabitacion(4);
				arrayRsvTH.add(rsvTH);

				cantidadCamas = cantidadCamas + (Integer.parseInt(request.getParameter("cantidadExecutiveSuite")) * 6);
			}

			if (Integer.parseInt(request.getParameter("cantidadSuitePresidencial")) > 0) {
				Reserva_TipoHabitacion rsvTH = new Reserva_TipoHabitacion();
				rsvTH.setCantidad(Integer.parseInt(request.getParameter("cantidadSuitePresidencial")));
				rsvTH.setIdReserva(IdReserva);
				rsvTH.setIdTipoHabitacion(5);
				arrayRsvTH.add(rsvTH);

				cantidadCamas = cantidadCamas
						+ (Integer.parseInt(request.getParameter("cantidadSuitePresidencial")) * 8);
			}

			JSONObject objetoJSON = new JSONObject();

			if (arrayRsvTH.size() == 0) {
				objetoJSON.put("alert", true);
				objetoJSON.put("mensaje", "");
				objetoJSON.put("titulo", "No hay habitaciones seleccionadas");

			} else {
				if (cantidadCamas < (int) request.getSession().getAttribute("camasSolicitadas")) {
					objetoJSON.put("alert", true);
					objetoJSON.put("mensaje", "");
					objetoJSON.put("titulo", "Cantidad de camas seleccionadas menor a las solicitadas");
				} else {
					request.getSession().setAttribute("arrayRsvTH", arrayRsvTH);
					objetoJSON.put("alert", false);
				}

			}

			StringWriter output = new StringWriter();
			objetoJSON.writeJSONString(output);
			String textoJSON = output.toString();
			response.getWriter().write(textoJSON);

			return;
		}

		if (paso == 3) {
			try {
				rsvLogic.Create((Reserva) request.getSession().getAttribute("reservaActual"),
						(ArrayList<Reserva_TipoHabitacion>) request.getSession().getAttribute("arrayRsvTH"));
				return;
			} catch (Exception e) {

				JSONObject objetoJSON = new JSONObject();
				objetoJSON.put("alert", true);
				objetoJSON.put("mensaje", "");
				objetoJSON.put("titulo", "Cantidad de camas seleccionadas menor a las solicitadas");

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
