package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.Usuario;

public class UsuarioData {
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
	
	public void Create(Usuario usr) throws Exception {
		Statement stmt=null;
		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();
			String email = usr.getEmail();
			String password = usr.getContrasena();
			int dni = usr.getDni();
			String nombre = usr.getNombre();
			int telefono = usr.getTelefono();
			
			String sentencia = "insert into usuario"
					+ "(email, password, dni, nombre, apellido, telefono)"
					+ "values ('" + email + "', '" + password + "', '" + dni + "', '" + nombre + "', '" + nombre + "', '" + telefono + "')";
			
			System.out.println("Se va a ejecutar la sentencia SQL: "+ sentencia);
			
			stmt.executeUpdate(sentencia);
			
			System.out.println("Sentencia SQL ejecutada con exito");
		} catch (Exception e){
			System.out.println("Error al crear el usuario en la DB");
			throw e;
		}
	}

}
