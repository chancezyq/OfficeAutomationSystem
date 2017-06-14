package com.share.listener;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class UserListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent sessionEvent) {
//		// TODO Auto-generated method stub
//		System.out.println("创建session，人数加1");
//		//获取Servletcontext
//		ServletContext context = sessionEvent.getSession().getServletContext();
//		//获取当前人数
//		Integer count = (Integer) context.getAttribute("OnlineCount");
//		if(count== null){
//			//如果为空，初始化为1（第一个访问的用户）
//			count = new Integer(1);
//		}else{
//			//+1
//			int i = count.intValue();
//			count = new Integer(i+1);
//		}
//		//改变人数
//		context.setAttribute("OnlineCount", count);

        System.out.println("sessionCreated");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date time = new Date();
        String startTime = sdf.format(time);
        System.out.println("当前时间为" + startTime);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent sessionEvent) {
//		// TODO Auto-generated method stub
//		System.out.println("销毁session，人数减1");
//		ServletContext context = sessionEvent.getSession().getServletContext();
//		Integer count = (Integer) context.getAttribute("OnlineCount");
//		int i = count.intValue();
//		context.setAttribute("OnlineCount", count);
	}
	
}
