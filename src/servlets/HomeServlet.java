package servlets;

import java.io.IOException;
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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nombreDeUsuario = request.getParameter("usuario");
		String clave = request.getParameter("password");

		/*

			// Trata de encontrar un usuario por su nombre de usuario y contraseña
			 *
			Usuario usuarioActual = UsuarioLogic.LogTry(nombreDeUsuario, Contraseña);
			if (usuarioActual == null) {
				response.sendRedirect("/"); //Esto lo manda al login (raiz) si no hay un usuario seteado
			}


			// Ver si el usuario es admin o cliente
			 *
			 if(usuarioActual.tipoUsuario == "cliente"){
			 }
			 else if(usuarioActual.tipoUsuario == "admin"){
			 }

		*/

		/* ------------------------------- SOLO PARA PRUEBAS ------------------------------------------- */

		if(!nombreDeUsuario.equals("admin") || !clave.contentEquals("admin")) {
			/*
			 * Método 1: tratando de usar redirect y session
			*/
				request.getSession(false).setAttribute("mensaje", "No se encuentra el usuario");
				response.sendRedirect("/tp_java/"); //No está mostrando el mensaje
			/*
			 * Método 2: usando forward y request (o session, debería funcionar)
			request.getSession(false).setAttribute("mensaje", "No se encuentra el usuario");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			*/
			System.out.println("error de autenticacion");
			System.out.println(nombreDeUsuario + "-" + clave);
		}
		else {
			Cliente usuarioActual = new Cliente();
			//System.out.println(nombreDeUsuario);
			usuarioActual.setEmail(nombreDeUsuario);
			request.getSession(true).setAttribute("usuarioActual", usuarioActual);
			request.getRequestDispatcher("home.jsp").forward(request, response);
			// la otra es response.sendRedirect("home.jsp") pero no guarda la request
		}

		/* --------------------------------------------------------------------------------------------- */
	}

}
