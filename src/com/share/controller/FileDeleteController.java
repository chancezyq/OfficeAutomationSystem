package com.share.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.share.bean.FileInfoBean;
import com.share.service.FileDeleteService;

@Controller
public class FileDeleteController {
	@Autowired
	private FileDeleteService delete;
	//彻底删除
	@RequestMapping("filedelete.do")
	public void fileDelete(HttpServletRequest request,HttpServletResponse response,MultipartFile file) throws ServletException, IOException{
		System.out.println("=========系统进入测底删除操作===========");
		String id = request.getParameter("fileinfoid");
		int id1 = Integer.parseInt(id);
		String path = request.getParameter("filepath");
		System.out.println("文件路径===========："+path);
		delete.delFile(path);
		delete.fileDelete(id1);
		request.getRequestDispatcher("trash.do").forward(request, response);
	}
	//放入回收站
	@RequestMapping("ifdelete.do")
	public void ifDelete(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		System.out.println("======系统进入放入回收站操作=====");
		String id = request.getParameter("fileinfoid");
		int id1 = Integer.parseInt(id);
		int ifdelete = 1;
		FileInfoBean deletefile = new FileInfoBean(id1,ifdelete);
		delete.trash(deletefile);
		request.getRequestDispatcher("file_management.do").forward(request, response);
	}
	//取消删除
	@RequestMapping("canceldelete.do")
	public void cancelDelete(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		System.out.println("======系统进入取消删除操作，从回收站取回========");
		String id = request.getParameter("fileinfoid");
		int id1 = Integer.parseInt(id);
		int ifdelete = 2;
		FileInfoBean deletefile = new FileInfoBean(id1,ifdelete);
		delete.cancel(deletefile);
		request.getRequestDispatcher("trash.do").forward(request, response);
	}
	
}
