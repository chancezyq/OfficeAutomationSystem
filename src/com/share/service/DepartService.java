package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.DepartBean;
import com.share.bean.DepartPojo;
import com.share.dao.DepartDao;

@Service
public class DepartService {
	
	@Autowired
	private DepartDao departDao;
	
	public List<DepartPojo> findAllDepart(){
		System.out.println(departDao.findAllDepart());
		return departDao.findAllDepart();
	}
	public void updateDepart(DepartBean departBean){
		departDao.updetDepart(departBean);
	}
	public void adddepart(DepartBean departBean) {
		departDao.addDepart(departBean);
	}
	public void deletrDepart(String id){
		departDao.deleteDepart(id);
	}
}
