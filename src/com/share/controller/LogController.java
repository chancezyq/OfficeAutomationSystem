package com.share.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.share.bean.LogBean;
import com.share.service.LogService;
import com.share.util.Page;

@Controller
public class LogController {
	@Autowired
	LogService logService;
	
	@RequestMapping("searchLog.do")
	 public String userInto(Model model,HttpServletRequest request) {
		String username =(String) request.getSession().getAttribute("username");
		if(username==null||"".equals(username)){
			return null;
		}
		showPages(request, model, username);
		return "log"; 
		
	}
	@RequestMapping("operate_log.do")
	public String userInit(Model model,HttpServletRequest request){
		showPages(request, model, null);
		return "log";
	}
	
	public void showPages(HttpServletRequest request, Model model,String username){
		String pageNow=request.getParameter("pageNow");
		Page page =null;
		List<LogBean> logBeans=new ArrayList<>();
		int totalCount =logService.pageCounts(username);
		if (pageNow!=null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			logBeans=logService.selectLogBean(page.getStartPos(), page.getPageSize(), username);
		}else{
			page=new Page(totalCount, 1);
			logBeans=logService.selectLogBean(page.getStartPos(), page.getPageSize(), username);
		}
		model.addAttribute("logBeans",logBeans);
		model.addAttribute("page",page);
	}
}
