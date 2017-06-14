package com.share.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.share.bean.MyScheduleBean;

/**
 * 我的日程管理操作
 * 
 * @author sunkai
 *
 */
@Repository
public interface MyScheduleDao {

	/**
	 * dao层获取我的所有日程
	 * 
	 * @return
	 */
	public List<MyScheduleBean> findAllMySchedule();

	/**
	 * dao层获取所有日程数量
	 * 
	 * @return
	 */
	public int findAllMyScheduleCount();

	/**
	 * dao层添加我的日程
	 * 
	 * @param myschedule
	 */
	public void addMySchedule(MyScheduleBean myschedule);

	/**
	 * dao层删除我的日程
	 * 
	 * @param myscheduleid
	 */
	public void deleteMySchedule(int myscheduleid);

	/**
	 * dao层查询需要修改的日程
	 * 
	 * @param myscheduleid
	 * @return
	 */
	public MyScheduleBean findUpdate(int myscheduleid);

	/**
	 * dao层修改需要修改的日程
	 * 
	 * @param myschedule
	 */
	public void updateMySchedule(MyScheduleBean myschedule);

	/**
	 * 获取我的日程信息并分页显示
	 * 
	 * @return
	 */
	public List<MyScheduleBean> findAllMySchedulePage(@Param(value = "startPos") Integer startPos,
			@Param(value = "pageSize") Integer pageSize);

}
