package sendemail;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import authenticate.CreateUser;
import Database.DatabaseConnection;

/**
 * Servlet implementation class compose
 */
@WebServlet("/compose")
public class compose extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DatabaseConnection db;
	CreateUser user;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public compose() {
        super();
         user = new CreateUser();
         db = new DatabaseConnection();
         db.dbconnection();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
		String femail=(String) session.getAttribute("femail");
		String fpassword=(String) session.getAttribute("fpassword");
		String toemail=request.getParameter("to");
		String subject=request.getParameter("subject");
		String body=request.getParameter("body");
		String id12=request.getParameter("id");
		
		if(!id12.equalsIgnoreCase(""))
		{
			int id123=Integer.parseInt(id12);
			String sql="Delete From email WHERE id=" + id123 + "";
			db.getUpdate(sql);
		}
		String[] recipients = toemail.split(",");
		
		for(int n=0; n<recipients.length-1; n++){
			
		String recipient = recipients[n].replaceAll(" ", "");
		
		if(recipient.contains("@")){
			
		 sendEmailThread sendEmail = new sendEmailThread(femail , fpassword, recipient, subject, body);
         Thread t1 = new Thread(sendEmail);
         t1.start();
         
         String months[] = {
                 "Jan", "Feb", "Mar", "Apr",
                 "May", "Jun", "Jul", "Aug",
                 "Sep", "Oct", "Nov", "Dec"};

             GregorianCalendar gcalendar = new GregorianCalendar();
             String date = (gcalendar.get(Calendar.DATE) + " ");
             String month = ((months[gcalendar.get(Calendar.MONTH)]) + " ");
             String year = (gcalendar.get(Calendar.YEAR) + " ");
             String hour = (gcalendar.get(Calendar.HOUR) + ":");
             String minute = (gcalendar.get(Calendar.MINUTE) + ":");
             String second = (gcalendar.get(Calendar.SECOND) + "");

             String datetime = date + month + year + hour + minute + second;
         
 
         int id = user.getID("email");
         
         String query = "INSERT INTO email VALUES(" + id + " ,'" + femail + "','" + recipient + "', '" + subject
                 + "', '" + body + "', '" + datetime + "', 'Read','No','No','Send')";

         int newid = id + 1;
         int row = db.getUpdate(query);
         
         if (row == 1) 
         {
             query = "INSERT INTO email VALUES(" + newid + " ,'" + recipient + "','" + femail + "', '" + subject
                     + "', '" + body + "', '" + datetime + "', 'Unread','No','No','Receive')";
             db.getUpdate(query);
         }
		}
		}
        session.setAttribute("msg", "Your message has been sent.");
        response.sendRedirect("inbox.jsp");
	}
}