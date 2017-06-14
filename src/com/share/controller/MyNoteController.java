package com.share.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.MyNoteBean;
import com.share.service.MyNoteService;

@Controller
public class MyNoteController {
	@Autowired
	private MyNoteService myNoteService;
	//显示便签
	@RequestMapping("my_note.do")
	public String myNoteShow(HttpServletRequest request,HttpServletResponse response){
		System.out.println("===系统进入显示便签=====");
		List<MyNoteBean> mynotelist = myNoteService.myNoteShow();
		request.setAttribute("mynotelist", mynotelist);
		//显示便签总条数
		int count = myNoteService.myNoteCount();
		request.setAttribute("count", count);
		return "mynoteshow";
	}
	//添加便签
	@RequestMapping("mynoteadd.do")
	public void myNoteAdd(HttpServletRequest request,HttpServletResponse response){
		System.out.println("========系统进入添加便签=======");
		String id = request.getParameter("mynoteId");
		int id1 = Integer.parseInt(id);
		String title = request.getParameter("mynotetitle");
		String content = request.getParameter("mynotecontent");
		String time = request.getParameter("mynotecreatetime");
		String creater = request.getParameter("mynotecreateuser");
		MyNoteBean note = new MyNoteBean(id1,title,content,time,creater);
		myNoteService.myNoteAdd(note);
		try {
			request.getRequestDispatcher("my_note.do").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//跳转到添加便签界面
	@RequestMapping("mynoteadd1.do")
	public String forward(){
		return "mynoteadd";
	}
	
	//删除便签
	@RequestMapping("mynotedelete.do")
	public void myNoteDelete(HttpServletRequest request,HttpServletResponse response){
		System.out.println("======系统进入删除便签======");
		String id = request.getParameter("id");
		int id1 = Integer.parseInt(id);
		myNoteService.myNoteDelete(id1);
		try {
			request.getRequestDispatcher("my_note.do").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//跳转到修改便签页面
	@RequestMapping("mynoteupdate1.do")
	public String forward1(){
		return "mynoteupdate";
	}
	//修改便签
	@RequestMapping("mynoteupdate.do")
	public void myNoteUpdate(HttpServletRequest request,HttpServletResponse response){
		System.out.println("======系统进入修改便签=====");
		String id = request.getParameter("mynoteId");
		int id1 = Integer.parseInt(id);
		String title = request.getParameter("mynotetitle");
		String content = request.getParameter("mynotecontent");
		MyNoteBean mynote = new MyNoteBean();
		mynote.setT_mynote_id(id1);
		mynote.setT_mynote_title(title);
		mynote.setT_mynote_content(content);
		myNoteService.myNoteUpdate(mynote);
		try {
			request.getRequestDispatcher("my_note.do").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
