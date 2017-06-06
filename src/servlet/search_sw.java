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
 * Servlet implementation class search_sw
 */
@WebServlet("/search_sw")
public class search_sw extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public search_sw() {
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
		// String str = request.getParameter("value");
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=yrp", "yrp", "69");
			String strSQL = "select book_name,DateDiff(DAY,GETDATE(),b.rn_time)from _book a,_book_log b where a.book_id=b.book_id and a.book_id in(select book_id from _book_log where username=? and rn_deadline<=3)";
			pstmt = conn.prepareStatement(strSQL);
			pstmt.setString(1, str);
			rst = pstmt.executeQuery();
			StringBuffer strb = new StringBuffer();
			strb.append("<x>");
			while (rst.next()) {
				strb.append("--" + rst.getString(1));
				strb.append("(" + rst.getString(2) + "Ìì)--");
			}
			strb.append("</x>");
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
