package com.share.bean;

import java.io.Serializable;

public class LogBean implements Serializable {
	private String t_operationlog_id;
	private String t_operationlog_name;
	private String t_operationlog_username;
	private String t_operationlog_time;
	

	public String getT_operationlog_id() {
		return t_operationlog_id;
	}

	public void setT_operationlog_id(String t_operationlog_id) {
		this.t_operationlog_id = t_operationlog_id;
	}

	public String getT_operationlog_name() {
		return t_operationlog_name;
	}

	public void setT_operationlog_name(String t_operationlog_name) {
		this.t_operationlog_name = t_operationlog_name;
	}

	public String getT_operationlog_username() {
		return t_operationlog_username;
	}

	public void setT_operationlog_username(String t_operationlog_username) {
		this.t_operationlog_username = t_operationlog_username;
	}

	public String getT_operationlog_time() {
		return t_operationlog_time;
	}

	public void setT_operationlog_time(String t_operationlog_time) {
		this.t_operationlog_time = t_operationlog_time;
	}


	public String getT_operationlog_content() {
		return t_operationlog_content;
	}

	public void setT_operationlog_content(String t_operationlog_content) {
		this.t_operationlog_content = t_operationlog_content;
	}

	private String t_operationlog_content;
}
