package user;

import java.util.LinkedList;

public class LoginBean {
	String logname = "", backNews = "δ��¼";
	LinkedList<String> car;

	public LoginBean() {
		car = new LinkedList<String>();
	}

	public void setLogname(String logname) {
		this.logname = logname;
	}

	public String getLogname() {
		return logname;
	}

	public void setBackNews(String s) {
		backNews = s;
	}

	public String getBackNews() {
		return backNews;
	}

	public LinkedList<String> getCar() {
		return car;
	}
}
