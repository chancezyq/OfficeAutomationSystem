package com.share.dao;

import java.util.List;

import com.share.bean.DepartBean;
import com.share.bean.DepartPojo;

public interface DepartDao {
	/**
	 * 查询所有部门信息
	 * @return
	 */
	public List<DepartPojo> findAllDepart();
	public void updetDepart(DepartBean departBean);
	public void addDepart(DepartBean departBean);
	public void deleteDepart(String id);
}
