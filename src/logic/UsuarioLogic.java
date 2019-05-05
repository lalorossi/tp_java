package logic;

import java.util.ArrayList;
import database.UsuarioData;
import entities.Usuario;

public class UsuarioLogic {
	UsuarioData usrData = new UsuarioData();
	
	public ArrayList<Usuario> getAll() throws Exception {
		return usrData.getAll();
	};
	
	public void Create(Usuario usr) throws Exception {
		usrData.Create(usr);
	}
	
	public boolean Exist(ArrayList<Usuario> usuarios, String email) {
		for (int i=0; i<usuarios.size(); i++) {
		    System.out.println(usuarios.get(i).getEmail());
			if(usuarios.get(i).getEmail().equals(email)) {
				return true;
			}
		}
		return false;
	}
}
