package com.share.dao;

import java.util.List;

import com.share.bean.MyScheduleBean;
import com.share.bean.ScheduleOb;

public interface ScheduleDao {
	public List<MyScheduleBean> findSchedule(ScheduleOb scheduleOb);
}
