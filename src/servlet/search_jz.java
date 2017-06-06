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

/**
 * Servlet implementation class search_jz
 */
@WebServlet("/search_jz")
public class search_jz extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public search_jz() {
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
		// String str = request.getParameter("value");
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=yrp", "yrp", "69");
			String strSQL = "select * from _give";
			pstmt = conn.prepareStatement(strSQL);
			rst = pstmt.executeQuery();
			StringBuffer strb = new StringBuffer();
			strb.append("<books>");
			while (rst.next()) {
				strb.append("<book>");
				strb.append("<bname>" + rst.getString(1) + "</bname>");
				strb.append("<bphone>" + rst.getString(2) + "</bphone>");
				strb.append("<busername>" + rst.getString(3) + "</busername>");
				strb.append("<btime>" + rst.getString(4) + "</btime>");
				strb.append("</book>");

			}
			strb.append("</books>");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(strb.toString());
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException ex) {
			ex.printStackTrace();
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
