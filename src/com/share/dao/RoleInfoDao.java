package com.share.dao;

import java.util.List;

import com.share.bean.RoleInfoBean;

public interface RoleInfoDao{
	/**
	 * 
	 *查询所用 角色名 
	 *
	 */
	public List<RoleInfoBean> findRole();


}
