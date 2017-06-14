package com.share.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.MyScheduleBean;
import com.share.service.MyScheduleService;

@Controller
public class MyScheduleController {

	@Autowired
	private MyScheduleService myscheduleservice;

	/**
	 * 查询获取我的所有日程信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/my_schedule.do")
	public String findAllMySchedules(HttpServletRequest request,Model model) {
		List<MyScheduleBean> myschedulelist = myscheduleservice.getAllMySchedule();
		request.setAttribute("myschedulelist", myschedulelist);
		
		int count = myscheduleservice.getAllMyScheduleCount();
		myscheduleservice.findAllMySchedulePage(request, model);
		request.setAttribute("count", count);
		return "myschedule";
	}

	/**
	 * 向数据库新添加我的日程
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/addmyschedule.do")
	public void addMySchedule(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		// 获取添加页面信息
		int scheduleid = Integer.parseInt(request.getParameter("scheduleid"));
		String scheduletitle = request.getParameter("scheduletitle");
		String address = request.getParameter("address");
		int meetingifo = Integer.parseInt(request.getParameter("meetingifo"));
		String commentdatemin = request.getParameter("commentdatemin");
		String commentdatemax = request.getParameter("commentdatemax");
		String content = request.getParameter("content");
		String createuser = request.getParameter("createuser");
		String createtime = request.getParameter("createtime");
		int ifprivate = Integer.parseInt(request.getParameter("ifprivate"));
		// 设置要填加的属性值
		MyScheduleBean schedule = new MyScheduleBean();
		schedule.setT_schedule_id(scheduleid);
		schedule.setT_schedule_title(scheduletitle);
		schedule.setT_schedule_address(address);
		schedule.setT_meetinginfo_id(meetingifo);
		schedule.setT_schedule_begintime(commentdatemin);
		schedule.setT_schedule_endtime(commentdatemax);
		schedule.setT_schedule_content(content);
		schedule.setT_schedule_createuser(createuser);
		schedule.setT_schedule_createtime(createtime);
		schedule.setT_schedule_ifprivate(ifprivate);
		// 调用service方法添加数据到数据库
		myscheduleservice.addSchedule(schedule);
		request.getRequestDispatcher("my_schedule.do").forward(request, response);
	}

	/**
	 * 修改我的日程
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/updateMySchedule.do")
	public void updateMySchedule(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		// 获取修改页面信息
		int scheduleid = Integer.parseInt(request.getParameter("scheduleid"));
		String scheduletitle = request.getParameter("scheduletitle");
		String address = request.getParameter("address");
		int meetingifo = Integer.parseInt(request.getParameter("meetingifo"));
		String commentdatemin = request.getParameter("commentdatemin");
		String commentdatemax = request.getParameter("commentdatemax");
		String content = request.getParameter("content");
		String createuser = request.getParameter("createuser");
		String createtime = request.getParameter("createtime");
		int ifprivate = Integer.parseInt(request.getParameter("ifprivate"));
		// 设置要修改的属性值
		MyScheduleBean schedule = new MyScheduleBean();
		schedule.setT_schedule_id(scheduleid);
		schedule.setT_schedule_title(scheduletitle);
		schedule.setT_schedule_address(address);
		schedule.setT_meetinginfo_id(meetingifo);
		schedule.setT_schedule_begintime(commentdatemin);
		schedule.setT_schedule_endtime(commentdatemax);
		schedule.setT_schedule_content(content);
		schedule.setT_schedule_createuser(createuser);
		schedule.setT_schedule_createtime(createtime);
		schedule.setT_schedule_ifprivate(ifprivate);
		System.out.println(schedule.toString());
		// 调用service方法添加数据到数据库
		myscheduleservice.updateMySchedule(schedule);
		request.getRequestDispatcher("my_schedule.do").forward(request, response);
	}

	/**
	 * 删除我的日程
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/DeleteMySchedule.do")
	public void deleteMySchedule(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int myscheduleid = Integer.parseInt(request.getParameter("myscheduleid"));
		myscheduleservice.deleteMySchedule(myscheduleid);
		request.getRequestDispatcher("my_schedule.do").forward(request, response);
	}

	// 修改我的日程转向修改页面
	@RequestMapping("/selectupdate.do")
	public String findUpdate(HttpServletRequest request) {
		int myscheduleid = Integer.parseInt(request.getParameter("myscheduleid"));
		MyScheduleBean myschedule = myscheduleservice.findUpdate(myscheduleid);
		request.setAttribute("myschedule", myschedule);
		return "updatemyschedule";
	}

	// 添加我的日程转向添加页面
	@RequestMapping("/addmyscheduleforword.do")
	public String addmyschedulefoword() {
		return "addmyschedule";
	}

}
