package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.LoginBean;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public String hString(String s) {
		try {
			byte bb[] = s.getBytes("iso-8859-1");
			s = new String(bb);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return s;
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
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
		doPost(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
		String logname = request.getParameter("Username").trim();
		String pwd = request.getParameter("Password").trim();
		String ma = request.getParameter("MA");
		String rm = request.getParameter("RM");
		logname = hString(logname);
		pwd = hString(pwd);
		String url = "jdbc:sqlserver://localhost:1433;databaseName=yrp";
		logname = logname.replaceAll(".*([';]+|(--)+).*", " ");
		pwd = pwd.replaceAll(".*([';]+|(--)+).*", " ");
		try {
			con = DriverManager.getConnection(url, "yrp", "69");
			if (ma == null) {
				if (rm != null) {
					Cookie cname = new Cookie("username", logname);
					cname.setMaxAge(60 * 60 * 14);
					response.addCookie(cname);
					Cookie cpass = new Cookie("password", pwd);
					cpass.setMaxAge(60 * 60 * 14);
					response.addCookie(cpass);
					Cookie ccheck = new Cookie("checked", "checked");
					ccheck.setMaxAge(60 * 60 * 14);
					response.addCookie(ccheck);
				} else {
					Cookie cname = new Cookie("username", logname);
					cname.setMaxAge(0);
					response.addCookie(cname);
					Cookie cpass = new Cookie("password", pwd);
					cpass.setMaxAge(0);
					response.addCookie(cpass);
					Cookie ccheckd = new Cookie("checked", "");
					ccheckd.setMaxAge(0);
					response.addCookie(ccheckd);

				}

				String condition = "select * from _user where username ='" + logname + "'and userpwd='" + pwd + "'";
				sql = con.createStatement();
				ResultSet rs = sql.executeQuery(condition);
				boolean m = rs.next();
				if (m == true) {
					success(request, response, logname, pwd);
					response.sendRedirect("HomePage.jsp");
				} else {
					String backNews = "账户或者密码有误，请检查后重新输入";
					fail(request, response, logname, backNews);
				}
			} else {
				String condition = "select * from _manager where mname ='" + logname + "'and mpwd='" + pwd + "'";
				sql = con.createStatement();
				ResultSet rs = sql.executeQuery(condition);
				boolean m = rs.next();
				if (m == true) {
					request.getRequestDispatcher("/WEB-INF/ma.jsp").forward(request, response);
				} else {
					String backNews = "账户或者密码有误，请检查后重新输入";
					fail(request, response, logname, backNews);
				}
			}
			con.close();
		} catch (

		Exception e) {
			// TODO: handle exception
			String backNews = "" + e;
			fail(request, response, logname, backNews);
		}
	}

	public void success(HttpServletRequest request, HttpServletResponse response, String logname, String pwd) {
		LoginBean l = null;
		HttpSession session = request.getSession(true);
		try {
			l = (LoginBean) session.getAttribute("LoginBean");
			if (l.getLogname() == "") {
				l = new LoginBean();
				session.setAttribute("LoginBean", l);
				l = (LoginBean) session.getAttribute("LoginBean");
			}
			String name = l.getLogname();
			if (name.equals(logname)) {
				l.setBackNews(logname + "已在线");
				l.setLogname(logname);
			} else {
				l.setBackNews(logname + "登录成功");
				l.setLogname(logname);
				session.setAttribute("username", l.getLogname().toString());
			}
		} catch (Exception e) {
			// TODO: handle exception
			l = new LoginBean();
			session.setAttribute("LoginBean", l);
			session.setAttribute("username", l.getLogname());
			l.setBackNews(logname + "登录成功");
			l.setLogname(logname);
		}
	}

	public void fail(HttpServletRequest request, HttpServletResponse response, String logname, String backNews) {
		response.setContentType("text/html;charset = UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<h2>" + logname + "登录反馈结果<br>" + backNews + "</h2>");
			out.println("返回登录页面<br>");
			out.println("<a href = default.jsp>登录页面</a>");
			out.println("</body></html>");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
