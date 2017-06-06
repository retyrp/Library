package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class rn
 */
@WebServlet("/rn")
public class rn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String book_id;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public rn() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Connection con;
		Statement sql;
		book_id = request.getParameter("book_id").trim();
		String username = request.getParameter("username").trim();
		String url = "jdbc:sqlserver://localhost:1433;databaseName=yrp";
		try {
			con = DriverManager.getConnection(url, "yrp", "69");
			String condition = "DELETE FROM _book_log WHERE book_id='" + book_id + "' AND username='" + username + "'";
			sql = con.createStatement();
			if (sql.executeUpdate(condition) == 1) {
				func();
				response.sendRedirect("MyPage.jsp");
			}
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
			String backNews = "" + e;
			// fail(request, response, logname, backNews);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void func() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Connection con;
		Statement sql;
		String url = "jdbc:sqlserver://localhost:1433;databaseName=yrp";
		try {
			con = DriverManager.getConnection(url, "yrp", "69");
			String condition = "update _book set book_n +=1 where book_id = '" + book_id + "'";
			sql = con.createStatement();
			sql.executeUpdate(condition);
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
