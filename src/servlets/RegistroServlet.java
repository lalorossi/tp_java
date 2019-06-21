package servlets;

import java.io.Console;
import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Cliente;
import entities.Usuario;
import logic.UsuarioLogic;
import util.Encode;
import util.EmailDelivery;

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
	@Override
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
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		RequestDispatcher requestDispatcher;
		HttpSession session = request.getSession();

		String username = request.getParameter("reg-email");
		String password = request.getParameter("reg-password");
		String dni = request.getParameter("reg-documento");
		password = Encode.md5(password);

		UsuarioLogic usrLogic = new UsuarioLogic();

		try {

			Usuario usuarioEncontrado = usrLogic.getOne(username);
			System.out.println("ID: " + usuarioEncontrado.getId());
			 // if(usuarioEncontrado.getId() != -1) {
			if(!usuarioEncontrado.isEmpty()) {
				// Si ya existe un usuario con ese email
				System.out.println("Ya existe ese usuario");

				String alert = "El email '" + username + "' ya pertenece a un usuario registrado";
				request.setAttribute("alert", alert);
				request.setAttribute("alert_mode", "warning");
				request.setAttribute("alert_title", "No se puede registrar el usuario");

				session.setAttribute("usuarioActual", null);

				requestDispatcher = request.getRequestDispatcher("login.jsp");
		        requestDispatcher.forward(request, response);
		        return;
			}
			// El email no pertenece a ningun usuario
			usuarioEncontrado = usrLogic.getOneByDNI(dni);

			if(!usuarioEncontrado.isEmpty()) {

				// Si ya existe un usuario con ese dni
				System.out.println("Ya existe ese DNI de usuario");

				String alert = "El número de documento '" + dni +"' ya pertenece a un usuario registrado";
				request.setAttribute("alert", alert);
				request.setAttribute("alert_mode", "warning");
				request.setAttribute("alert_title", "No se puede registrar el usuario");

				session.setAttribute("usuarioActual", null);

				requestDispatcher = request.getRequestDispatcher("login.jsp");
		        requestDispatcher.forward(request, response);
		        return;
			}

			System.out.println("Se va a crear un nuevo usuario");

			Cliente nuevoCliente = new Cliente();
			nuevoCliente.setEmail(username);
			nuevoCliente.setContrasena(password);
			nuevoCliente.setNombre( request.getParameter("reg-nombre") );
			nuevoCliente.setApellido( request.getParameter("reg-apellido") );
			nuevoCliente.setDni( request.getParameter("reg-documento") );
			nuevoCliente.setTelefono( request.getParameter("reg-telefono") );
			nuevoCliente.setPais( request.getParameter("reg-pais") );
			nuevoCliente.setCiudad( request.getParameter("reg-ciudad") );
			nuevoCliente.setCodigo_postal( Integer.parseInt(request.getParameter("reg-cp")) );
			nuevoCliente.setDireccion( request.getParameter("reg-direccion") );

			// Genera una friendly ID codificando el DNI con el email como "seed"
			String friendlyID = Encode.friendlyID(nuevoCliente.getDni(), nuevoCliente.getEmail());
			nuevoCliente.setFriendlyID(friendlyID);
			System.out.println("Friendly ID del usuario: " + friendlyID);

			System.out.println("Datos ingresados correctos para el nuevo usuario");

			usrLogic.Create(nuevoCliente);
			System.out.println("Usuario creado exitosamente");

			try {

				EmailDelivery enviarmail = new EmailDelivery(username, friendlyID);
				enviarmail.sendEmail();

				System.out.println("Se ejecuto el envio de mail " + username);

				String alert = "Enviamos un correo a '" + username + "' para verificar tu usuario";
				request.setAttribute("alert", alert);
				request.setAttribute("alert_mode", "success");
				request.setAttribute("alert_title", "Se creó tu cuenta de usaurio en ArrozTower!");


		        requestDispatcher = request.getRequestDispatcher("home.jsp");
		        requestDispatcher.forward(request, response);
		        return;
		        // TODO Si no se pudo mandar el mail, hacer en un try catch diferente, que se borre el usuario en la DB, para que se pueda volver a registrar sin que le tire mail o dni repetido
			}
			catch (Exception ex) {
				// No se pudo mandar el mail
				System.out.println("Error al enviar el mail");

				// Muestra el error en el login
				String alert = "Hubo un error tratando de crear tu usuario. Intenta más tarde";
				request.setAttribute("alert", alert);
				request.setAttribute("alert_mode", "danger");
				request.setAttribute("alert_title", "Ups...");

				session.setAttribute("usuarioActual", null);

				// Borra el usuario recién creado de la DB
				nuevoCliente = (Cliente) usrLogic.getOne(username);
				usrLogic.Delete(nuevoCliente);

				requestDispatcher = request.getRequestDispatcher("login.jsp");
		        requestDispatcher.forward(request, response);

			}
		}
		catch (Exception e) {
			// No se pudo crear el usaurio
			System.out.println("Error al crear el usuario");
			e.printStackTrace();

			// Muestra el error en el login
			String alert = "Hubo un error tratando de crear tu usuario. Intenta más tarde";
			request.setAttribute("alert", alert);
			request.setAttribute("alert_mode", "danger");
			request.setAttribute("alert_title", "Ups...");

			session.setAttribute("usuarioActual", null);

			requestDispatcher = request.getRequestDispatcher("login.jsp");
	        requestDispatcher.forward(request, response);
		}
	}

}
