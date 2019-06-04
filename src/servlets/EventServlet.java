package servlets;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


import java.io.IOException;
import java.io.StringWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Evento;
import entities.Tarjeta;
import logic.EventosLogic;
import logic.TarjetaLogic;
import logic.UsuarioLogic;

/**
 * Servlet implementation class AjaxServlet
 */
@WebServlet("/EventServlet")
public class EventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String fromDate = request.getParameter("fromDate").trim();

		String respuesta = "";

		response.setContentType("text/plain");
		// response.getWriter().write(greetings);

		try {
			// Busca eventos nuevos en la DB
			ArrayList<Evento> nuevosEventos = (new EventosLogic()).getFromDate(fromDate);
			System.out.println("Se encontraron: " + nuevosEventos.size() + " eventos");

			if(nuevosEventos.size()>0){
				// Si hay eventos, mapea los objetos a una lista JSON

				TarjetaLogic tarjetaLogic = new TarjetaLogic();

				JSONArray listaJson = new JSONArray();

				for(int i=0; i<nuevosEventos.size(); i++) {

					JSONObject objetoJson = new JSONObject();

					int idRelacionado = nuevosEventos.get(i).getIdRelacionado();
					Evento.Tipos tipoEvento = nuevosEventos.get(i).getTipo();
					respuesta += "(" + Integer.toString(idRelacionado) + ")";
					//objetoJson.put("idRelacionado", idRelacionado);

					System.out.println(tipoEvento.toString());

					switch(tipoEvento) {
					case tarjeta:
						// Si la tarjeta est� activa, el toast es warning (amarillo) y si no, es danger (rojo)
						if(tarjetaLogic.getOne(idRelacionado).getEstado() == Tarjeta.Estado.activa) {
							objetoJson.put("estado", "warning");
						}
						else {
							objetoJson.put("estado", "danger");
						}
						objetoJson.put("label", "tarjeta nro: ");
						objetoJson.put("data", idRelacionado);
						break;

					case usuario:
						objetoJson.put("estado", "success");

						// Busca el email de usuario en la DB
						String email = (new UsuarioLogic()).getOne(idRelacionado).getEmail();

						objetoJson.put("label", "Email de usuario: ");
						objetoJson.put("data", email);
					default:
						break;
					}

					listaJson.add(objetoJson);
				}

				StringWriter out = new StringWriter();
				listaJson.writeJSONString(out);
				String textoJson = out.toString();

				System.out.println(textoJson);

				// Vuelve al JSP con el JSON de los eventos
				response.getWriter().write(textoJson);

			}
			else {
				// Si no hay eventos
				response.getWriter().write("");
			}
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
