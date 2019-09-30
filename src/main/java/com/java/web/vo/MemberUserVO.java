package com.java.web.vo;

public class MemberUserVO {
	private int user_no_pk;
	private String user_id;
	private String user_pw;
	private String user_email;
	private String user_delYN;
	public int getUser_no_pk() {
		return user_no_pk;
	}
	public void setUser_no_pk(int user_no_pk) {
		this.user_no_pk = user_no_pk;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_delYN() {
		return user_delYN;
	}
	public void setUser_delYN(String user_delYN) {
		this.user_delYN = user_delYN;
	}
	@Override
	public String toString() {
		return "MemberUserVO [user_no_pk=" + user_no_pk + ", user_id=" + user_id + ", user_pw=" + user_pw
				+ ", user_email=" + user_email + ", user_delYN=" + user_delYN + "]";
	}
	
	
}
