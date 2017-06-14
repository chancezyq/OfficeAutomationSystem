package com.share.bean;

import java.io.Serializable;

/**
 * 消息发送对象表对应javabean
 * 
 * @author Administrator
 *
 */
public class MessageToUserBean implements Serializable {

	private int t_messagetouser_id;// 序号
	private int t_message_id;// 消息id
	private int t_userinfo_id;// 消息接受者id
	private int t_id_read;// 消息是否已读

	public int getT_messagetouser_id() {
		return t_messagetouser_id;
	}

	public void setT_messagetouser_id(int t_messagetouser_id) {
		this.t_messagetouser_id = t_messagetouser_id;
	}

	public int getT_message_id() {
		return t_message_id;
	}

	public void setT_message_id(int t_message_id) {
		this.t_message_id = t_message_id;
	}

	public int getT_userinfo_id() {
		return t_userinfo_id;
	}

	public void setT_userinfo_id(int t_userinfo_id) {
		this.t_userinfo_id = t_userinfo_id;
	}

	public int getT_id_read() {
		return t_id_read;
	}

	public void setT_id_read(int t_id_read) {
		this.t_id_read = t_id_read;
	}

}
