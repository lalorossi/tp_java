package database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entities.Admin;


public class DataAdmin {
	public ArrayList<Admin> getAll() throws Exception{
		
		Statement stmt=null;
		ResultSet rs=null;
		ArrayList<Admin> cats= new ArrayList<Admin>();
		try{
			stmt = FactoryConection.getInstancia()
					.getConn().createStatement();
			rs = stmt.executeQuery("select * from admin");
			if(rs!=null){
				while(rs.next()){
					Admin c = new Admin();
					c.setId(rs.getInt("id"));
					c.setDescripcion(rs.getString("descripcion"));
					cats.add(c);
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
		
		return cats;
	}

}
