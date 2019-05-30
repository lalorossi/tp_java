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

import entities.EventoTarjeta;
import entities.Tarjeta;
import logic.EventosLogic;
import logic.TarjetaLogic;

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

		String resp = "";

		response.setContentType("text/plain");
		// response.getWriter().write(greetings);

		try {
			// Busca eventos nuevos en la DB
			ArrayList<EventoTarjeta> nuevosEventos = (new EventosLogic()).getFromDate(fromDate);
			System.out.println("Se encontraron: " + nuevosEventos.size() + " eventos");

			if(nuevosEventos.size()>0){
				// Si hay eventos, mapea los objetos a una lista JSON

				TarjetaLogic tarjetaLogic = new TarjetaLogic();

				JSONArray list = new JSONArray();

				for(int i=0; i<nuevosEventos.size(); i++) {

					JSONObject obj = new JSONObject();

					int idTarjeta = nuevosEventos.get(i).getIdTarjeta();
					resp += "(" + Integer.toString(idTarjeta) + ")";
					obj.put("idTarjeta", idTarjeta);

					// Si la tarjeta está activa, el toast es warning (amarillo) y si no, es danger (rojo)
					if(tarjetaLogic.getOne(idTarjeta).getEstado() == Tarjeta.Estado.activa) {
						obj.put("estado", "warning");
					}
					else {
						obj.put("estado", "danger");
					}

					list.add(obj);
				}

				StringWriter out = new StringWriter();
				list.writeJSONString(out);
				String jsonText = out.toString();

				System.out.println(jsonText);

				// Vuelve al JSP con el JSON de los eventos
				response.getWriter().write(jsonText);

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
