package com.share.dao;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.MessageBean;
import com.share.bean.MessageDetailsBean;
import com.share.bean.MessageTypeBean;
import com.share.bean.UserBean;

/**
 * 消息管理dao层
 * 
 * @author Administrator
 *
 */

@RequestMapping
public interface MessageManagementDao {

	/**
	 * dao层通过登录用户名获取其userinfoid,用于查询message
	 * 
	 * @param username
	 * @return
	 */
	public int findMessageUserInfoid(String username);

	/**
	 * dao层获取登录用户所发出的消息数量
	 * 
	 * @param userinfoid
	 * @return
	 */
	public int findSendCount(int userinfoid);

	/**
	 * dao层显示登录用户发送的消息
	 * 
	 */
	public List<MessageDetailsBean> findUserSendMessage(int userinfoid);

	/**
	 * dao层获取登录用户收到的消息数量
	 * 
	 * @param userinfoid
	 * @return
	 */
	public int findHoldCount(int userinfoid);

	/**
	 * dao层显示登录用户收到的消息
	 * 
	 */
	public List<MessageDetailsBean> findUserHoldMessage(int userinfoid);

	/**
	 * 获取消息类型信息
	 * 
	 * @return
	 */
	public List<MessageTypeBean> findMessageType();

	/**
	 * 获取消息表中消息编号最大值
	 * 
	 * @return
	 */
	public int findMaxMessageid();

	/**
	 * dao层发送消息
	 * 
	 * @param messagebean
	 */
	public void sendMessages(MessageBean messagebean);

	/**
	 * dao层获取需要修改的消息信息
	 * 
	 * @param messageid
	 * @return
	 */
	public MessageBean selectUpdateMessage(int messageid);

	/**
	 * 获取本次修改的消息类型
	 * 
	 * @param messagetypeid
	 * @return
	 */
	public String selectUpdateMessageType(int messagetypeid);

	/**
	 * 修改登录用户所发的消息
	 * 
	 * @param messageid
	 */
	public void updateMessages(MessageBean message);

	/**
	 * 删除登陆用户所发出的消息
	 * 
	 * @param messageid
	 */
	public void deleteMessage(int messageid);

}
