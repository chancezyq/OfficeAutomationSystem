package com.share.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.ModelMap;

import com.share.bean.LogBean;

public interface LogDao {
	public void addLog(LogBean logBean);
	public List<LogBean> findLog(@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize,@Param(value="username") String username);
	public int pageCounts(@Param(value="username") String username);
}
