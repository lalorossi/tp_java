package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import entities.EventoTarjeta;
import entities.Usuario;

public class EventoData {

	public ArrayList<EventoTarjeta> getFromDate(String fromDate) throws Exception{
		// TODO hacer que el evento reciba el tipo Date
		Statement stmt=null;
		ResultSet rs=null;

		ArrayList<EventoTarjeta> evts = new ArrayList<EventoTarjeta>();

		System.out.println("Se buscan eventos a partir de: " + fromDate);

		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();
			rs = stmt.executeQuery("select * from eventos_tarjeta where hora_evento > '" + fromDate + "'");
			if(rs!=null){
				while(rs.next()){

					EventoTarjeta evt= new EventoTarjeta();

					evt.setIdTarjeta(rs.getInt("id_tarjeta"));
					evt.setHoraEvento(rs.getDate("hora_evento"));

					evts.add(evt);

				}
			}
		} catch (Exception e){
			throw e;
		}

		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			FactoryConection.getInstancia().releaseConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return evts;
	}

	public void Create(EventoTarjeta evtTar) throws Exception {
		Statement stmt=null;
		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();


			int idTarjeta = evtTar.getIdTarjeta();
			Date horaEvento = evtTar.getHoraEvento();

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String dateString = format.format( horaEvento );

			String sentencia = "insert into eventos_tarjeta "
					+ "(id_tarjeta, hora_evento) "
					+ "values ('"+ Integer.toString(idTarjeta) +"', '"+ dateString +"')";


			System.out.println("Se va a ejecutar la sentencia SQL: "+ sentencia);

			stmt.executeUpdate(sentencia);

			System.out.println("Sentencia SQL ejecutada con exito");
		} catch (Exception e){
			System.out.println("Error al crear el evento en la DB");
			throw e;
	}
	}


}
