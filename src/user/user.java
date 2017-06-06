package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class user {

	private String oldname;
	private String username;
	private String userpwd;
	private String email;
	private String userphone;

	public user(String uname, String upwd) {
		username = uname;
		userpwd = upwd;
	}

	public user(String uname) {
		username = uname;
		oldname = uname;
	}

	public user(String uname, String upwd, String em, String uphone, String token) {
		username = uname;
		userpwd = upwd;
		email = em;
		userphone = uphone;
		oldname = token;
	}

	public String getusername() {
		return username;
	}

	public String getpassword() {
		return userpwd;
	}

	public String getemail() {
		return email;
	}

	public String getuserphone() {
		return userphone;
	}

	public Boolean DeleteData() {
		return DeleteDataSql();
	}

	public Boolean Register() {
		return RegisterSql();
	}

	private Boolean RegisterSql() {
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
			String condition = "insert into _user values('" + username + "','" + userpwd + "','" + email + "','"
					+ userphone + "')";
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

	private Boolean DeleteDataSql() {
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
			String condition = "delete from _user where username='" + oldname + "'";
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

	public Boolean UpdateData() {
		DeleteData();
		return UpdateDateSql();
	}

	private Boolean UpdateDateSql() {
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
			String condition = "insert into _user values('" + username + "' , '" + userpwd + "','" + email + "', '"
					+ userphone + "')";
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
