package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.EventoTarjeta;
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
		String submitAction = request.getParameter("id_tarjeta");

		EventoTarjeta evtTar = new EventoTarjeta();
		evtTar.setHoraEvento(new Date());

		/* Esta es una manera muy básica de pasar tarjeta sabiendo que hay 3 tarjetas posibles */
		if (submitAction == null) {
			System.out.println("No sé cómo llegaste acá si no apretaste ningún botón");
		}

		else if (submitAction.equals("1")) {
			System.out.println("Pasando tarjeta 1");
			evtTar.setIdTarjeta(1);
		}

		else if (submitAction.equals("2")) {
			System.out.println("Pasanado tarjeta 2");
			evtTar.setIdTarjeta(2);
		}

		else if (submitAction.equals("3")) {
			System.out.println("Pasando tarjeta 3");
			evtTar.setIdTarjeta(3);
		}

		try {
			(new EventosLogic()).create(evtTar);
			requestDispatcher = request.getRequestDispatcher("pasarTarjeta.jsp");
	        requestDispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
