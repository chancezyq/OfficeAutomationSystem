package com.share.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

//@WebListener
public class UserListenerTest implements ServletRequestListener{

	@Override
	public void requestDestroyed(ServletRequestEvent servletRequestEvent) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void requestInitialized(ServletRequestEvent servletRequestEvent) {
		// TODO Auto-generated method stub
		System.out.println("========系统进入listenertest=======");
		String name = servletRequestEvent.getServletRequest().getParameter("username");
		if(name!=null){
			System.out.println("获得系统登陆用户名"+name);
		}
	}

}
