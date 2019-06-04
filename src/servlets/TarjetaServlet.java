package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Evento;
import logic.EventosLogic;

/**
 * Servlet implementation class TarjetaServlet
 */
@WebServlet("/pasarTarjeta")
public class TarjetaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TarjetaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher requestDispatcher;

		// Checkea si la request viene del boton de mandar consulta o de reserva
		String submitTarjeta = request.getParameter("id_tarjeta");
		String submitUsuario = request.getParameter("id_usuario");

		Evento evt = new Evento();
		evt.setHoraEvento(new Date());

		if (submitTarjeta == null) {
			// Tocaste el botón de usuario
			evt.setTipo(Evento.Tipos.usuario);
			System.out.println("Pasando tarjeta " + submitUsuario);
			evt.setIdRelacionado(Integer.parseInt(submitUsuario));
		}
		else {
			// Tocaste el botón de tarjeta
			evt.setTipo(Evento.Tipos.tarjeta);
			System.out.println("Pasando tarjeta " + submitTarjeta);
			evt.setIdRelacionado(Integer.parseInt(submitTarjeta));
		}

		try {
			(new EventosLogic()).create(evt);
			requestDispatcher = request.getRequestDispatcher("pasarTarjeta.jsp");
	        requestDispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
