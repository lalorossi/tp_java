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
import entities.Servicio;
import entities.TipoHabitacion;
import entities.TipoServicio;
import entities.Usuario;
import logic.HabitacionLogic;
import logic.ReservaLogic;
import logic.ServicioLogic;
import logic.TipoHabitacionLogic;
import logic.TipoServicioLogic;

/**
 * Servlet implementation class TarjetaServlet
 */
@WebServlet({ "/Detalles", "/detalles" })
public class DetallesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetallesServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object usuarioActual = request.getSession().getAttribute("usuarioActual");
		if (usuarioActual == null) {
			response.sendRedirect("login");
			return;
		}
		// Obtener reserva actual
		int resId = Integer.parseInt(request.getParameter("id_reserva"));
		TipoServicioLogic tsLogic = new TipoServicioLogic();
		ServicioLogic servLogic = new ServicioLogic();
		ReservaLogic resLogic = new ReservaLogic();
		try {
			ArrayList<TipoServicio> tipoServicios = tsLogic.getAll();
			ArrayList<Servicio> serviciosPedidos = servLogic.getFromReserva(resId);
			Reserva reserva = resLogic.getOne(resId);
			float precioBase = reserva.getPrecioBase();
			long diasDuracion = (reserva.getFechaFin().getTime() - reserva.getFechaInicio().getTime()) / (1000*3600*24);
			float costoPorDia = precioBase/diasDuracion;

			request.setAttribute("resId", resId);
			request.setAttribute("reserva", reserva);
			request.setAttribute("servicios_pedidos", serviciosPedidos);
			request.setAttribute("tipoServicios", tipoServicios);
			request.setAttribute("costo_dia", costoPorDia);
			RequestDispatcher requestDispatcher;
			requestDispatcher = request.getRequestDispatcher("detalles_reserva.jsp");
			requestDispatcher.forward(request, response);
			return;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher requestDispatcher;
			requestDispatcher = request.getRequestDispatcher("home.jsp");
			requestDispatcher.forward(request, response);
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
