package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class msg {

	public boolean delly() {
		return dellysql();
	}

	private boolean dellysql() {
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
			String condition = "delete from _msg";
			sql = con.createStatement();
			// sql.execute(condition);
			if (sql.executeUpdate(condition) == 1) {
				con.close();
				return true;
			}
			return false;

		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

}
