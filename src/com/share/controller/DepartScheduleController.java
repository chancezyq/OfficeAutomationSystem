package com.share.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.BranchManagement;
import com.share.bean.DepartBean;
import com.share.bean.DepartPojo;
import com.share.bean.MyScheduleBean;
import com.share.bean.ScheduleOb;
import com.share.bean.UserBean;
import com.share.service.BranchManagementService;
import com.share.service.DepartService;
import com.share.service.ScheduleService;
import com.share.service.UserService;

import javafx.concurrent.ScheduledService;

@Controller
public class DepartScheduleController {
	
	@Autowired
	private DepartService departService;
	@Autowired
	private UserService userService;
	@Autowired
	private BranchManagementService branch;
	@Autowired
	private ScheduleService scheduledService;
	
	@RequestMapping("depart_schedule.do")
	public String goSchedule(HttpServletRequest request){
		List<UserBean> list1 = userService.userShow();
		List<BranchManagement> list2 = branch.getAllBranchList();
		List<DepartPojo> list3 =departService.findAllDepart();
		request.getSession().setAttribute("userlist", list1);
		request.getSession().setAttribute("branchlist", list2);
		request.getSession().setAttribute("departlist", list3);
		return "departSchedule";
	}
	
	@RequestMapping("findschedule.do")
	public String findSchedule(HttpServletRequest request){
		String userid=request.getParameter("user");
		String departid=request.getParameter("depart");
		String branchid=request.getParameter("branch");
		String starttime=request.getParameter("starttime");
		String endtime=request.getParameter("endtime");
		ScheduleOb scheduleOb=new ScheduleOb(userid, branchid, departid,starttime,endtime);
		List<MyScheduleBean> list =scheduledService.findSchedule(scheduleOb);
		int count=list.size();
		System.out.println(starttime);
		System.out.println(userid);
		System.out.println(departid);
		System.out.println(branchid);
		System.out.println(endtime);
		System.out.println(list);
		request.getSession().setAttribute("myschedulelist", list);
		request.getSession().setAttribute("schedulecount", count);
		return "departsch";
		
	}
}
