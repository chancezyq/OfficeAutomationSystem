package com.share.bean;

import org.apache.logging.log4j.core.appender.rolling.SizeBasedTriggeringPolicy;

public class RoleInfoBean {
	private String t_roleinfo_id;
	private String t_roleinfo_name;
	private String t_roleinfo_desc;

	public String getT_roleinfo_id() {
		return t_roleinfo_id;
	}

	public void setT_roleinfo_id(String t_roleinfo_id) {
		this.t_roleinfo_id = t_roleinfo_id;
	}

	public String getT_roleinfo_name() {
		return t_roleinfo_name;
	}

	public void setT_roleinfo_name(String t_roleinfo_name) {
		this.t_roleinfo_name = t_roleinfo_name;
	}

	public String getT_roleinfo_desc() {
		return t_roleinfo_desc;
	}

	public void setT_roleinfo_desc(String t_roleinfo_desc) {
		this.t_roleinfo_desc = t_roleinfo_desc;
	}

}
