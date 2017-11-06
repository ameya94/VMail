/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sendemail;

/**
 * 
 * @author Administrator
 */
public class sendEmailThread implements Runnable {

	String fromemail = "";
	String passwd = "";
	String toemail = "";
	String Subject = "";
	String message = "";
	String Attachment = "";
	boolean withAttachment = false;

	public sendEmailThread(String femail, String password, String temail,
			String sbject, String msg) {
		withAttachment = false;
		fromemail = femail;
		passwd = password;
		toemail = temail;
		Subject = sbject;
		message = msg;
	}

	public sendEmailThread(String femail, String password, String temail,
			String sbject, String msg, String attachment) {

		withAttachment = true;
		fromemail = femail;
		passwd = password;
		toemail = temail;
		Subject = sbject;
		message = msg;
		Attachment = attachment;
	}

	@Override
	public void run() {

		try {
			if (withAttachment) {
				new SimpleSendEmail(fromemail, passwd, toemail, Subject,
						message, Attachment);
			} else {
				new SimpleSendEmail(fromemail, passwd, toemail, Subject,
						message);
			}
		} catch (Exception e) {
		}
	}
}