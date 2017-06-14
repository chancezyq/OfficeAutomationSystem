package com.share.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.share.bean.MyNoteBean;

@Component
public interface MyNoteDao {
	//ÏÔÊ¾±ãÇ©
	public List<MyNoteBean> myNoteShow();
	//ÏÔÊ¾±ãÇ©×ÜÌõÊı
	public int myNoteCount();
	//Ìí¼Ó±ãÇ©
	public void myNoteAdd(MyNoteBean mynote);
	//É¾³ı±ãÇ©
	public void myNoteDelete(int id);
	//ĞŞ¸Ä±ãÇ©
	public void myNoteUpdate(MyNoteBean mynote);
}
