/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package SendSms;

public class SendSms {

	public static void Way2SMS(String mobile, String message) {
		try {
			String username = "9768083630";// userid of Way2sms
			String password = "mahendra";// password of Way2sms

			ThreadSms th = new ThreadSms(username, password, mobile, message);
			Thread t = new Thread(th);
			t.start();
		} catch (Exception e) {
		}
	}

	public static void main(String args[]) throws InterruptedException {
		String username = "";// userid of Way2sms
		String password = "";// password of Way2sms
		String message = "Testing Way2SMS";// msg to be sent
		String mobile = "";// phonenumber for whoom msg to be sent;

		ThreadSms th = new ThreadSms(username, password, mobile, message);
		Thread t = new Thread(th);
		t.start();
	}
}
