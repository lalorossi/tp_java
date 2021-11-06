package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Reserva;
import entities.Usuario;
import logic.ReservaLogic;
import logic.UsuarioLogic;

/**
 * Servlet implementation class AdminReservasServlet
 */
@WebServlet({ "/AdminReservas", "/adminReservas", "/adminreservas" })
public class AdminReservasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReservasServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		if (!((Usuario)usuarioActual).isAdmin()) {
			System.out.println("Usuario no admin, lo mando al home");
			response.sendRedirect("home");
			return;
		}
	    else {
	    	ReservaLogic reservaLogic = new ReservaLogic();
			try {
				ArrayList<Reserva> reservas = reservaLogic.getAll();
				Map<String, ArrayList<Reserva>> reservaPorIdUsuario = new HashMap<String, ArrayList<Reserva>>();
				for (int i=0; i<reservas.size(); i++)
				{
					Reserva res = reservas.get(i);
					int userId = res.getIdCliente();
					if(reservaPorIdUsuario.containsKey(String.valueOf(userId))) {
						ArrayList<Reserva> temp = reservaPorIdUsuario.get(String.valueOf(userId));
						reservaPorIdUsuario.remove(String.valueOf(userId));
						temp.add(res);
						reservaPorIdUsuario.put(String.valueOf(userId), temp);
					}
					else {
						ArrayList<Reserva> temp = new ArrayList<Reserva>();
						temp.add(res);
						reservaPorIdUsuario.put(String.valueOf(userId), temp);
					}
				}
				Set<String> ids = reservaPorIdUsuario.keySet();
				UsuarioLogic usrLogic = new UsuarioLogic();
				ArrayList<Usuario> usuariosDeReserva = usrLogic.getAllInSet(ids);
				Map<Usuario, ArrayList<Reserva>> reservaPorMailUsuario = new HashMap<Usuario, ArrayList<Reserva>>();
				for(int i=0; i<usuariosDeReserva.size(); i++) {
					Usuario user = usuariosDeReserva.get(i);
					int id = user.getId();;
					ArrayList<Reserva> res = reservaPorIdUsuario.get(String.valueOf(id));
					reservaPorMailUsuario.put(user, res);
				}
				request.setAttribute("reservasPorUsuario", reservaPorMailUsuario);
				RequestDispatcher requestDispatcher;
				requestDispatcher = request.getRequestDispatcher("admin_reservas.jsp");
				requestDispatcher.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher;
		String action = request.getParameter("action");
		String idReserva = request.getParameter("id_reserva");

		if(action == null || idReserva == null) {
			System.out.println("No se especifica una acci�n o id de reserva");
			String alert = "No se puede procesar la acci�n";
			request.setAttribute("alert", alert);
			request.setAttribute("alert_mode", "danger");
			request.setAttribute("alert_title", "Error accediendo a la reserva");


			requestDispatcher = request.getRequestDispatcher("home.jsp");
			requestDispatcher.forward(request, response);
			return;
		}

		ReservaLogic reservaLogic = new ReservaLogic();

		switch(action) {
			case "check_in":
				System.out.println("Check in de la reserva: " + idReserva);
				try {
					boolean hold = reservaLogic.retenida(Integer.parseInt(idReserva));
					// Si se tiene que holdear la reserva, porque otra reserva est� reteniendo las habitaciones
					if(hold) {
						reservaLogic.retener(Integer.parseInt(idReserva));
						System.out.println("No hay habitacinoes disponibles para hacer el check in");
						String alert = "Hay otra reserva en curso que no permite ocupar las habitaciones";
						request.setAttribute("alert", alert);
						request.setAttribute("alert_mode", "danger");
						request.setAttribute("alert_title", "La reserva debe ser retenida");
					}
					else {
						reservaLogic.checkIn(Integer.parseInt(idReserva));
						System.out.println("Check in completo");
						request.setAttribute("alert", "");
						request.setAttribute("alert_mode", "success");
						request.setAttribute("alert_title", "Check in completado");
					}
				}catch (Exception e) {
					e.printStackTrace();
					String alert = "Hubo un error interno durante el proceso";
					request.setAttribute("alert", alert);
					request.setAttribute("alert_mode", "danger");
					request.setAttribute("alert_title", "No se pudo completar el check in");
				}
				break;
			case "check_out":
				System.out.println("Check out de la reserva: " + idReserva);
				try {
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
					String fechaActual = formatter.format(new Date(System.currentTimeMillis()));
					reservaLogic.checkOut(Integer.parseInt(idReserva));
					// Si la fecha de salida es mayor a la fecha_fin, calcular recargo
					// Si la fecha_ingreso_real es mayor a fecha_inicio, calcular descuentoSystem.out.println("Check in completo");
					request.setAttribute("alert", "");
					request.setAttribute("alert_mode", "success");
					request.setAttribute("alert_title", "Check out completado");
				}catch (Exception e) {
					e.printStackTrace();
					String alert = "Hubo un error interno durante el proceso";
					request.setAttribute("alert", alert);
					request.setAttribute("alert_mode", "danger");
					request.setAttribute("alert_title", "No se pudo completar el check out");
				}
				break;
			case "cancelar":
				System.out.println("Cancelando la reserva: " + request.getParameter("id_reserva"));
				try {
					reservaLogic.cancelarReservar(Integer.parseInt(request.getParameter("id_reserva")));
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				response.sendRedirect("adminreservas");
				break;
		}
		requestDispatcher = request.getRequestDispatcher("home.jsp");
		requestDispatcher.forward(request, response);
		return;
	}

}
