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

import logic.UsuarioLogic;
import util.Encode;
import entities.Usuario;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet({ "/Login", "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher requestDispatcher;
		
		// antes tiene que fijarse que la URL no tenga datos para procesar
		requestDispatcher = request.getRequestDispatcher("login.jsp");	// por defecto, te manda al login
 
        requestDispatcher.forward(request, response);
        
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		RequestDispatcher requestDispatcher;
		HttpSession session = request.getSession();
		
		String username = request.getParameter("login-email");
		String password = request.getParameter("login-password");
		password = Encode.md5(password);
		
		 System.out.println(username);
		 System.out.println(password);

		UsuarioLogic usrLogic = new UsuarioLogic();

		try {
			// Busca el usuario con el mail ingresado
			Usuario usuarioEncontrado = usrLogic.getOne(username);

			if(!usuarioEncontrado.isEmpty()) {
				// Hay un usuario con ese email
				System.out.println("Existe el email");

				// Checkea la contraseña guardada con la ingresada
				if(usuarioEncontrado.getContrasena().equals(password)) {
					System.out.println("Coinciden las contraseñas");

					// Si estás bien loggeado, te manda al home y guarda la session con el usuario
					session.setAttribute("usuarioActual", usuarioEncontrado);

			        requestDispatcher = request.getRequestDispatcher("home.jsp");
			        requestDispatcher.forward(request, response);
			        return;
				}
			}

			// Si llegaste a esta línea es porque erraste en usuario o contraseña
			System.out.println("Usuario o contraseña incorrectos");

			String alert = "Email de usuario o contraseña inválidos";
			request.setAttribute("alert", alert);

			session.setAttribute("usuarioActual", null);

			requestDispatcher = request.getRequestDispatcher("login.jsp");
	        requestDispatcher.forward(request, response);
	        return;

		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error al ingresar como usuario");
			e.printStackTrace();	// Si esto muestra el error en la página, hay que sacarlo

			// Muestra el error general en el login
			String alert = "Ups... Hubo un error tratando de iniciar sesion. Intenta más tarde";
			request.setAttribute("alert", alert);

			session.setAttribute("usuarioActual", null);

			requestDispatcher = request.getRequestDispatcher("login.jsp");
	        requestDispatcher.forward(request, response);
		}
	}

}
