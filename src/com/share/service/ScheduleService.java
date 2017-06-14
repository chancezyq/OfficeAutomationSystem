package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.MyScheduleBean;
import com.share.bean.ScheduleOb;
import com.share.dao.ScheduleDao;

@Service
public class ScheduleService {
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	public List<MyScheduleBean> findSchedule(ScheduleOb scheduleOb){
		return scheduleDao.findSchedule(scheduleOb);
	}
}
