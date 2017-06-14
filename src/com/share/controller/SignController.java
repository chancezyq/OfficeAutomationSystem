package com.share.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.SignBean;
import com.share.dao.SignDao;
import com.share.service.SignService;

@Controller
public class SignController {
	@Autowired
	private SignService sign;

	//员工签到信息显示
	@RequestMapping("manualsign.do")
	public String forward(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("=====系统进入员工签到信息显示==========");
		List<SignBean> list = sign.signShow();
		request.setAttribute("signlist", list);
		return "signshow";
	}

	// 员工签到
	@RequestMapping("signin.do")
	public void maualSign(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("=====系统进入员工签到==========");
		int id =  (int) request.getSession().getAttribute("userid");
		SignBean signBean = new SignBean();
		signBean.setT_userinfo_id(id);
		// 获取系统当前时间
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String signDate = dateFormat.format(date);
		signBean.setT_manualsign_time(signDate);
		System.out.println("=====签到员工id、时间====="+id+signDate);
		sign.signAdd(signBean);
		request.getRequestDispatcher("manualsign.do").forward(request, response);
	}
}
