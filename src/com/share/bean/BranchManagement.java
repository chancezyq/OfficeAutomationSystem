package com.share.bean;

import java.io.Serializable;

public class BranchManagement implements Serializable {

	private int t_branchinfo_id;
	private String t_branchinfo_name;
	private String t_branchinfo_shortname;

	public int getT_branchinfo_id() {
		return t_branchinfo_id;
	}

	public void setT_branchinfo_id(int t_branchinfo_id) {
		this.t_branchinfo_id = t_branchinfo_id;
	}

	public String getT_branchinfo_name() {
		return t_branchinfo_name;
	}

	public void setT_branchinfo_name(String t_branchinfo_name) {
		this.t_branchinfo_name = t_branchinfo_name;
	}

	public String getT_branchinfo_shortname() {
		return t_branchinfo_shortname;
	}

	public void setT_branchinfo_shortname(String t_branchinfo_shortname) {
		this.t_branchinfo_shortname = t_branchinfo_shortname;
	}

}
