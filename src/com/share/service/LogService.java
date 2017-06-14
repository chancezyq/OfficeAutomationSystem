package com.share.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.share.bean.LogBean;
import com.share.dao.LogDao;

@Service
public class LogService {
	@Autowired
	LogDao logDao;
	public List<LogBean> selectLogBean(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="username") String username){
		return logDao.findLog(startPos,pageSize,username);
	}
	public int pageCounts(@Param(value="username") String username) {
		// TODO Auto-generated method stub
		return logDao.pageCounts(username);
	}
}
