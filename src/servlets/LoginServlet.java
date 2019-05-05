package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.UsuarioLogic;
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
		
		String username = request.getParameter("login-email");
		String password = request.getParameter("login-password");
		
		// System.out.println(username);
		// System.out.println(password);
		
		if(username.equals("admin@admin.com") && password.equals("admin")) {
			// System.out.println("entra");

			UsuarioLogic usrLogic = new UsuarioLogic();
			try {

				ArrayList<Usuario> usuarios = usrLogic.getAll();
				int flag = 0;
				for (int i=0; i<usuarios.size(); i++) {
				    System.out.println(usuarios.get(i).getEmail());
				    System.out.println(usuarios.get(i).getContrasena());
					if(usuarios.get(i).getEmail().equals(username) && usuarios.get(i).getContrasena().equals(password)) {
						flag=1;
						break;
					}
				}
				if(flag==1) {
					request.setAttribute("username", username);
					request.setAttribute("password", password);

			        requestDispatcher = request.getRequestDispatcher("home.jsp");
				}
				else {
					System.out.println("alerta");

					String alert = "Email de usuario o contraseña inválidos";
					request.setAttribute("alert", alert);

					requestDispatcher = request.getRequestDispatcher("login.jsp");
				}

		        requestDispatcher.forward(request, response);

			}
			catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("error");
				e.printStackTrace();
			}
		}
	}

}
