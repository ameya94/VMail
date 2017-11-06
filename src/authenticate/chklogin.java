package authenticate;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.DatabaseConnection;
import Email.MailReader;

/**
 * Servlet implementation class chklogin
 */
@WebServlet("/chklogin")
public class chklogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public chklogin() {
		super();
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
		String email = request.getParameter("Email").trim();
		String password = request.getParameter("password").trim();

		String newemail = email.replaceAll(" ", "");
		String newpassword = password.replaceAll(" ", "");

		DatabaseConnection db = new DatabaseConnection();
		db.dbconnection();

		String sql = "Select * from usertable where email='" + newemail
				+ "' and password='" + newpassword + "'";
		ResultSet rs = db.getResultSet(sql);
		try {
			if (rs.next()) {
				session.setAttribute("usermail", newemail);
				session.setAttribute("femail", newemail);
				session.setAttribute("fpassword", newpassword);
				response.sendRedirect("inbox.jsp");
				MailReader mailReader = new MailReader(newemail, newpassword);
				mailReader.readMessages();
			} else {
				session.setAttribute("failuer",
						"The email and password you entered don't match.");
				response.sendRedirect("index.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}