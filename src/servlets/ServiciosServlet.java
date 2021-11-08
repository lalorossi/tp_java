package servlets;

import java.io.IOException;
import java.io.StringWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import entities.Habitacion;
import entities.Reserva;
import entities.TipoHabitacion;
import entities.TipoServicio;
import entities.Usuario;
import logic.HabitacionLogic;
import logic.ReservaLogic;
import logic.TipoHabitacionLogic;
import logic.TipoServicioLogic;

/**
 * Servlet implementation class TarjetaServlet
 */
@WebServlet({ "/Servicios", "/servicios" })
public class ServiciosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiciosServlet() {
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

		// Obtener reserva actual
		int resId = Integer.parseInt(request.getParameter("resId"));
		HabitacionLogic habLogic = new HabitacionLogic();
		TipoServicioLogic tsLogic = new TipoServicioLogic();
		try {
			ArrayList<Habitacion> habitaciones = habLogic.getFromReserva(resId);
			ArrayList<TipoServicio> tipoServicios = tsLogic.getAll();
			request.setAttribute("resId", resId);
			request.setAttribute("habitaciones", habitaciones);
			request.setAttribute("tipoServicios", tipoServicios);
			RequestDispatcher requestDispatcher;
			requestDispatcher = request.getRequestDispatcher("servicios.jsp");
			requestDispatcher.forward(request, response);
			return;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Asignar servicios a la reserva

		ReservaLogic resLogic = new ReservaLogic();

		Enumeration<String> nombresParametros = request.getParameterNames();
		// Obtener reserva actual
		String idReserva = request.getParameter("idReserva");

		try {
			while(nombresParametros.hasMoreElements()) {
				String parametro = nombresParametros.nextElement();
				if( parametro.startsWith("cant_serv_")) {
					if (!request.getParameter(parametro).equals("")) {
						// Separar n�mero de servicio y habitacion
						String serviceRoom = parametro.replace("cant_serv_", "");
						String idHabitacion = serviceRoom.split("-")[0];
						String idTipoServicio = serviceRoom.split("-")[1];
						// Agregar entrada a servicio-reserva
						int cantidad = Integer.parseInt(request.getParameter(parametro));
						if(cantidad == 0) continue;

						resLogic.pedirServicio(idReserva, idHabitacion, idTipoServicio, cantidad);
					}
				}
			}
		} catch (Exception e) {
			System.out.println("Error requiriendo el servicio");
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


		request.setAttribute("alert", "Se pidieron los servicios correctamente");
		request.setAttribute("alert_mode", "success");
		request.setAttribute("alert_title", "Servicios adquiridos");

		request.getRequestDispatcher("home.jsp").forward(request, response);
		return;
	}

}
