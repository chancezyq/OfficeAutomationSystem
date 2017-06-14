package com.share.bean;

import java.io.Serializable;

import org.springframework.http.StreamingHttpOutputMessage;

public class DepartPojo implements Serializable {
	private String t_departinfo_id;
	private String t_departinfo_name;
	private String t_branchinfo_name;
	private String t_userinfo_name;
	private String t_departinfo_tel;
	private String t_departinfo_mobiletel;
	private String t_departinfo_faxes;
	
	public String getT_departinfo_id() {
		return t_departinfo_id;
	}

	public void setT_departinfo_id(String t_departinfo_id) {
		this.t_departinfo_id = t_departinfo_id;
	}

	public String getT_departinfo_name() {
		return t_departinfo_name;
	}

	public void setT_departinfo_name(String t_departinfo_name) {
		this.t_departinfo_name = t_departinfo_name;
	}

	public String getT_userinfo_name() {
		return t_userinfo_name;
	}

	public void setT_userinfo_name(String t_userinfo_name) {
		this.t_userinfo_name = t_userinfo_name;
	}

	public String getT_departinfo_tel() {
		return t_departinfo_tel;
	}

	public void setT_departinfo_tel(String t_departinfo_tel) {
		this.t_departinfo_tel = t_departinfo_tel;
	}

	public String getT_departinfo_mobiletel() {
		return t_departinfo_mobiletel;
	}

	public void setT_departinfo_mobiletel(String t_departinfo_mobiletel) {
		this.t_departinfo_mobiletel = t_departinfo_mobiletel;
	}

	public String getT_departinfo_faxes() {
		return t_departinfo_faxes;
	}

	public void setT_departinfo_faxes(String t_departinfo_faxes) {
		this.t_departinfo_faxes = t_departinfo_faxes;
	}

	public String getT_branchinfo_name() {
		return t_branchinfo_name;
	}

	public void setT_branchinfo_name(String t_branchinfo_name) {
		this.t_branchinfo_name = t_branchinfo_name;
	}
	

}
