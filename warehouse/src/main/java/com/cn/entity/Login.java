package com.cn.entity;

public class Login {
	
	private String username;
	private String pwd ;
	
	public Login() {
	}
	public Login( String username, String pwd) {
		this.username = username;
		this.pwd = pwd;
	}
	public String getusername() {
		return username;
	}
	public void setusername(String username) {
		this.username = username;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	} 
	
}
