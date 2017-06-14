package com.share.bean;

import java.io.Serializable;

public class ScheduleOb implements Serializable{
	private String t_scheduleob_id;
	private String t_schedule_id;
	private String t_userinfo_id;
	private String t_branchinfo_id;
	private String t_departinfo_id;
	private String t_schedule_begintime;
	private String t_schedule_endtime;
	public String getT_departinfo_id() {
		return t_departinfo_id;
	}
	public void setT_departinfo_id(String t_departinfo_id) {
		this.t_departinfo_id = t_departinfo_id;
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
	public String getT_scheduleob_id() {
		return t_scheduleob_id;
	}
	public void setT_scheduleob_id(String t_scheduleob_id) {
		this.t_scheduleob_id = t_scheduleob_id;
	}
	public String getT_schedule_id() {
		return t_schedule_id;
	}
	public void setT_schedule_id(String t_schedule_id) {
		this.t_schedule_id = t_schedule_id;
	}
	public String getT_userinfo_id() {
		return t_userinfo_id;
	}
	public void setT_userinfo_id(String t_userinfo_id) {
		this.t_userinfo_id = t_userinfo_id;
	}
	public String getT_branchinfo_id() {
		return t_branchinfo_id;
	}
	public void setT_branchinfo_id(String t_branchinfo_id) {
		this.t_branchinfo_id = t_branchinfo_id;
	}
	public ScheduleOb(String user,String branch,String depart,String begintime,String endtime){
		this.t_branchinfo_id=branch;
		this.t_userinfo_id=user;
		this.t_departinfo_id=depart;
		this.t_schedule_begintime=begintime;
		this.t_schedule_endtime=endtime;
	}
}
