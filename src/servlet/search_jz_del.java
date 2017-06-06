package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.give_func;

/**
 * Servlet implementation class search_jz_del
 */
@WebServlet("/search_jz_del")
public class search_jz_del extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public search_jz_del() {
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
		give_func g = new give_func();
		g.setTime(str);

		String strb = "";
		if (g.del()) {
			strb = "<t>“—¥¶¿Ì</t>";
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(strb.toString());
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
