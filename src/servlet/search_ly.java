package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.msg;

/**
 * Servlet implementation class search_ly
 */
@WebServlet("/search_ly")
public class search_ly extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public search_ly() {
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
		response.setContentType("text/xml");
		response.setHeader("pragma", "no-cache");
		response.setHeader("cache-control", "No-cache");
		response.setDateHeader("expires", 0);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rst = null;
		String str = request.getParameter("value");
		if (str != null) {
			System.out.println(str);
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=yrp", "yrp", "69");
				String strSQL = "select * from _msg";
				pstmt = conn.prepareStatement(strSQL);
				rst = pstmt.executeQuery();
				StringBuffer strb = new StringBuffer();
				strb.append("<gives>");
				while (rst.next()) {
					strb.append("<give>");
					strb.append("<bname>" + rst.getString(1) + "</bname>");
					strb.append("<bd>" + rst.getString(2) + "</bd>");
					strb.append("<btime>" + rst.getString(3) + "</btime>");
					strb.append("</give>");

				}
				strb.append("</gives>");
				System.out.println(strb.toString());
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(strb.toString());
			} catch (ClassNotFoundException ex) {
				ex.printStackTrace();
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		} else {
			msg m = new msg();
			if (m.delly()) {
				String strb = "";
				strb = "<t>²Ù×÷³É¹¦</t>";
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(strb.toString());
			}
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

}
