package com.share.bean;

public class SignBean {
	private int t_manualsign_id;
	private int t_userinfo_id;
	private String t_manualsign_time;
	private String t_manualsign_desc;
	private int t_manualsign_tag;

	public SignBean() {

	}

	public SignBean(int t_manualsign_id, int t_userinfo_id, String t_manualsign_time, String t_manualsign_desc,
			int t_manualsign_tag) {
		this.t_manualsign_id = t_manualsign_id;
		this.t_userinfo_id = t_userinfo_id;
		this.t_manualsign_time = t_manualsign_time;
		this.t_manualsign_desc = t_manualsign_desc;
		this.t_manualsign_tag = t_manualsign_tag;
	}

	public int getT_manualsign_id() {
		return t_manualsign_id;
	}

	public void setT_manualsign_id(int t_manualsign_id) {
		this.t_manualsign_id = t_manualsign_id;
	}

	public int getT_userinfo_id() {
		return t_userinfo_id;
	}

	public void setT_userinfo_id(int t_userinfo_id) {
		this.t_userinfo_id = t_userinfo_id;
	}

	public String getT_manualsign_time() {
		return t_manualsign_time;
	}

	public void setT_manualsign_time(String t_manualsign_time) {
		this.t_manualsign_time = t_manualsign_time;
	}

	public String getT_manualsign_desc() {
		return t_manualsign_desc;
	}

	public void setT_manualsign_desc(String t_manualsign_desc) {
		this.t_manualsign_desc = t_manualsign_desc;
	}

	public int getT_manualsign_tag() {
		return t_manualsign_tag;
	}

	public void setT_manualsign_tag(int t_manualsign_tag) {
		this.t_manualsign_tag = t_manualsign_tag;
	}

}
