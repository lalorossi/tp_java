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

import database.DataAdmin;
import entities.Usuario;
import logic.UsuarioLogic;
import util.Encode;

/**
 * Servlet implementation class RegistroServlet
 */
@WebServlet({ "/registro", "/Registro" })
public class RegistroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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

		String username = request.getParameter("reg-email");
		String password = request.getParameter("reg-password");
		password = Encode.md5(password);


		UsuarioLogic usrLogic = new UsuarioLogic();

		try {

			Usuario usuarioEncontrado = usrLogic.getOne(username);
			System.out.println("ID: " + usuarioEncontrado.getId());
			 // if(usuarioEncontrado.getId() != -1) {
			if(!usuarioEncontrado.isEmpty()) {
				// Si ya existe un usuario con ese email
				System.out.println("Ya existe ese usuario");

				String alert = "El email ingresado ya pertenece a un usuario registrado";
				request.setAttribute("alert", alert);

				requestDispatcher = request.getRequestDispatcher("login.jsp");	 
		        requestDispatcher.forward(request, response);
		        return;
			}
			else {
				// El email no pertenece a ningun usuario
				System.out.println("Se va a crear un nuevo usuario");
				
				Usuario nuevoUsuario = new Usuario();
				nuevoUsuario.setEmail(username);
				nuevoUsuario.setContrasena(password);
				nuevoUsuario.setNombre( request.getParameter("reg-nombre") );
				nuevoUsuario.setApellido( request.getParameter("reg-apellido") );
				nuevoUsuario.setDni( request.getParameter("reg-documento") );
				nuevoUsuario.setTelefono( request.getParameter("reg-telefono") );
				nuevoUsuario.setPais( request.getParameter("reg-pais") );
				nuevoUsuario.setCiudad( request.getParameter("reg-ciudad") );
				nuevoUsuario.setCodigo_postal( Integer.parseInt(request.getParameter("reg-cp")) );
				nuevoUsuario.setDireccion( request.getParameter("reg-direccion") );

				System.out.println("Datos ingresados correctos para el nuevo usuario");

				usrLogic.Create(nuevoUsuario);
				System.out.println("Usuario creado exitosamente");

				HttpSession session = request.getSession();
				session.setAttribute("usuarioActual", usuarioEncontrado);

		        requestDispatcher = request.getRequestDispatcher("home.jsp");
		        requestDispatcher.forward(request, response);
		        return;
			}

		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("Error al crear el usuario");
			e.printStackTrace();	// Si esto muestra el error en la página, hay que sacarlo

			// Muestra el error general en el login
			String alert = "Ups... Hubo un error tratando de crear tu usuario. Intenta más tarde";
			request.setAttribute("alert", alert);

			requestDispatcher = request.getRequestDispatcher("login.jsp");
	        requestDispatcher.forward(request, response);
		}
	}

}
