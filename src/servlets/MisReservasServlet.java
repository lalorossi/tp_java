package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Reserva;
import entities.Usuario;
import logic.ReservaLogic;

/**
 * Servlet implementation class MisReservasServlet
 */
@WebServlet({ "/MisReservas", "/misReservas", "/misreservas" })
public class MisReservasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MisReservasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object usuarioActual = request.getSession().getAttribute("usuarioActual");
		if (usuarioActual == null) {
			System.out.println("Usuario no loggeado. Lo mando al login");
			response.sendRedirect("login");
			return;
		}
	    else {
	    	ReservaLogic reservaLogic = new ReservaLogic();
			int idUsuario = ((Usuario)usuarioActual).getId();
			try {
				ArrayList<Reserva> reservasDeUsuario = reservaLogic.getReservasDeUsuario(idUsuario);
				request.setAttribute("reservasDeUsuario", reservasDeUsuario);
				RequestDispatcher requestDispatcher;
				requestDispatcher = request.getRequestDispatcher("mis_reservas.jsp");
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Cancelando la reserva: " + request.getParameter("id_reserva"));
		response.sendRedirect("misreservas");
	}

}
