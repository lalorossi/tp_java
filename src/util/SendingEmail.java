package util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendingEmail {
	private String userEmail;
	private String friendlyID;

	public SendingEmail(String userEmail, String friendlyID) {
		this.userEmail = userEmail;
		this.friendlyID = friendlyID;

	}

	public void sendEmail() {
		final String email = "arroztower@gmail.com";
		final String pword = "tpjava2019";

		Properties properties = new Properties();

		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port","587");

		Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, pword);
			}
		});

//		Session session = Session.getDefaultInstance(properties);

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
			message.setSubject("ArrozTower.com Link de VERIFICACION de email");

			String link = "http://localhost:8080/tp_java/ActiveAccount?k=" + friendlyID;
			message.setText("Haga click en el Link para verificar la cuenta: " + link);
			System.out.println("Se va a enviar el link: " + link);

			Transport t = session.getTransport("smtp");
			t.connect(email, pword);
			t.sendMessage(message, message.getAllRecipients());
			t.close();
		} catch (Exception ex) {
			//Corregir Esta exception
			System.out.println("Error al enviar el mail" + ex);
		}
	}

}
