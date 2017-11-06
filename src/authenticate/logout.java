package authenticate;

import java.io.IOException;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.DatabaseConnection;

/**
 * Servlet implementation class logout
 */
@WebServlet("/logout")
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CreateUser user;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public logout() {
		super();
		user = new CreateUser();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String femail = (String) session.getAttribute("femail");
		String to = request.getParameter("to");
		String subject = request.getParameter("subject");
		String body = request.getParameter("body");
		int id = user.getID("email");

		DatabaseConnection db = new DatabaseConnection();
		db.dbconnection();

		String months[] = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
				"Aug", "Sep", "Oct", "Nov", "Dec" };

		GregorianCalendar gcalendar = new GregorianCalendar();
		String date = (gcalendar.get(Calendar.DATE) + " ");
		String month = ((months[gcalendar.get(Calendar.MONTH)]) + " ");
		String year = (gcalendar.get(Calendar.YEAR) + " ");
		String hour = (gcalendar.get(Calendar.HOUR) + ":");
		String minute = (gcalendar.get(Calendar.MINUTE) + ":");
		String second = (gcalendar.get(Calendar.SECOND) + "");

		String datetime = date + month + year + hour + minute + second;

		if (to.equalsIgnoreCase("")) {
			session.invalidate();
			response.sendRedirect("index.jsp");
		} else {
			String query = "INSERT INTO email VALUES(" + id + " ,'" + femail
					+ "','" + to + "', '" + subject + "', '" + body + "', '"
					+ datetime + "', 'Read','Yes','No','')";
			int row = db.getUpdate(query);

			if (row == 1) {
				session.invalidate();
				response.sendRedirect("index.jsp");
			}
		}
	}

}
