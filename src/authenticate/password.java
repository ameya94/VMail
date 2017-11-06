package authenticate;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.DatabaseConnection;

/**
 * Servlet implementation class password
 */
@WebServlet("/password")
public class password extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public password() {
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
		DatabaseConnection dbcon;
		dbcon = new DatabaseConnection();
		dbcon.dbconnection();
		String mobile = request.getParameter("mobile");
		String Mobile = mobile.replaceAll(" ", "");

		try {
			String query = "SELECT * FROM usertable where mobile='" + Mobile
					+ "'";
			ResultSet rs = dbcon.getResultSet(query);
			if (rs.next()) {
				String fullname = rs.getString("fullname");
				String password = rs.getString("password");
				String msg = fullname + " Your password for email account is: "
						+ password;
				// SendSms.SendSms.Way2SMS(Mobile, msg);
				System.out.println(msg);
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("forgotpassword.jsp");
			}
		} catch (Exception e) {
		}
	}
}