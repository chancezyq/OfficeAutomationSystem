package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.RoleInfoBean;
import com.share.dao.RoleInfoDao;

@Service
public class RoleInfoService {
	@Autowired 
	RoleInfoDao roleInfoDao;
	
	public List<RoleInfoBean> findRole(){
		return roleInfoDao.findRole();
	}
}
