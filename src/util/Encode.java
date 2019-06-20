package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encode {

	// Es metodo de clase. No hace falta instanciarlo para usarlo
	public static String md5(String input) {
		MessageDigest md;
		String output = null;
		try {
			md = MessageDigest.getInstance("MD5");
		    md.update(input.getBytes());
		    byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
           	output = sb.toString();

		    // md.update(password.getBytes(StandardCharsets.UTF_8))
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return output;
	}

	public static String friendlyID(String input, String seed) {
		Hashids generador = new Hashids(seed);
		return generador.encode(Integer.parseInt(input));
	}
}
