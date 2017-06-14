package com.share.bean;

import java.io.Serializable;

public class UserBean implements Serializable {
	private int t_userinfo_id;
	private String t_userinfo_name;
	private String t_userinfo_password;
	private int t_userstate_id;
	private int t_roleinfo_id;
	private String t_userinfo_gender;
	private int t_departinfo_id;
	public UserBean(){
		
	}
	public UserBean(int t_userinfo_id,String t_userinfo_name,String t_userinfo_password,int t_departinfo_id,String t_userinfo_gender,int t_roleinfo_id,int t_userstate_id){
		this.t_userinfo_id = t_userinfo_id;
		this.t_userinfo_name =t_userinfo_name;
		this.t_userinfo_password = t_userinfo_password;
		this.t_departinfo_id =t_departinfo_id;
		this.t_userinfo_gender =t_userinfo_gender;
		this.t_roleinfo_id = t_roleinfo_id;
		this.t_userstate_id = t_userstate_id;
	}
	public int getT_userinfo_id() {
		return t_userinfo_id;
	}
	public void setT_userinfo_id(int t_userinfo_id) {
		this.t_userinfo_id = t_userinfo_id;
	}
	public String getT_userinfo_name() {
		return t_userinfo_name;
	}
	public void setT_userinfo_name(String t_userinfo_name) {
		this.t_userinfo_name = t_userinfo_name;
	}
	public String getT_userinfo_password() {
		return t_userinfo_password;
	}
	public void setT_userinfo_password(String t_userinfo_password) {
		this.t_userinfo_password = t_userinfo_password;
	}
	public int getT_departinfo_id() {
		return t_departinfo_id;
	}
	public void setT_departinfo_id(int t_departinfo_id) {
		this.t_departinfo_id = t_departinfo_id;
	}
	public String getT_userinfo_gender() {
		return t_userinfo_gender;
	}
	public void setT_userinfo_gender(String t_userinfo_gender) {
		this.t_userinfo_gender = t_userinfo_gender;
	}
	public int getT_roleinfo_id() {
		return t_roleinfo_id;
	}
	public void setT_roleinfo_id(int t_roleinfo_id) {
		this.t_roleinfo_id = t_roleinfo_id;
	}
	public int getT_userstate_id() {
		return t_userstate_id;
	}
	public void setT_userstate_id(int t_userstate_id) {
		this.t_userstate_id = t_userstate_id;
	}
	
}	
