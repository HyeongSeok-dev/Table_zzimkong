package com.table.zzimkong.vo;

public class MemberVO {
	String user_idx;
	String user_id;
	String user_passwd;
	String user_nick;
	String user_email;
	String user_name;
	String user_birth;
	String com_num; //사업자번호
	String user_reg_date;
	
	//기본생성자
	public MemberVO(){}
	
	//getter/setter
	public String getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_passwd() {
		return user_passwd;
	}
	public void setUser_passwd(String user_passwd) {
		this.user_passwd = user_passwd;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getCom_num() {
		return com_num;
	}
	public void setCom_num(String com_num) {
		this.com_num = com_num;
	}
	public String getUser_reg_date() {
		return user_reg_date;
	}
	public void setUser_reg_date(String user_reg_date) {
		this.user_reg_date = user_reg_date;
	}
	
	//toStirng
	@Override
	public String toString() {
		return "MemberVO [user_idx=" + user_idx + ", user_id=" + user_id + ", user_passwd=" + user_passwd
				+ ", user_nick=" + user_nick + ", user_email=" + user_email + ", user_name=" + user_name
				+ ", user_birth=" + user_birth + ", com_num=" + com_num + ", user_reg_date=" + user_reg_date + "]";
	}
	
	
	
	
} //MemberVO

