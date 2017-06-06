package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class borrow
 */
@WebServlet("/borrow")
public class borrow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String book_id;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public borrow() {
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
		int days = Integer.parseInt(request.getParameter("time1").trim());
		Date date = new Date();
		Date rn_date = new Date(days * 24 * 60 * 60 * 1000 + date.getTime());
		book_id = request.getParameter("book_id").trim();
		String lib_card = request.getParameter("lib_card").trim();
		String url = "jdbc:sqlserver://localhost:1433;databaseName=yrp";
		try {
			con = DriverManager.getConnection(url, "yrp", "69");
			String condition = "insert into _book_log values('" + book_id + "','" + lib_card + "','"
					+ new java.sql.Date(date.getTime()) + "','" + new java.sql.Date(rn_date.getTime()) + "'," + days
					+ ")";
			sql = con.createStatement();
			if (sql.executeUpdate(condition) == 1) {
				func();
				response.sendRedirect("MyPage.jsp");
			}
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
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
			String condition = "update _book set book_n -=1 where book_id = '" + book_id + "'";
			sql = con.createStatement();
			sql.executeUpdate(condition);
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
