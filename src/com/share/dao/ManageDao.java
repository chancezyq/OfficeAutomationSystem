package com.share.dao;

import java.util.List;

import com.share.bean.ManageBean;

public interface ManageDao {
	public List<ManageBean> findManage(String user);
}
