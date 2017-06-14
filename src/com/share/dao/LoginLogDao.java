package com.share.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.share.bean.LoginLogBean;

@Component
public interface LoginLogDao {
	
	//插入登陆信息
	public void loginLog(LoginLogBean loginlog);
	//查询登陆日志信息
	public List<LoginLogBean > loginLogShow();
}
