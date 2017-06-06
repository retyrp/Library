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
 * Servlet implementation class search_rn
 */
@WebServlet("/search_rn")
public class search_rn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public search_rn() {
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
			String strSQL = "select a.book_id,a.book_name,a.book_cla,a.book_pre, DateDiff(DAY,GETDATE(),b.rn_time) from _book a,_book_log b where   (b.username=? or b.book_id=?)AND a.book_id=b.book_id";
			pstmt = conn.prepareStatement(strSQL);
			pstmt.setString(1, str);
			pstmt.setString(2, str);
			rst = pstmt.executeQuery();
			StringBuffer strb = new StringBuffer();
			strb.append("<books>");
			while (rst.next()) {
				strb.append("<book>");
				strb.append("<bid>" + rst.getString(1) + "</bid>");
				strb.append("<bname>" + rst.getString(2) + "</bname>");
				strb.append("<bcla>" + rst.getString(3) + "</bcla>");
				strb.append("<bpre>" + rst.getString(4) + "</bpre>");
				strb.append("<btime>" + rst.getString(5) + "</btime>");
				strb.append("</book>");

			}
			strb.append("</books>");
			System.out.println(strb.toString());
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
