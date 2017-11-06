/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sendemail;

/**
 *
 * @author kp
 */
import java.util.*;
import javax.activation.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SimpleSendEmail {

	public static String femail;
	public static String pass;

	boolean done = false;

	public SimpleSendEmail(String fromemail, String password, String toemail,
			String Subject, String message) {
		femail = fromemail;
		pass = password;
		String to = toemail;
		String subject = Subject;
		String messageText = message;

		boolean sessionDebug = false;
		// Create some properties and get the default Session.
		Properties props = System.getProperties();
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.port", "" + 587);
		props.setProperty("mail.smtp.starttls.enable", "true");

		Session session = createSmtpSession();
		// Set debug on the Session so we can see what is going on
		// Passing false will not echo debug info, and passing true
		// will.
		session.setDebug(sessionDebug);
		try {
			// Instantiate a new MimeMessage and fill it with the
			// required information.
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(femail));
			InternetAddress[] address = { new InternetAddress(to) };
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			msg.setText(messageText);
			// Hand the message to the default transport service
			// for delivery.
			Transport.send(msg);
			done = true;
			System.out.println("Successfully send email");
		} catch (MessagingException mex) {
			done = false;
			System.out.println("email not send");
		}
	}

	// =============================* FOR ATTACHMENT
	// *==============================================
	public SimpleSendEmail(String fromemail, String password, String toemail,
			String Subject, String message, String Attachment) {
		femail = fromemail;
		pass = password;
		String to = toemail;
		String subject = Subject;
		String messageText = message;
		boolean sessionDebug = false;

		Properties props = System.getProperties();
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.port", "" + 587);
		props.setProperty("mail.smtp.starttls.enable", "true");

		Session session = createSmtpSession();
		session.setDebug(sessionDebug);
		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(femail));
			InternetAddress[] address = { new InternetAddress(to) };
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			// Hand the message to the default transport service
			// for delivery.
			MimeBodyPart messagePart = new MimeBodyPart();
			messagePart.setText(messageText);
			//
			// Set the email attachment file
			//
			MimeBodyPart attachmentPart = new MimeBodyPart();
			FileDataSource fileDataSource = new FileDataSource(Attachment) {
				@Override
				public String getContentType() {
					return "application/octet-stream";
				}
			};
			attachmentPart.setDataHandler(new DataHandler(fileDataSource));
			attachmentPart.setFileName(fileDataSource.getName());

			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messagePart);
			multipart.addBodyPart(attachmentPart);

			msg.setContent(multipart);

			Transport.send(msg);
			System.out.println("Successfully send email");
			done = true;
		} catch (MessagingException mex) {
			done = false;
			System.out.println("email not send");
		}
	}

	public static Session createSmtpSession() {
		final Properties props = new Properties();
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.port", "" + 587);
		props.setProperty("mail.smtp.starttls.enable", "true");

		return Session.getInstance(props, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(femail, pass);
			}
		});
	}
}