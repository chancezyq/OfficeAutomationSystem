package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.UserBean;
import com.share.dao.TestDao;

@Service
public class MyService {
	@Autowired
	private TestDao testDao;

	public TestDao getTestDao() {
		return testDao;
	}

	public void setTestDao(TestDao testDao) {
		this.testDao = testDao;
	}
	
	
	public List<UserBean> testCheck(){
		return testDao.test();
	}
}
