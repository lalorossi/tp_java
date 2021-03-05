package servlets;

import java.io.IOException;
import java.util.ArrayList;
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
		System.out.println("Cancelando la reserva: " + request.getParameter("id_reserva"));
		ReservaLogic reservaLogic = new ReservaLogic();
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
	}

}
