package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.Usuario;


public class DataAdmin {
	public ArrayList<Usuario> getAll() throws Exception{
		
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<Usuario> usuarios= new ArrayList<Usuario>();

		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();
			rs = stmt.executeQuery("select * from usuario");
			if(rs!=null){
				while(rs.next()){
					Usuario usr = new Usuario();
					usr.setId(rs.getInt("id_usuario"));
					usr.setEmail(rs.getString("email"));
					usr.setContrasena(rs.getString("password"));
					usuarios.add(usr);
					// System.out.println(usr.getId());
					// System.out.println(usr.getEmail());
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
		
		return usuarios;
	}

}
