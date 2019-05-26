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
			rs = stmt.executeQuery("select * from usuarios");
			if(rs!=null){
				while(rs.next()){
					Usuario usr = new Usuario();
					usr.setId(rs.getInt("id_usuario"));
					usr.setEmail(rs.getString("email"));
					usr.setContrasena(rs.getString("password"));
					
					usr.setApellido(rs.getString("apellido"));
					usr.setNombre(rs.getString("nombre"));
					usr.setDireccion(rs.getString("direccion"));
					usr.setCiudad(rs.getString("ciudad"));					
					usr.setPais(rs.getString("pais"));					
					usr.setCodigo_postal(rs.getInt("codigo_postal"));
					usr.setDni(rs.getString("dni"));
					usr.setTelefono(rs.getString("telefono"));
					
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
	
	public Usuario getOne(int id_usuario) throws Exception{

		Statement stmt=null;
		ResultSet rs=null;
		Usuario usr = new Usuario();

		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();
			rs = stmt.executeQuery("select * from usuarios where id_usuario = '" + id_usuario + "'");
			if(rs!=null){
				while(rs.next()){
					usr.setId(rs.getInt("id_usuario"));
					usr.setEmail(rs.getString("email"));
					usr.setContrasena(rs.getString("password"));
					
					usr.setApellido(rs.getString("apellido"));
					usr.setNombre(rs.getString("nombre"));
					usr.setDireccion(rs.getString("direccion"));
					usr.setCiudad(rs.getString("ciudad"));					
					usr.setPais(rs.getString("pais"));					
					usr.setCodigo_postal(rs.getInt("codigo_postal"));
					usr.setDni(rs.getString("dni"));
					usr.setTelefono(rs.getString("telefono"));
					
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
		
		return usr;
	}
	
	public Usuario getOne(String email) throws Exception{
		
		Statement stmt=null;
		ResultSet rs=null;
		Usuario usr = new Usuario();

		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();
			String sentencia = "select * from usuarios where email = '" + email +"'";
			System.out.println("Se va a ejecutar la sentecnia SQL: " + sentencia);
			rs = stmt.executeQuery(sentencia);
			if(rs!=null){
				while(rs.next()){
					usr.setId(rs.getInt("id_usuario"));
					usr.setEmail(rs.getString("email"));
					usr.setContrasena(rs.getString("password"));
													
					//usr.setId_admin("id_admin");
					//usr.setId_usuario("id_usuario");
															
					usr.setApellido(rs.getString("apellido"));
					usr.setNombre(rs.getString("nombre"));
					usr.setDireccion(rs.getString("direccion"));
					usr.setCiudad(rs.getString("ciudad"));					
					usr.setPais(rs.getString("pais"));					
					usr.setCodigo_postal(rs.getInt("codigo_postal"));
					usr.setDni(rs.getString("dni"));
					usr.setTelefono(rs.getString("telefono"));
				
					
					//System.out.println(usr.getId());
					//System.out.println(usr.getEmail());
					//System.out.println(usr.getContrasena());
					//System.out.println(usr.getApellido());
					//System.out.println(usr.getNombre());
					//System.out.println(usr.getDireccion());
					//System.out.println(usr.getCiudad());
					//System.out.println(usr.getPais());
					//System.out.println(usr.getCodigo_postal());
					//System.out.println(usr.getDni());
					//System.out.println(usr.getTelefono());
					
				}

			}
		} catch (Exception e){
			System.out.println("Error al buscar el usuario en la DB");
			throw e;
		}
		
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			FactoryConection.getInstancia().releaseConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return usr;
	}
	
	public void Create(Usuario usr) throws Exception {
		Statement stmt=null;
		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();
			String email = usr.getEmail();
			String password = usr.getContrasena();
			String dni = usr.getDni();
			String nombre = usr.getNombre();
			String apellido = usr.getApellido();
			String telefono = usr.getTelefono();
			
			String ciudad = usr.getCiudad();
			String pais = usr.getPais();
			String codigo_postal = Integer.toString(usr.getCodigo_postal());
			String direccion = usr.getDireccion();
			
			
			String sentencia = "insert into usuarios "
					+ "(email, password, dni, nombre, apellido, telefono, ciudad, pais, codigo_postal, direccion) "
					+ "values ('" + email + "', '" + password + "', '" + dni + "', '" + nombre + "', '" + apellido + "', '" + telefono + "','" + ciudad + "', '" + pais + "','" + codigo_postal + "',   '" + direccion +"')";
			
			System.out.println("Se va a ejecutar la sentencia SQL: "+ sentencia);
			
			stmt.executeUpdate(sentencia);
			
			System.out.println("Sentencia SQL ejecutada con exito");
		} catch (Exception e){
			System.out.println("Error al crear el usuario en la DB");
			throw e;
		}
	}

}
