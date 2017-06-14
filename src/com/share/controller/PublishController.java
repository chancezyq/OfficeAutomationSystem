package com.share.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.remoting.httpinvoker.HttpInvokerServiceExporter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.MessageDetailsBean;
import com.share.service.PublishService;

/**
 * 控制层公告消息控制
 * 
 * @author Administrator
 *
 */
@Controller
public class PublishController {

	@Autowired
	private PublishService publishservice;

	// 页面转向，在查看完更多公告后点击首页，返回控制首页
	@RequestMapping("fowordfromindex.do")
	public String selectPublish(HttpServletRequest request) {
		return "index";
	}

	// 查看更多的公告消息
	@RequestMapping("/publish.do")
	public String showPublish(HttpServletRequest request) {
		int counts = publishservice.getPublishCounts();
		request.setAttribute("counts", counts);
		return "showpublish";
	}

	/**
	 * 查看单条公告详情
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/publishDetails.do")
	public String publishDetails(HttpServletRequest request) {
		int publishid = Integer.parseInt(request.getParameter("publishid"));
		MessageDetailsBean publishes = publishservice.getPublishes(publishid);
		request.setAttribute("publishes", publishes);
		return "publishdetails";
	}
}
