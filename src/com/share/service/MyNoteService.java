package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.MyNoteBean;
import com.share.dao.MyNoteDao;

@Service
public class MyNoteService {
	@Autowired
	private MyNoteDao myNoteDao;

	public MyNoteDao getMyNoteDao() {
		return myNoteDao;
	}

	public void setMyNoteDao(MyNoteDao myNoteDao) {
		this.myNoteDao = myNoteDao;
	}
	//œ‘ æ±„«©
	public List<MyNoteBean> myNoteShow(){
		return myNoteDao.myNoteShow();
	}
	//œ‘ æ±„«©◊‹Ãı ˝
	public int myNoteCount(){
		return myNoteDao.myNoteCount();
	}
	//ÃÌº”±„«©
	public void myNoteAdd(MyNoteBean mynote){
		myNoteDao.myNoteAdd(mynote);
	}
	//…æ≥˝±„«©
	public void myNoteDelete(int id){
		myNoteDao.myNoteDelete(id);
	}
	//–ﬁ∏ƒ±„«©
	public void myNoteUpdate(MyNoteBean mynote){
		myNoteDao.myNoteUpdate(mynote);
	}
}
