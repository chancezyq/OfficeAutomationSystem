package com.share.bean;

import java.io.Serializable;

public class PowerBean implements Serializable {
	private String t_power_id;
	private String t_power_name;
	private String t_power_uri;

	public String getT_power_id() {
		return t_power_id;
	}

	public void setT_power_id(String t_power_id) {
		this.t_power_id = t_power_id;
	}

	public String getT_power_name() {
		return t_power_name;
	}

	public void setT_power_name(String t_power_name) {
		this.t_power_name = t_power_name;
	}

	public String getT_power_uri() {
		return t_power_uri;
	}

	public void setT_power_uri(String t_power_uri) {
		this.t_power_uri = t_power_uri;
	}

}
