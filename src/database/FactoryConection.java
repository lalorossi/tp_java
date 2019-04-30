package database;
import java.sql.*;
import util.AppDataException;

public class FactoryConection {

	
	private String driver="com.mysql.jdbc.Driver";
	private String host="127.0.0.1";
	private String port="3306";
	private String user="root";
	private String password="root";
	private String db="arroz_tower";
	
	private static FactoryConection instancia;
		
	private FactoryConection(){
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	public static FactoryConection getInstancia(){
		if (FactoryConection.instancia == null){		
			FactoryConection.instancia=new FactoryConection();
		}
		return FactoryConection.instancia;
		
	}
	
	private Connection conn;
	private int cantConn=0;
	public Connection getConn() throws SQLException,AppDataException{
		try {
			if(conn==null || conn.isClosed()){	
				conn = DriverManager.getConnection(
			        "jdbc:mysql://"+host+":"+port+"/"+db+"?user="+user+"&password="+password);
			}
		} catch (SQLException e) {
			throw new AppDataException(e, "Error al conectar a la base de datos");
		}
		cantConn++;
		return conn;
	}
	
	public void releaseConn() throws SQLException{
		try {
			cantConn--;
			if(cantConn==0){
				conn.close();
			}
		} catch (SQLException e) {
			throw e;
		}
	}
	


}
