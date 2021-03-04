package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Cliente;
import entities.Reserva;
import entities.Usuario;
import entities.Admin;
import logic.ReservaLogic;
import logic.UsuarioLogic;
import util.Encode;

/**
 * Servlet implementation class MisReservasServlet
 */
@WebServlet({ "/usuario", "/Usuario" })
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsuarioServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object usuarioActual = request.getSession().getAttribute("usuarioActual");
		if (usuarioActual == null) {
			System.out.println("Usuario no loggeado. Lo mando al login");
			response.sendRedirect("login");
			return;
		} else {
			try {
				Usuario user = (Usuario) usuarioActual;
				request.setAttribute("usuario", user);
				RequestDispatcher requestDispatcher;
				requestDispatcher = request.getRequestDispatcher("usuario.jsp");
				requestDispatcher.forward(request, response);
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher;
		System.out.println(request.getParameter("user_id"));
		int userId = Integer.parseInt(request.getParameter("user_id"));
		System.out.println("userID");

		UsuarioLogic usrLogic = new UsuarioLogic();

		System.out.println("userlogic");
		try {
			System.out.println("try");
			// Busca el usuario con el mail ingresado
			Usuario user = usrLogic.getOne(userId);
			System.out.println("getone");
			if (user.isAdmin()) {
				System.out.println("userisadmin");
				// El usuario admin no tiene reservas
				System.out.println("El usuario admin no tiene reservas");

				String alert = "No hay reservas para el usuario admin";
				request.setAttribute("alert", alert);
				request.setAttribute("alert_mode", "warning");
				request.setAttribute("alert_title", "Error buscando reservas");


				requestDispatcher = request.getRequestDispatcher("home.jsp");
				requestDispatcher.forward(request, response);
				return;
			}
			System.out.println("noadmin");

			Cliente usuarioEncontrado = (Cliente) user;
			System.out.println("cliente");
			if (!usuarioEncontrado.isEmpty()) {
				System.out.println("noempty");
				// Hay un usuario con esta id
				request.setAttribute("usuario", usuarioEncontrado);

				requestDispatcher = request.getRequestDispatcher("usuario.jsp");
				System.out.println("123");
				requestDispatcher.forward(request, response);
				System.out.println("pre");
				return;
			}

			// Si llegaste a esta línea es porque no existe el usuario
			System.out.println("No se encuentra el usuario con la ID especificada");

			String alert = "No se encuentra el usuario con la ID especificada";
			request.setAttribute("alert", alert);
			request.setAttribute("alert_mode", "warning");
			request.setAttribute("alert_title", "Error buscando el usuario");

			requestDispatcher = request.getRequestDispatcher("mis_reservas.jsp");
			requestDispatcher.forward(request, response);
			return;

		} catch (Exception e) {
			System.out.println("Error al buscar la reserva");
			e.printStackTrace(); // Si esto muestra el error en la página, hay que sacarlo

			// Muestra el error general en el login
			String alert = "Hubo un error buscando el usuario. Intenta más tarde";
			request.setAttribute("alert", alert);
			request.setAttribute("alert_mode", "danger");
			request.setAttribute("alert_title", "Ups... ");

			requestDispatcher = request.getRequestDispatcher("home.jsp");
			requestDispatcher.forward(request, response);
		}
	}

}
