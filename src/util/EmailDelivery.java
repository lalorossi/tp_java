package util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailDelivery {
	private static final String EMAIL_FROM = "arroztower@gmail.com";
	private static final String PWORD = "tpjava2019";
	private String userEmail;
	private String friendlyID;

	public EmailDelivery(String userEmail, String friendlyID) {
		this.userEmail = userEmail;
		this.friendlyID = friendlyID;

	}

	public void sendEmail() throws AddressException, MessagingException {

		Properties properties = new Properties();

		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port","587");

		Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(EMAIL_FROM, PWORD);
			}
		});

//		Session session = Session.getDefaultInstance(properties);

		MimeMessage message = new MimeMessage(session);

		message.setFrom(new InternetAddress(EMAIL_FROM));
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
		message.setSubject("ArrozTower.com verificación de usuario");

		String link = "http://localhost:8080/tp_java/ActiveAccount?k=" + friendlyID;
		message.setText("Haga click en el Link para verificar la cuenta: " + link);
		System.out.println("Se va a enviar el link: " + link);

		Transport t = session.getTransport("smtp");
		t.connect(EMAIL_FROM, PWORD);
		t.sendMessage(message, message.getAllRecipients());
		t.close();
	}

}
