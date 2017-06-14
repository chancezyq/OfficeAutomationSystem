package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.SignBean;
import com.share.dao.SignDao;

@Service
public class SignService {
	@Autowired
	private SignDao signDao;
	//员工签到
	public void signAdd(SignBean signBean){
		signDao.signAdd(signBean);
	}
	//显示员工签到信息
	public List<SignBean> signShow(){
		return signDao.signShow();
	}
}
