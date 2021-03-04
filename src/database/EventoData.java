package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import entities.Evento;
import entities.Tarjeta;
import entities.Usuario;

public class EventoData {

	public ArrayList<Evento> getFromDate(String fromDate) throws Exception{
		// TODO hacer que el evento reciba el tipo Date
		Statement stmt=null;
		ResultSet rs=null;

		ArrayList<Evento> evts = new ArrayList<Evento>();

		// System.out.println("Se buscan eventos a partir de: " + fromDate);

		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();
			rs = stmt.executeQuery("select * from eventos where hora_evento > '" + fromDate + "'");
			if(rs!=null){
				while(rs.next()){

					Evento evt= new Evento();

					evt.setIdRelacionado(rs.getInt("id_relacionado"));
					evt.setHoraEvento(rs.getDate("hora_evento"));
					evt.setTipo(Evento.Tipos.valueOf(rs.getString("tipo_evento")));

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

	public void Create(Evento evt) throws Exception {
		Statement stmt=null;
		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();


			int idRelacionado = evt.getIdRelacionado();
			Date horaEvento = evt.getHoraEvento();
			String tipoEvento = evt.getTipo().toString();

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String dateString = format.format( horaEvento );

			String sentencia = "insert into eventos "
					+ "(id_relacionado, hora_evento, tipo_evento) "
					+ "values ('"+ Integer.toString(idRelacionado) +"', '"+ dateString +"', '" + tipoEvento + "')";


			System.out.println("Se va a ejecutar la sentencia SQL: "+ sentencia);

			stmt.executeUpdate(sentencia);

			System.out.println("Sentencia SQL ejecutada con exito");
		} catch (Exception e){
			System.out.println("Error al crear el evento en la DB");
			throw e;
	}
	}


}
