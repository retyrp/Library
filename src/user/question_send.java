package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Date;

public class question_send {

	String msg;
	String user;

	public question_send(String a, String b) {
		msg = a;
		user = b;
	}

	public void doSend() {
		doSql();
	}

	private Boolean doSql() {
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
			msg = msg.replaceAll(".*([';]+|(--)+).*", " ");
			user = user.replaceAll(".*([';]+|(--)+).*", " ");
			String condition = "insert into _msg values('" + user + "','" + msg + "','"
					+ new java.sql.Date(new Date().getTime()) + "')";
			sql = con.createStatement();
			if (sql.executeUpdate(condition) == 1) {
				con.close();
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
		return false;
	}

}
