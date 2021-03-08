package servlets;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
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

		RequestDispatcher requestDispatcher;

		// Si en la URL le mandaste el mail de un usurio, le reenv�a el mail de verificaci�n
		String emailAccount = request.getParameter("acc");

		if(emailAccount == null) {

			requestDispatcher = request.getRequestDispatcher("login.jsp");	// por defecto, te manda al login

	        requestDispatcher.forward(request, response);

		}
		else if(emailAccount.equals("")) {
			// Si el mail viene vac�o, tambi�n te mando al home
			System.out.println("URL con email vac�o para reenviar");
			requestDispatcher = request.getRequestDispatcher("login.jsp");
			requestDispatcher.forward(request, response);
		}
		else {
			// Se fija que efectivamente no est� registrado
			UsuarioLogic usrLogic = new UsuarioLogic();
			try {

				Usuario usuarioReenvio = usrLogic.getOne(emailAccount);

				if(!usuarioReenvio.isEmpty()) {
					// El usuario existe

					if( !((Cliente)usuarioReenvio).getVerificado() ) {
						// El usuario no est� verificado

						System.out.println("Reenviando mail de verifiaci�n a: " + emailAccount);

						String friendlyID = ((Cliente)usuarioReenvio).getFriendlyID();
						this.sendEmail(emailAccount, friendlyID);

						String alert = "Revisa tu correo para acceder al link de verificaci�n";
						request.setAttribute("alert", alert);
						request.setAttribute("alert_mode", "success");
						request.setAttribute("alert_title", "Reenv�o confirmado");

						System.out.println("Reenvio completo. Volviendo a home");

						requestDispatcher = request.getRequestDispatcher("home.jsp");
				        requestDispatcher.forward(request, response);

					}
					else {
						// El usuario ya est� verificado
						System.out.println("La cuenta ya est� verificada: " + emailAccount);

						String alert = "El usuario que intenta verificar ya puede iniciar sesi�n en la p�gina.";
						request.setAttribute("alert", alert);
						request.setAttribute("alert_mode", "warning");
						request.setAttribute("alert_title", "El usuario ya est� verificado");

						requestDispatcher = request.getRequestDispatcher("home.jsp");
				        requestDispatcher.forward(request, response);
					}

				}
				else {
					// No existe el usuario.
					System.out.println("No existe un usuario con el email: " + emailAccount);

					String alert = "Intent� nuevamente m�s tarde o comunicate con nosotros.";
					request.setAttribute("alert", alert);
					request.setAttribute("alert_mode", "danger");
					request.setAttribute("alert_title", "No se pudo enviar el correo de verificaci�n");

					requestDispatcher = request.getRequestDispatcher("home.jsp");
			        requestDispatcher.forward(request, response);
				}
			} catch (Exception e) {
				// No se pudo reenviar el mail
				System.out.println("No se pudo reenviar el mail de verificacion a : " + emailAccount);
				e.printStackTrace();

				String alert = "Intent� nuevamente m�s tarde o comunicate con nosotros.";
				request.setAttribute("alert", alert);
				request.setAttribute("alert_mode", "danger");
				request.setAttribute("alert_title", "No se puede reenviar el correo de verificaci�n");

				requestDispatcher = request.getRequestDispatcher("home.jsp");
		        requestDispatcher.forward(request, response);
			}
		}
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

				String alert = "El n�mero de documento '" + dni +"' ya pertenece a un usuario registrado";
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
				// Si esta funci�n no activa el catch, sale del servlet por s� misma
				this.sendEmail(username, friendlyID);


				System.out.println("Se ejecuto el envio de mail " + username);

				String alert = "Enviamos un correo a '" + username + "' para verificar tu usuario";
				request.setAttribute("alert", alert);
				request.setAttribute("alert_mode", "success");
				request.setAttribute("alert_title", "Se cre� tu cuenta de usaurio en ArrozTower!");


		        requestDispatcher = request.getRequestDispatcher("home.jsp");
		        requestDispatcher.forward(request, response);

				return;
			}
			catch (Exception ex) {
				// No se pudo mandar el mail
				System.out.println("Error al enviar el mail");

				// Muestra el error en el login
				String alert = "Hubo un error tratando de crear tu usuario. Intenta m�s tarde";
				request.setAttribute("alert", alert);
				request.setAttribute("alert_mode", "danger");
				request.setAttribute("alert_title", "Ups...");

				session.setAttribute("usuarioActual", null);

				// Borra el usuario reci�n creado de la DB
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
			String alert = "Hubo un error tratando de crear tu usuario. Intenta m�s tarde";
			request.setAttribute("alert", alert);
			request.setAttribute("alert_mode", "danger");
			request.setAttribute("alert_title", "Ups...");

			session.setAttribute("usuarioActual", null);

			requestDispatcher = request.getRequestDispatcher("login.jsp");
	        requestDispatcher.forward(request, response);
		}
	}

	private void sendEmail(String username, String friendlyID) throws AddressException, MessagingException{


		EmailDelivery enviarmail = new EmailDelivery(username, friendlyID);
		enviarmail.sendEmail();

        return;
	}

}
