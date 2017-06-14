package com.share.aspect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.LogBean;
import com.share.dao.LogDao;

@Service
public class LogLogService {
	@Autowired
	LogDao logDao;
	public void add(LogBean logBean){
		logDao.addLog(logBean);
	}
}
