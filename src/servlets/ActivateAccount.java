package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Cliente;
import entities.Usuario;
import logic.UsuarioLogic;
import util.Encode;

/**
 * Servlet implementation class ActivateAccount
 */
@WebServlet({ "/ActiveAccount" })
public class ActivateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivateAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher requestDispatcher;

		// response.getWriter().append("Served at: ").append(request.getContextPath());

		String friendlyID = request.getParameter("k");

		if(friendlyID == null) {
			// Si llegaste al servlet sin datos en la URL, te mando al home
			System.out.println("URL sin key para validar");
			requestDispatcher = request.getRequestDispatcher("home.jsp");
			requestDispatcher.forward(request, response);
			return;
		}
		else if(friendlyID.equals("")) {
			// Si la friendlyID viene vac�a, tambi�n te mando al home
			System.out.println("URL con key vacia para validar");
			requestDispatcher = request.getRequestDispatcher("home.jsp");
			requestDispatcher.forward(request, response);
			return;
		}

		// TODO si las claves no son vac�as

		UsuarioLogic usrLogic = new UsuarioLogic();

		try {

			Usuario usr = usrLogic.getOneByFriendlyID(friendlyID);

			if(!usr.isEmpty()) {
				System.out.println("Existe el usuario a verificar. friendlyID: " + friendlyID);

				if( ((Cliente)usr).getVerificado() ) {
					// El usuario ya estaba verificado

					System.out.println("Ya est� verificado el usuario con la friendly ID: " + friendlyID);

					String alert = "El usuario que intenta verificar ya puede iniciar sesi�n en la p�gina.";
					request.setAttribute("alert", alert);
					request.setAttribute("alert_mode", "warning");
					request.setAttribute("alert_title", "Este usuario ya est� verificado");

				}
				else {
					System.out.println("El usuario no est� a�n verificado. friendlyID: " + friendlyID);

					// Comprueba que al generar nuevamente la friendlyID para el usuario, coincida con la de la URL (Seguridad MUY REDUNDANTE)
					String friendlyID2 = Encode.friendlyID( ((Cliente)usr).getDni(), usr.getEmail());
					if(friendlyID.equals(friendlyID2)) {
						// Verifica el usuario cambiando el campo "verificado" en la DB
						usrLogic.Activar(usr);

						// Comprueba que el usuario est� verificado en la DB
						Usuario usr2 = usrLogic.getOne(usr.getId());

						if( ((Cliente)usr2).getVerificado() ) {
							// El usuario se verific� correctamente

							System.out.println("Se verific� correctamente el usuario con la friendly ID: " + friendlyID);

							String alert = "Email confirmado con �xito. Ya pod�s ingresar como usuario";
							request.setAttribute("alert", alert);
							request.setAttribute("alert_mode", "success");
							request.setAttribute("alert_title", "Usuario verificado!");
						}
						else {
							// El usuario no se pudo verificar

							System.out.println("Fall� (EN LA DB) la verificaci�n del usuario con la friendly ID: " + friendlyID);

							String alert = "El usuario no se pudo verificar correctamente. Intente nuevamente m�s tarde.";
							request.setAttribute("alert", alert);
							request.setAttribute("alert_mode", "danger");
							request.setAttribute("alert_title", "No se pudo verificar el usuario");
						}
					}
					else {
						// Fall� la comprobaci�n de friendlyID

						System.out.println("No existe un usuario con la friendly ID: " + friendlyID);

						String alert = "El link de activaci�n no es v�lido. Intente m�s tarde o comun�quese con nostros.";
						request.setAttribute("alert", alert);
						request.setAttribute("alert_mode", "danger");
						request.setAttribute("alert_title", "No se pudo verificar el usuario");
					}
				}
			}
			else {
				// No existe el usaurio con la friendlyID del link

				System.out.println("No existe un usuario con la friendly ID: " + friendlyID);

				String alert = "El link de activaci�n no es v�lido. Intente m�s tarde o comun�quese con nostros.";
				request.setAttribute("alert", alert);
				request.setAttribute("alert_mode", "danger");
				request.setAttribute("alert_title", "No se pudo verificar el usuario");
			}
		} catch (Exception ex) {
			System.out.println("Error al verificar el usuario" + ex);

			String alert = "Hubo un error interno intentando verificar el usuario. Por favor intente nuevamente m�s tarde";
			request.setAttribute("alert", alert);
			request.setAttribute("alert_mode", "success");
			request.setAttribute("alert_title", "No se pudo verificar el usuario");

		}

		requestDispatcher = request.getRequestDispatcher("home.jsp");
		requestDispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
