package com.share.bean;

import java.io.Serializable;

/**
 * 消息类型表对应javabean
 * 
 * @author Administrator
 *
 */

public class MessageTypeBean implements Serializable {
	private int t_messagetype_id;// 消息类型id
	private String t_messagetype_name;// 消息类型名称
	private String t_messagetype_desc;// 消息类型描述

	public int getT_messagetype_id() {
		return t_messagetype_id;
	}

	public void setT_messagetype_id(int t_messagetype_id) {
		this.t_messagetype_id = t_messagetype_id;
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

}
