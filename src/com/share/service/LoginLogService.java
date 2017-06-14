package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.LoginLogBean;
import com.share.dao.LoginLogDao;

@Service
public class LoginLogService {
	@Autowired
	private LoginLogDao loginLog;
	//插入登录信息
	public void loginLog(LoginLogBean login){
		 loginLog.loginLog(login);
	}
	//查询用户登陆日志信息
	public List<LoginLogBean> loginLogShow(){
		return loginLog.loginLogShow();
	}
}
