package com.share.bean;

import java.io.Serializable;

public class LoginLogBean implements Serializable {
	//登录日志bean
	private int t_loginlog_id;
	private int t_userinfo_id;
	private String t_loginlog_time;
	private int t_loginlog_ifsuccess;
	private String t_loginlog_userip;
	private String t_loginlog_desc;
	//登录用户名
	private String t_userinfo_name;
	public String getT_userinfo_name() {
		return t_userinfo_name;
	}

	public void setT_userinfo_name(String t_userinfo_name) {
		this.t_userinfo_name = t_userinfo_name;
	}

	public LoginLogBean(){
		
	}

	public int getT_loginlog_id() {
		return t_loginlog_id;
	}

	public void setT_loginlog_id(int t_loginlog_id) {
		this.t_loginlog_id = t_loginlog_id;
	}

	public int getT_userinfo_id() {
		return t_userinfo_id;
	}

	public void setT_userinfo_id(int t_userinfo_id) {
		this.t_userinfo_id = t_userinfo_id;
	}

	public String getT_loginlog_time() {
		return t_loginlog_time;
	}

	public void setT_loginlog_time(String t_loginlog_time) {
		this.t_loginlog_time = t_loginlog_time;
	}

	public int getT_loginlog_ifsuccess() {
		return t_loginlog_ifsuccess;
	}

	public void setT_loginlog_ifsuccess(int t_loginlog_ifsuccess) {
		this.t_loginlog_ifsuccess = t_loginlog_ifsuccess;
	}

	public String getT_loginlog_userip() {
		return t_loginlog_userip;
	}

	public void setT_loginlog_userip(String t_loginlog_userip) {
		this.t_loginlog_userip = t_loginlog_userip;
	}

	public String getT_loginlog_desc() {
		return t_loginlog_desc;
	}

	public void setT_loginlog_desc(String t_loginlog_desc) {
		this.t_loginlog_desc = t_loginlog_desc;
	}
	
}
