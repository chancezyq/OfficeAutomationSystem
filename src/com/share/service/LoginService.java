package com.share.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.ManageBean;
import com.share.bean.PowerBean;
import com.share.dao.ManageDao;
import com.share.dao.PowerDao;

@Service
public class LoginService {
	@Autowired
	private ManageDao manageDao;

	@Autowired
	private PowerDao powerDao;

	public List<ManageBean> findManage(String user) {
		return manageDao.findManage(user);
	}

	public List<PowerBean> findPower(String manage) {
		return powerDao.findPower(manage);
	}
	/**
	 * 将全线名称用map 储存  key为 manage名称
	 * value 为powerBean 的集合
	 * @param user
	 * @return
	 */
	public Map<String, List<PowerBean>> findManagePower(String user) {
		Map<String, List<PowerBean>> map = new LinkedHashMap<>();
		List<ManageBean> list = findManage(user);
		for (ManageBean manageBean : list) {
			System.out.println(manageBean.getT_manage_name());
			List<PowerBean> list2 = findPower(manageBean.getT_manage_name());
			map.put(manageBean.getT_manage_name(), list2);
		}
		return map;
	}
}
