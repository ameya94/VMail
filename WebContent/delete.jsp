<%@page import="Database.DatabaseConnection"%>
<%
	int id = Integer.parseInt((String) request.getParameter("id"));
	String page1 = request.getParameter("name");
	DatabaseConnection db = new DatabaseConnection();
	db.dbconnection();

	if (page1.equalsIgnoreCase("trash")) {
		session.setAttribute("msg",
				"The conversation has been deleted.");
		String sql = "Delete From email WHERE id=" + id + "";
		int i = db.getUpdate(sql);
		request.getRequestDispatcher("trash.jsp").forward(request,
				response);
	} else if (page1.equalsIgnoreCase("draft")) {
		String sql = "Delete From email WHERE id=" + id + "";
		int i = db.getUpdate(sql);
		request.getRequestDispatcher("draft.jsp").forward(request,
				response);
	} else {
		session.setAttribute("msg",
				"The conversation has been moved to the Trash.");
		String sql = "Update email Set trash='Yes' WHERE id=" + id + "";
		int i = db.getUpdate(sql);
		if (page1.equalsIgnoreCase("inbox")) {
			request.getRequestDispatcher("inbox.jsp").forward(request,
					response);
		} else if (page1.equalsIgnoreCase("send")) {
			request.getRequestDispatcher("sendbox.jsp").forward(
					request, response);
		} else if (page1.equalsIgnoreCase("allmail")) {
			request.getRequestDispatcher("allmail.jsp").forward(
					request, response);
		}
	}
%>