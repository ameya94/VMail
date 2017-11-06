package authenticate;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignUpServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		try {
			String fname = request.getParameter("fname");
			String address = request.getParameter("address");
			String password = request.getParameter("password");
			String mail = request.getParameter("email");
			String mobile = request.getParameter("mobno");
			String gender = request.getParameter("gender");

			mail.replaceAll(" ", "");
			password.replaceAll(" ", "");
			mobile.replaceAll(" ", "");

			String error = "";

			CreateUser createuser = new CreateUser();
			if (createuser.chkExists(mail)) {
				error = "Email Id Already Exists. Please Enter Another Email ID!!!";
				session.setAttribute("error", error);
				response.sendRedirect("signUp.jsp");
			} else {
				if (createuser.create(fname, address, mail, password, gender,
						mobile)) {
					response.sendRedirect("index.jsp");
				}
			}
		} finally {
		}
	}
}
