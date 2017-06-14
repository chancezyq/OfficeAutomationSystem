package com.share.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.MessageBean;
import com.share.bean.MessageDetailsBean;
import com.share.bean.MessageTypeBean;
import com.share.bean.UserBean;
import com.share.service.MessageManagementService;
import com.share.service.UserService;

@Controller
/**
 * 消息管理控制层
 * 
 * @author Administrator
 *
 */
public class MessageManageController {

	@Autowired
	private MessageManagementService messamanageservice;
	private UserService userservice;

	/**
	 * 获取登录用户的消息信息详情
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/message_management.do")
	public String findUserSendMessage(HttpServletRequest request) {
		String username = (String) request.getSession().getAttribute("username");
		int userid = messamanageservice.findMessageUserinfoid(username);
		request.getSession().setAttribute("loginuserid", userid);
		// 获取发送消息部分
		List<MessageDetailsBean> sendmessagelist = messamanageservice.findUserSendMessage(userid);
		int sendcount = messamanageservice.findSendCount(userid);
		request.setAttribute("sendmessagelist", sendmessagelist);
		request.setAttribute("count", sendcount);
		// 获取收到的消息部分
		List<MessageDetailsBean> holdmessagelist = messamanageservice.findUserHoldMessage(userid);
		int holdcount = messamanageservice.findHoldCount(userid);
		request.setAttribute("holdmessagelist", holdmessagelist);
		request.setAttribute("counts", holdcount);
		return "messagemanagement";
	}

	/**
	 * 登录用户发送消息控制
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/sendMessages.do")
	public void sendMessages(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int messageid = Integer.parseInt(request.getParameter("messageid"));
		String messagetitle = request.getParameter("messagetitle");
		String messagecontent = request.getParameter("messagecontent");
		int messagetype = Integer.parseInt(request.getParameter("messagetype"));
		String commentdatemin = request.getParameter("commentdatemin");
		String commentdatemax = request.getParameter("commentdatemax");
		int createuser = (int) request.getSession().getAttribute("loginuserid");
		int ifpublish = Integer.parseInt(request.getParameter("ifpublish"));
		String sendtime = request.getParameter("sendtime");

		MessageBean messages = new MessageBean();
		messages.setT_message_id(messageid);
		messages.setT_message_title(messagetitle);
		messages.setT_message_content(messagecontent);
		messages.setT_messagetype_id(messagetype);
		messages.setT_message_begintime(commentdatemin);
		messages.setT_message_endtime(commentdatemax);
		messages.setT_userinfo_id(createuser);
		messages.setT_message_ifpublish(ifpublish);
		messages.setT_message_recordtime(sendtime);

		messamanageservice.sendMessages(messages);
		request.getRequestDispatcher("message_management.do").forward(request, response);

	}

	/**
	 * 控制层修改登录用户发送的消息
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/updateMessages.do")
	public void updateMessages(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int messageid = Integer.parseInt(request.getParameter("messageid"));
		String messagetitle = request.getParameter("messagetitle");
		String messagecontent = request.getParameter("messagecontent");
		int messagetype = Integer.parseInt(request.getParameter("messagetype"));
		String commentdatemin = request.getParameter("commentdatemin");
		String commentdatemax = request.getParameter("commentdatemax");
		int ifpublish = Integer.parseInt(request.getParameter("ifpublish"));
		String sendtime = request.getParameter("sendtime");

		MessageBean messages = new MessageBean();
		messages.setT_message_id(messageid);
		messages.setT_message_title(messagetitle);
		messages.setT_message_content(messagecontent);
		messages.setT_messagetype_id(messagetype);
		messages.setT_message_begintime(commentdatemin);
		messages.setT_message_endtime(commentdatemax);
		messages.setT_message_ifpublish(ifpublish);
		messages.setT_message_recordtime(sendtime);
		messamanageservice.updateMessages(messages);
		request.getRequestDispatcher("message_management.do").forward(request, response);
	}

	/**
	 * 删除登录用户所发出的信息
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/DeleteMymessage.do")
	public void deleteMessage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int messageid = Integer.parseInt(request.getParameter("messageid"));
		messamanageservice.deleteMessage(messageid);
		request.getRequestDispatcher("message_management.do").forward(request, response);
	}

	// 控制层转向，转向消息修改页面
	@RequestMapping("/selectmessage.do")
	public String selectUpdateMessages(HttpServletRequest request) {
		int messageid = Integer.parseInt(request.getParameter("messageid"));
		MessageBean updatemessage = messamanageservice.selectUpdateMessage(messageid);

		int messagetypeid = Integer.parseInt(request.getParameter("messagetypeid"));
		String messagetypename = messamanageservice.selectUpdateMessageType(messagetypeid);

		List<MessageTypeBean> messatypelist = messamanageservice.findMessageType();

		request.setAttribute("messatypelist", messatypelist);
		request.setAttribute("messagetypename", messagetypename);
		request.setAttribute("updatemessage", updatemessage);
		request.setAttribute("messagetypeid", messagetypeid);
		return "updatemessage";
	}

	// 控制层转向，转向到消息发送页面
	@RequestMapping("/sendMessageFoword.do")
	public String sendMessageFoword(HttpServletRequest request) {
		List<MessageTypeBean> messatypelist = messamanageservice.findMessageType();
		int messagenumber = messamanageservice.findMaxMessageid();
		request.setAttribute("messatypelist", messatypelist);
		request.setAttribute("messagenumber", messagenumber);
		return "sendmessage";
	}
}
