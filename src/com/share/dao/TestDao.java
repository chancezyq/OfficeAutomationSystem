package com.share.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.share.bean.UserBean;
@Component
public interface TestDao {
	public List<UserBean> test();
}
