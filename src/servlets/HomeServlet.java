package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.*;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet({"/home", "/Home"})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public HomeServlet() {
    	// Esto lo hace siempre que se carga la página
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher requestDispatcher;

		// antes tiene que fijarse que la URL no tenga datos para procesar
		requestDispatcher = request.getRequestDispatcher("home.jsp");	// Cuando llega por get, te manda al home.jsp

        requestDispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher requestDispatcher;

		// Checkea si la request viene del boton de mandar consulta o de reserva
		String submitAction = request.getParameter("submit");


		if (submitAction == null) {
			System.out.println("No sé cómo llegaste acá si no apretaste ningún botón");
		}

		else {

			switch(submitAction) {


				case "submit-consulta":
					System.out.println("Procesando el formulario de consulta");
					break;


				case "submit-reserva":
					System.out.println("Procesando el botón de reserva");

				    // Se fija si hay una sesión iniciada. Si no hay, te mada al login
				    Object usuarioActual = request.getSession().getAttribute("usuarioActual");
				    if(usuarioActual == null) {
						System.out.println("Usuario no loggeado. Lo mando al login");
						// No uso forward porque quiero que cambie la URL
						// requestDispatcher = request.getRequestDispatcher("login.jsp");
						// requestDispatcher.forward(request, response);
						response.sendRedirect("login");
						return;
				    }
				    else {
						// Te manda a la página de reserva
						System.out.println("Usuario loggeado. Lo mando a reservas");
						requestDispatcher = request.getRequestDispatcher("reserva.jsp");
						requestDispatcher.forward(request, response);
						return;
				    }


				case "submit-logout":
					// Saca el usuario de la session y te manda al login
					System.out.println("Sacando al usuario de la session");
					request.getSession().removeAttribute("usuarioActual");
					requestDispatcher = request.getRequestDispatcher("login.jsp");
					requestDispatcher.forward(request, response);
					break;


				default:
					System.out.println("No sé qué apretaste, pero llegaste acá");
					System.out.println("Apretaste el botón: " + submitAction);
					break;

			}
		}
	}

}
