package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.MessageBean;
import com.share.bean.MessageDetailsBean;
import com.share.bean.MessageTypeBean;
import com.share.bean.UserBean;
import com.share.dao.MessageManagementDao;
import com.share.dao.UserDao;

/**
 * 消息处理service
 * 
 * @author Administrator
 *
 */
@Service
public class MessageManagementService {

	@Autowired
	private MessageManagementDao messagemanagedao;
	private UserDao userdao;

	/**
	 * service获取登录用户userinfoid
	 * 
	 * @param usrname
	 * @return
	 */
	public int findMessageUserinfoid(String usrname) {
		return messagemanagedao.findMessageUserInfoid(usrname);
	}

	/**
	 * service层获取登录用户所发出消息的总数
	 * 
	 * @param userinfoid
	 * @return
	 */
	public int findSendCount(int userinfoid) {
		return messagemanagedao.findSendCount(userinfoid);
	}

	/**
	 * service获取用户发送的消息
	 * 
	 * @param userinfoid
	 * @return
	 */
	public List<MessageDetailsBean> findUserSendMessage(int userinfoid) {
		return messagemanagedao.findUserSendMessage(userinfoid);
	}

	/**
	 * service层获取登录用户收到消息的总数
	 * 
	 * @param userinfoid
	 * @return
	 */
	public int findHoldCount(int userinfoid) {
		return messagemanagedao.findHoldCount(userinfoid);
	}

	/**
	 * service获取用户收到的消息
	 * 
	 * @param userinfoid
	 * @return
	 */
	public List<MessageDetailsBean> findUserHoldMessage(int userinfoid) {
		return messagemanagedao.findUserHoldMessage(userinfoid);
	}

	/**
	 * service层获取消息类型
	 * 
	 * @return
	 */
	public List<MessageTypeBean> findMessageType() {
		return messagemanagedao.findMessageType();
	}

	/**
	 * service层获取消息表中消息编号最大的值
	 * 
	 * @return
	 */
	public int findMaxMessageid() {
		return messagemanagedao.findMaxMessageid();
	}

	/**
	 * service层获取用户的用户名和编号
	 * 
	 * @return
	 */
	public List<UserBean> findUserIdName() {
		return userdao.userShow();
	}

	/**
	 * service层发送消息控制
	 * 
	 * @param messagebean
	 */
	public void sendMessages(MessageBean messagebean) {
		messagemanagedao.sendMessages(messagebean);

	}

	/**
	 * service层获取需要修改的消息信息
	 * 
	 * @param messageid
	 * @return
	 */
	public MessageBean selectUpdateMessage(int messageid) {
		return messagemanagedao.selectUpdateMessage(messageid);
	}

	/**
	 * service层获取本次修改消息的类型名称
	 * 
	 * @param messagetypeid
	 * @return
	 */
	public String selectUpdateMessageType(int messagetypeid) {
		return messagemanagedao.selectUpdateMessageType(messagetypeid);

	}

	/**
	 * service层修改登录用户发送的消息
	 * 
	 * @param messageid
	 */
	public void updateMessages(MessageBean message) {
		messagemanagedao.updateMessages(message);
	}

	/**
	 * service层删除登录用户发出的消息
	 * 
	 * @param messageid
	 */
	public void deleteMessage(int messageid) {
		messagemanagedao.deleteMessage(messageid);

	}
}
