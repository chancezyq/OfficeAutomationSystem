package com.share.bean;

import java.io.Serializable;

/**
 * 用显示消息所有信息的javabean（仅用来显示用，勿乱用）
 * 
 * @author Administrator
 *
 */

public class MessageDetailsBean implements Serializable {

	private int t_message_id;// 消息id
	private String t_message_title;// 消息标题v
	private String t_message_content;// 消息内容v
	private String t_messagetype_name;// 消息类型名称v
	private String t_messagetype_desc;// 消息类型描述v
	private String t_message_begintime;// 开始有效时间v
	private String t_message_endtime;// 有效结束时间v
	private int t_message_ifpublish;// 是否已发布v
	private String t_message_recordtime;// 发送时间v

	private int t_userinfo_id;// 发送者id
	private String t_userinfo_name;// 发送者姓名
	private int t_messagetouser_id;// 序号
	private int t_messagetype_id;// 消息类型

	public int getT_message_id() {
		return t_message_id;
	}

	public void setT_message_id(int t_message_id) {
		this.t_message_id = t_message_id;
	}

	public String getT_message_title() {
		return t_message_title;
	}

	public void setT_message_title(String t_message_title) {
		this.t_message_title = t_message_title;
	}

	public String getT_message_content() {
		return t_message_content;
	}

	public void setT_message_content(String t_message_content) {
		this.t_message_content = t_message_content;
	}

	public String getT_messagetype_name() {
		return t_messagetype_name;
	}

	public void setT_messagetype_name(String t_messagetype_name) {
		this.t_messagetype_name = t_messagetype_name;
	}

	public String getT_messagetype_desc() {
		return t_messagetype_desc;
	}

	public void setT_messagetype_desc(String t_messagetype_desc) {
		this.t_messagetype_desc = t_messagetype_desc;
	}

	public String getT_message_begintime() {
		return t_message_begintime;
	}

	public void setT_message_begintime(String t_message_begintime) {
		this.t_message_begintime = t_message_begintime;
	}

	public String getT_message_endtime() {
		return t_message_endtime;
	}

	public void setT_message_endtime(String t_message_endtime) {
		this.t_message_endtime = t_message_endtime;
	}

	public int getT_message_ifpublish() {
		return t_message_ifpublish;
	}

	public void setT_message_ifpublish(int t_message_ifpublish) {
		this.t_message_ifpublish = t_message_ifpublish;
	}

	public String getT_message_recordtime() {
		return t_message_recordtime;
	}

	public void setT_message_recordtime(String t_message_recordtime) {
		this.t_message_recordtime = t_message_recordtime;
	}

	public int getT_userinfo_id() {
		return t_userinfo_id;
	}

	public void setT_userinfo_id(int t_userinfo_id) {
		this.t_userinfo_id = t_userinfo_id;
	}

	public int getT_messagetouser_id() {
		return t_messagetouser_id;
	}

	public void setT_messagetouser_id(int t_messagetouser_id) {
		this.t_messagetouser_id = t_messagetouser_id;
	}

	public int getT_messagetype_id() {
		return t_messagetype_id;
	}

	public void setT_messagetype_id(int t_messagetype_id) {
		this.t_messagetype_id = t_messagetype_id;
	}

	public String getT_userinfo_name() {
		return t_userinfo_name;
	}

	public void setT_userinfo_name(String t_userinfo_name) {
		this.t_userinfo_name = t_userinfo_name;
	}

}
