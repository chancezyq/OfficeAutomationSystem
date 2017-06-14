package com.share.bean;

import java.io.Serializable;

public class MyNoteBean implements Serializable {
	private int t_mynote_id;
	private String t_mynote_title;
	private String t_mynote_content;
	private String t_mynote_createtime;
	private String t_mynote_createuser;
	public MyNoteBean(){
		
	}
	public MyNoteBean(int t_mynote_id,String t_mynote_title,String t_mynote_content,String t_mynote_createtime,String t_mynote_createuser){
		this.t_mynote_id = t_mynote_id;
		this.t_mynote_title = t_mynote_title;
		this.t_mynote_content = t_mynote_content;
		this.t_mynote_createtime =t_mynote_createtime;
		this.t_mynote_createuser = t_mynote_createuser;
	}
	public int getT_mynote_id() {
		return t_mynote_id;
	}
	public void setT_mynote_id(int t_mynote_id) {
		this.t_mynote_id = t_mynote_id;
	}
	public String getT_mynote_title() {
		return t_mynote_title;
	}
	public void setT_mynote_title(String t_mynote_title) {
		this.t_mynote_title = t_mynote_title;
	}
	public String getT_mynote_content() {
		return t_mynote_content;
	}
	public void setT_mynote_content(String t_mynote_content) {
		this.t_mynote_content = t_mynote_content;
	}
	public String getT_mynote_createtime() {
		return t_mynote_createtime;
	}
	public void setT_mynote_createtime(String t_mynote_createtime) {
		this.t_mynote_createtime = t_mynote_createtime;
	}
	public String getT_mynote_createuser() {
		return t_mynote_createuser;
	}
	public void setT_mynote_createuser(String t_mynote_createuser) {
		this.t_mynote_createuser = t_mynote_createuser;
	}
	
}
