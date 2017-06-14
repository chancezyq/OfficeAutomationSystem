package com.share.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.LoginLogBean;
import com.share.service.LoginLogService;

@Controller
public class LoginLogController {
	@Autowired
	private LoginLogService loginLog;


	//显示登录日志
	@RequestMapping("login_log.do")
	public String loginLogShow(HttpServletRequest request,HttpServletResponse response){
		//获得登陆日志表信息
		List<LoginLogBean> list = loginLog.loginLogShow();
//		//获得登陆用户id
//		int userid = (int) request.getSession().getAttribute("usrid");
		request.getSession().setAttribute("loginloglist", list);
		return "loginlogshow";
	}
}
