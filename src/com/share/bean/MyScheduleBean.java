package com.share.bean;

import java.io.Serializable;

public class MyScheduleBean implements Serializable {
	private int t_schedule_id;
	private String t_schedule_title;
	private String t_schedule_address;
	private int t_meetinginfo_id;
	private String t_schedule_begintime;
	private String t_schedule_endtime;
	private String t_schedule_content;
	private String t_schedule_createuser;
	private String t_schedule_createtime;
	private int t_schedule_ifprivate;
	private String t_departinfo_id;

	public String getT_departinfo_id() {
		return t_departinfo_id;
	}

	public void setT_departinfo_id(String t_departinfo_id) {
		this.t_departinfo_id = t_departinfo_id;
	}

	public int getT_schedule_id() {
		return t_schedule_id;
	}

	public void setT_schedule_id(int t_schedule_id) {
		this.t_schedule_id = t_schedule_id;
	}

	public String getT_schedule_title() {
		return t_schedule_title;
	}

	public void setT_schedule_title(String t_schedule_title) {
		this.t_schedule_title = t_schedule_title;
	}

	public String getT_schedule_address() {
		return t_schedule_address;
	}

	public void setT_schedule_address(String t_schedule_address) {
		this.t_schedule_address = t_schedule_address;
	}

	public int getT_meetinginfo_id() {
		return t_meetinginfo_id;
	}

	public void setT_meetinginfo_id(int t_meetinginfo_id) {
		this.t_meetinginfo_id = t_meetinginfo_id;
	}

	public String getT_schedule_begintime() {
		return t_schedule_begintime;
	}

	public void setT_schedule_begintime(String t_schedule_begintime) {
		this.t_schedule_begintime = t_schedule_begintime;
	}

	public String getT_schedule_endtime() {
		return t_schedule_endtime;
	}

	public void setT_schedule_endtime(String t_schedule_endtime) {
		this.t_schedule_endtime = t_schedule_endtime;
	}

	public String getT_schedule_content() {
		return t_schedule_content;
	}

	public void setT_schedule_content(String t_schedule_content) {
		this.t_schedule_content = t_schedule_content;
	}

	public String getT_schedule_createuser() {
		return t_schedule_createuser;
	}

	public void setT_schedule_createuser(String t_schedule_createuser) {
		this.t_schedule_createuser = t_schedule_createuser;
	}

	public String getT_schedule_createtime() {
		return t_schedule_createtime;
	}

	public void setT_schedule_createtime(String t_schedule_createtime) {
		this.t_schedule_createtime = t_schedule_createtime;
	}

	public int getT_schedule_ifprivate() {
		return t_schedule_ifprivate;
	}

	public void setT_schedule_ifprivate(int t_schedule_ifprivate) {
		this.t_schedule_ifprivate = t_schedule_ifprivate;
	}

}
