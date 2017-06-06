package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.m_book;

/**
 * Servlet implementation class search_m_updatebook
 */
@WebServlet("/search_m_updatebook")
public class search_m_updatebook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public search_m_updatebook() {
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
		String str = request.getParameter("value");
		String temp[] = str.split("--");
		if (temp[1].equals("delete")) {
			m_book m = new m_book(temp[0]);
			String strb = "";
			if (m.DeleteData()) {
				strb = "<t>删除成功</t>";
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(strb.toString());
			}
		} else {
			m_book m = new m_book(temp[0], temp[1], temp[2], temp[3], temp[4], temp[5], temp[6], temp[7]);
			String strb = "";
			if (m.UpdateData()) {
				strb = "<t>操作成功</t>";
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
