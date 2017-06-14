package com.share.dao;

import java.util.List;

import com.share.bean.PowerBean;

public interface PowerDao {
	public List<PowerBean> findPower(String manage);
}
