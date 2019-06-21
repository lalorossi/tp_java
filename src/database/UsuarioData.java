package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.Admin;
import entities.Cliente;
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
					if(rs.getInt("id_admin")==0) {
						Cliente clt = new Cliente();
						clt.setId(rs.getInt("id_usuario"));
						clt.setEmail(rs.getString("email"));
						clt.setContrasena(rs.getString("password"));

						clt.setApellido(rs.getString("apellido"));
						clt.setNombre(rs.getString("nombre"));
						clt.setDireccion(rs.getString("direccion"));
						clt.setCiudad(rs.getString("ciudad"));
						clt.setPais(rs.getString("pais"));
						clt.setCodigo_postal(rs.getInt("codigo_postal"));
						clt.setDni(rs.getString("dni"));
						clt.setTelefono(rs.getString("telefono"));
						clt.setFriendlyID(rs.getString("friendly_id"));
						clt.setVerificado(rs.getBoolean("verificado"));

						usuarios.add(clt);
					}
					else {
						Admin adm = new Admin();
						adm.setId(rs.getInt("id_usuario"));
						adm.setEmail(rs.getString("email"));
						adm.setContrasena(rs.getString("password"));

						adm.setIdAdmin(rs.getInt("id_admin"));

						usuarios.add(adm);
					}

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
					if(rs.getInt("id_admin")==0) {
						Cliente clt = new Cliente();

						clt.setId(rs.getInt("id_usuario"));
						clt.setEmail(rs.getString("email"));
						clt.setContrasena(rs.getString("password"));

						clt.setApellido(rs.getString("apellido"));
						clt.setNombre(rs.getString("nombre"));
						clt.setDireccion(rs.getString("direccion"));
						clt.setCiudad(rs.getString("ciudad"));
						clt.setPais(rs.getString("pais"));
						clt.setCodigo_postal(rs.getInt("codigo_postal"));
						clt.setDni(rs.getString("dni"));
						clt.setTelefono(rs.getString("telefono"));
						clt.setFriendlyID(rs.getString("friendly_id"));
						clt.setVerificado(rs.getBoolean("verificado"));

						usr = clt;

					}
					else {
						Admin adm = new Admin();
						adm.setId(rs.getInt("id_usuario"));

						adm.setEmail(rs.getString("email"));
						adm.setContrasena(rs.getString("password"));

						adm.setIdAdmin(rs.getInt("id_admin"));

						usr = adm;

					}

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
					if(rs.getInt("id_admin") == 0) {
						Cliente clt = new Cliente();

						clt.setId(rs.getInt("id_usuario"));
						clt.setEmail(rs.getString("email"));
						clt.setContrasena(rs.getString("password"));

						clt.setApellido(rs.getString("apellido"));
						clt.setNombre(rs.getString("nombre"));
						clt.setDireccion(rs.getString("direccion"));
						clt.setCiudad(rs.getString("ciudad"));
						clt.setPais(rs.getString("pais"));
						clt.setCodigo_postal(rs.getInt("codigo_postal"));
						clt.setDni(rs.getString("dni"));
						clt.setTelefono(rs.getString("telefono"));
						clt.setFriendlyID(rs.getString("friendly_id"));
						clt.setVerificado(rs.getBoolean("verificado"));

						usr = clt;

					}
					else {
						Admin adm = new Admin();

						adm.setId(rs.getInt("id_usuario"));

						adm.setEmail(rs.getString("email"));
						adm.setContrasena(rs.getString("password"));

						adm.setIdAdmin(rs.getInt("id_admin"));

						usr = adm;

					}
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

	public Usuario getOneByFriendlyID(String friendlyID) throws Exception {

		Statement stmt=null;
		ResultSet rs=null;
		Usuario usr = new Usuario();

		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();
			String sentencia = "select * from usuarios where friendly_id = '" + friendlyID +"'";
			System.out.println("Se va a ejecutar la sentecnia SQL: " + sentencia);
			rs = stmt.executeQuery(sentencia);
			if(rs!=null){
				while(rs.next()){
					if(rs.getInt("id_admin") == 0) {
						Cliente clt = new Cliente();

						clt.setId(rs.getInt("id_usuario"));
						clt.setEmail(rs.getString("email"));
						clt.setContrasena(rs.getString("password"));

						clt.setApellido(rs.getString("apellido"));
						clt.setNombre(rs.getString("nombre"));
						clt.setDireccion(rs.getString("direccion"));
						clt.setCiudad(rs.getString("ciudad"));
						clt.setPais(rs.getString("pais"));
						clt.setCodigo_postal(rs.getInt("codigo_postal"));
						clt.setDni(rs.getString("dni"));
						clt.setTelefono(rs.getString("telefono"));
						clt.setFriendlyID(rs.getString("friendly_id"));
						clt.setVerificado(rs.getBoolean("verificado"));

						usr = clt;

					}
					else {
						Admin adm = new Admin();

						adm.setId(rs.getInt("id_usuario"));

						adm.setEmail(rs.getString("email"));
						adm.setContrasena(rs.getString("password"));

						adm.setIdAdmin(rs.getInt("id_admin"));

						usr = adm;

					}
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

	public Usuario getOneByDNI(String dni) throws Exception {

		Statement stmt=null;
		ResultSet rs=null;
		Usuario usr = new Usuario();

		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();

			String sentencia = "select * from usuarios where dni = '" + dni +"'";
			System.out.println("Se va a ejecutar la sentecnia SQL: " + sentencia);

			rs = stmt.executeQuery(sentencia);

			if(rs!=null){

				while(rs.next()){

					if(rs.getInt("id_admin") == 0) {
						Cliente clt = new Cliente();

						clt.setId(rs.getInt("id_usuario"));
						clt.setEmail(rs.getString("email"));
						clt.setContrasena(rs.getString("password"));

						clt.setApellido(rs.getString("apellido"));
						clt.setNombre(rs.getString("nombre"));
						clt.setDireccion(rs.getString("direccion"));
						clt.setCiudad(rs.getString("ciudad"));
						clt.setPais(rs.getString("pais"));
						clt.setCodigo_postal(rs.getInt("codigo_postal"));
						clt.setDni(rs.getString("dni"));
						clt.setTelefono(rs.getString("telefono"));
						clt.setFriendlyID(rs.getString("friendly_id"));
						clt.setVerificado(rs.getBoolean("verificado"));

						usr = clt;

					}
					else {
						Admin adm = new Admin();

						adm.setId(rs.getInt("id_usuario"));

						adm.setEmail(rs.getString("email"));
						adm.setContrasena(rs.getString("password"));

						adm.setIdAdmin(rs.getInt("id_admin"));

						usr = adm;

					}
				}
			}
		}
		catch (Exception e){
			System.out.println("Error al buscar el usuario en la DB");
			throw e;
		}

		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			FactoryConection.getInstancia().releaseConn();
		}
		catch (SQLException e) {
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

			String sentencia = "insert into usuarios "
					+ "(email, password, dni, nombre, apellido, telefono, ciudad, pais, codigo_postal, direccion, id_admin, friendly_id, verificado) "
					+ "values ('" + email + "', '" + password;

			if(usr.isAdmin()) {
				String idAdmin = Integer.toString(((Admin)usr).getIdAdmin());
				// Esto nos va a dar problemas cuando agreguemos admins. Hay campos que son NOT NULL
				sentencia += ("', null, null, null, null, null, null, null, null, '" + idAdmin + "', '', '')");
			}
			else {

				String dni = ((Cliente) usr).getDni();
				String nombre = ((Cliente) usr).getNombre();
				String apellido = ((Cliente) usr).getApellido();
				String telefono = ((Cliente) usr).getTelefono();

				String ciudad = ((Cliente) usr).getCiudad();
				String pais = ((Cliente) usr).getPais();
				String codigo_postal = Integer.toString(((Cliente) usr).getCodigo_postal());
				String direccion = ((Cliente) usr).getDireccion();

				String friendlyID = ((Cliente) usr).getFriendlyID();
				Boolean verificado = ((Cliente) usr).getVerificado();


				sentencia += ("', '" + dni + "', '" + nombre + "', '" + apellido + "', '" + telefono + "','" + ciudad
						+ "', '" + pais + "','" + codigo_postal + "', '" + direccion + "', null, '" + friendlyID + "', "
						+ verificado + ")");
			}

			/*
			String sentencia = "insert into usuarios "
					+ "(email, password, dni, nombre, apellido, telefono, ciudad, pais, codigo_postal, direccion) "
					+ "values ('" + email + "', '" + password + "', '" + dni + "', '" + nombre + "', '" + apellido + "', '" + telefono + "','" + ciudad + "', '" + pais + "','" + codigo_postal + "',   '" + direccion +"')";
			*/

			System.out.println("Se va a ejecutar la sentencia SQL: "+ sentencia);

			stmt.executeUpdate(sentencia);

			System.out.println("Sentencia SQL ejecutada con exito");
		} catch (Exception e){
			System.out.println("Error al crear el usuario en la DB");
			throw e;
		}
	}

	public void Delete(Usuario usr) throws Exception{
		Statement stmt=null;
		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();


			int idUsuario = usr.getId();

			String sentencia = "delete from usuarios where id_usuario = " + idUsuario + ";";

			System.out.println("Se va a ejecutar la sentencia SQL: "+ sentencia);

			stmt.executeUpdate(sentencia);

			System.out.println("Sentencia SQL ejecutada con exito");
		} catch (Exception e){
			System.out.println("Error al borrar el usuario en la DB");
			throw e;
		}
	}

	public void Activar(Usuario usr) {
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = FactoryConection.getInstancia().getConn().createStatement();
			String sentencia = "UPDATE usuarios SET verificado = 1 WHERE (id_usuario = '" + usr.getId() + "');";
			System.out.println("Se va a ejecutar la sentecnia SQL: " + sentencia);
			stmt.executeUpdate(sentencia);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
