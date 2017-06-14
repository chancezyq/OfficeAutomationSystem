package com.share.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.share.bean.SignBean;
@Component
public interface SignDao {
	//添加签到信息
	public void signAdd(SignBean signBean);
	//显示签到信息
	public List<SignBean> signShow();
}
