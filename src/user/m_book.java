package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class m_book {
	String book_id;
	String book_name;
	String book_cla;
	String book_pre;
	String book_all;
	String book_n;
	String book_time;
	String old_id;

	public m_book(String a, String b, String c, String d, String e, String f, String g, String h) {
		book_id = a;
		book_name = b;
		book_cla = c;
		book_pre = d;
		book_all = e;
		book_n = f;
		book_time = g;
		old_id = h;
	}

	public m_book(String a) {
		book_id = a;
		old_id = a;
	}

	public Boolean DeleteData() {
		return DeleteDataSql();
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
			String condition = "delete from _book where book_id='" + old_id + "'";
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
			String condition = "insert into _user values('" + book_id + "' ,'" + book_name + "','" + book_cla + "', '"
					+ book_pre + "','" + book_all + "','" + book_n + "','" + book_time + "')";
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

	public String getbook_id() {
		return book_id;
	}

	public String getbook_name() {
		return book_name;
	}

	public String getbook_cla() {
		return book_cla;
	}

	public String getbook_pre() {
		return book_pre;
	}

	public String getbook_all() {
		return book_all;
	}

	public String getbook_n() {
		return book_n;
	}

	public String getbook_time() {
		return book_time;
	}

}
