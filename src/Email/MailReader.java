/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Email;

import java.io.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.Flags.Flag;
import javax.mail.search.FlagTerm;

import Database.DatabaseConnection;
import authenticate.CreateUser;

public final class MailReader {

    Folder inbox;
    Session session;
    Store store;
    public String from;
    public String to;
    public String subject;
    public String content;
    RunnerThread runnerThread;
    CreateUser user;
    DatabaseConnection db;

    public MailReader(String email ,String pass) {
        try {
            db = new DatabaseConnection();
            db.dbconnection();
            user = new CreateUser();
            /*  Set the mail properties  */
            Properties props = System.getProperties();
            props.setProperty("mail.store.protocol", "imaps");
            /*  Create the session and get the store for read the mail. */
            session = Session.getDefaultInstance(props, null);
            store = session.getStore("imaps");
            store.connect("imap.gmail.com", email, pass);
            runnerThread = new RunnerThread();
            new Thread(runnerThread).start();
        } catch (Exception e) {
            runnerThread = new RunnerThread();
            new Thread(runnerThread).start();
        }
    }

    public void readMessages() {
        try {
            /*  Mention the folder name which you want to read. */
            inbox = store.getFolder("Inbox");
            /*Open the inbox using store.*/
            inbox.open(Folder.READ_WRITE);
            /*  Get the messages which is unread in the Inbox*/
            Message messages[] = inbox.search(new FlagTerm(new Flags(Flag.SEEN), false));
            printAllMessages(messages);
            inbox.close(true);
        } catch (Exception e) {
        }
    }

    public void printAllMessages(Message[] msgs) throws Exception {
        for (int i = 0; i < msgs.length; i++) {
            printEnvelope(msgs[i]);
        }
    }

    /*  Print the envelope(FromAddress,Subject,Content)  */
    @SuppressWarnings("deprecation")
	public void printEnvelope(Message message) throws Exception {
        Address[] a;
//      FROM
        if ((a = message.getFrom()) != null) {
            for (int j = 0; j < a.length; j++) {
                this.from = getEmailid(a[j].toString()).trim();
            }
        }
//      TO
        if ((a = message.getRecipients(Message.RecipientType.TO)) != null) {
            for (int j = 0; j < a.length; j++) {
                this.to = getEmailid(a[j].toString()).trim();
            }
        }
//      SUBJECT
        String sub = message.getSubject();
        this.subject = sub;
//      CONTENT
        getContent(message);
		String datetime = message.getReceivedDate().toGMTString().replaceAll(" GMT", "");

        System.out.println("Message From :" + this.from);
        System.out.println("Message From :" + this.to);
        System.out.println("Subject :" + this.subject);
        System.out.println("message :" + this.content);
        System.out.println("Date Time :" + message.getReceivedDate().toGMTString().replaceAll(" GMT", ""));

        if(this.content == null){
        	this.content = "";
        }
        int id = user.getID("email");
        
        String query = "INSERT INTO email VALUES(" + id + " ,'" + this.from + "','" + this.to + "', '" + this.subject
                + "', '" + this.content + "', '" + datetime + "', 'Read','No','No','Send')";

        int newid = id + 1;
        int row = db.getUpdate(query);
        
        if (row == 1) 
        {
            query = "INSERT INTO email VALUES(" + newid + " ,'" + this.to + "','" + this.from + "', '" + this.subject
                    + "', '" + this.content + "', '" + datetime + "', 'Unread','No','No','Receive')";
            db.getUpdate(query);
        }
        System.out.println("================================================================================================");
    }

    @SuppressWarnings("unused")
	public void getContent(Message msg) {
        try {
            Multipart mp = (Multipart) msg.getContent();
            int count = mp.getCount();
            for (int i = 0; i < count; i++) {
                dumpPart(mp.getBodyPart(i));
                break;
            }
        } catch (Exception ex) {
        }
    }

    public void dumpPart(Part p) throws Exception {
        // Dump input stream ..
        InputStream is = p.getInputStream();
        // If "is" is not already buffered, wrap a BufferedInputStream
        // around it.
        if (!(is instanceof BufferedInputStream)) {
            is = new BufferedInputStream(is);
        }
        int c;
        String cntnt = "";
        while ((c = is.read()) != -1) {
            cntnt += (char) c;
        }
        this.content = cntnt;
    }

    public String getEmailid(String emailid) {
        String id = emailid;
        try {
            int index1 = emailid.indexOf("<");
            int index2 = emailid.indexOf(">", index1 + 1);
            id = emailid.substring(index1 + 1, index2);
        } catch (Exception e) {
        }
        return id;
    }

    class RunnerThread implements Runnable {
        @Override
        public void run() {
            while (true) {
                try {
                    readMessages();
                    Thread.sleep(1000 * 10);
                } catch (InterruptedException ex) {
                    Logger.getLogger(MailReader.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}