package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

public class give_func {
	String user = "δ֪";
	String phone = "δ֪";
	String bookName = "δ֪";
	String time = "";

	public give_func() {
	}

	public void setTime(String token) {
		time = token;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setBookName(String bn) {
		this.bookName = bn;
	}

	public String getUser() {
		return user;
	}

	public String getPhone() {
		return phone;
	}

	public String getBookName() {
		return bookName;
	}

	public void sendSql() {
		sqlUpdate();
	}

	public void getSql() {
		sqlSearch();
	}

	public boolean del() {
		return delsql();
	}

	private boolean delsql() {
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
			String condition = "delete from _give where _time='" + time + "'";
			sql = con.createStatement();
			// sql.execute(condition);
			if (sql.executeUpdate(condition) == 1) {
				con.close();
				return true;
			}
			return false;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
			return false;
		}
	}

	private String sqlSearch() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Connection con;
		String url = "jdbc:sqlserver://localhost:1433;databaseName=yrp";
		try {
			con = DriverManager.getConnection(url, "yrp", "69");
			bookName = bookName.replaceAll(".*([';]+|(--)+).*", " ");
			phone = phone.replaceAll(".*([';]+|(--)+).*", " ");
			user = user.replaceAll(".*([';]+|(--)+).*", " ");
			PreparedStatement pstmt = null;
			String condition = "select * from _give";
			pstmt = con.prepareStatement(condition);
			ResultSet rst = null;
			rst = pstmt.executeQuery();
			StringBuffer strb = new StringBuffer();
			while (rst.next()) {
				strb.append("--" + rst.getString(1) + "--");
				strb.append("--" + rst.getString(2) + "--");
				strb.append("--" + rst.getString(3) + "--");
				strb.append("--" + rst.getString(4) + "--");
			}
			return strb.toString();
		} catch (Exception e) {
			// TODO: handle exception
			return "error";
		}
	}

	private Boolean sqlUpdate() {
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
			bookName = bookName.replaceAll(".*([';]+|(--)+).*", " ");
			phone = phone.replaceAll(".*([';]+|(--)+).*", " ");
			user = user.replaceAll(".*([';]+|(--)+).*", " ");
			String condition = "insert into _give values('" + bookName + "','" + phone + "','" + user + "','"
					+ new java.sql.Timestamp(new Date().getTime()) + "')";
			sql = con.createStatement();
			// sql.execute(condition);
			if (sql.executeUpdate(condition) == 1) {
				con.close();
				return true;
			}
			return false;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
			return false;
		}
	}
}
