package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import entities.Tarjeta;
import entities.Usuario;

public class TarjetaData {
	public Tarjeta getOne(int idTarjeta) throws Exception{

		Statement stmt=null;
		ResultSet rs=null;
		Tarjeta trj = new Tarjeta();

		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();
			rs = stmt.executeQuery("select * from tarjetas where id_tarjeta = '" + idTarjeta + "'");
			if(rs!=null){
				while(rs.next()){
					trj.setId(rs.getInt("id_tarjeta"));
					// MyEnum.valueOf(rs.getString("EnumColumn"));
					Tarjeta.Estado state = Tarjeta.Estado.valueOf(rs.getString("estado"));
					trj.setEstado(state);
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

		return trj;
	}
}
