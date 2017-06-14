package com.share.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.share.bean.FileDetailsInfo;
import com.share.bean.FileInfoBean;
import com.share.service.FileInfoService;

/**
 * 文件信息处理controller层
 * 
 * @author Administrator
 *
 */
@Controller
public class FileInfoController {

	@Autowired
	private FileInfoService fileinfoservice;

	/**
	 * 获取数据库所有文件及相关附件的详细信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/file_management.do")
	public String showFileDetailsInfo(HttpServletRequest request) {
		// 需要被传递的list
		List<FileDetailsInfo> showfilelist = new ArrayList<FileDetailsInfo>();
		// 暂时储存的list
		List<FileDetailsInfo> showfilelist1 = fileinfoservice.findFileDetailsInfo();
//		String string = null;
//		for (FileDetailsInfo fileDetailsInfo : showfilelist1) {
//			String[] strings = fileDetailsInfo.getT_fileinfo_filepath().split("WebRoot");
//			String string1 = strings[strings.length - 1];
//			string = string1.substring(1, string1.length());
//		}
//		System.out.println("string" + string);

		// 判断ifdelete是否为1，为1则已经放入回收站

		for (int i = 0; i < showfilelist1.size(); i++) {
			int j = showfilelist1.get(i).getT_fileinfo_ifdelete();
			if (j == 2) {
				showfilelist.add(showfilelist1.get(i));
			}
		}

		int count = fileinfoservice.findAllFilecount();
		request.setAttribute("showfilelist", showfilelist);
		request.setAttribute("count", count);
//		request.setAttribute("filepath", string);

		return "showfileinfo";
	}

	/**
	 * 修改文件信息
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/updateFileinfo.do")
	public void updateFileInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		FileInfoBean updatefile = new FileInfoBean();
		updatefile.setT_fileinfo_id(Integer.parseInt(request.getParameter("fileinfoid")));
		updatefile.setT_fileinfo_name(request.getParameter("fileinfoname"));
		updatefile.setT_fileinfo_filetypeid(Integer.parseInt(request.getParameter("fileinfotype")));
		updatefile.setT_fileinfo_remark(request.getParameter("fileinforemark"));
		updatefile.setT_fileinfo_owner(request.getParameter("fileowner"));
		updatefile.setT_fileinfo_createdate(request.getParameter("updatetime"));
		updatefile.setT_fileinfo_ifdelete(Integer.parseInt(request.getParameter("ifdelete")));

		fileinfoservice.updateFileInfo(updatefile);
		response.sendRedirect("file_management.do");
	}

	// 修改文件信息转向修改页面
	@RequestMapping("/SelectUpdateFile.do")
	public String getAllFileinfo(HttpServletRequest request) {
		int fileinfoid = Integer.parseInt(request.getParameter("fileinfoid"));
		FileInfoBean updatefileinfo = fileinfoservice.findUpdateFileinfo(fileinfoid);
		request.setAttribute("updatefile", updatefileinfo);
		return "updatefileinfo";
	}

	// 显示回收站内容
	@RequestMapping("trash.do")
	public String trash(HttpServletRequest request) {
		// 需要被传递的list
		List<FileDetailsInfo> showfilelist = new ArrayList<FileDetailsInfo>();
		// 暂时储存的list
		List<FileDetailsInfo> showfilelist1 = fileinfoservice.findFileDetailsInfo();
//		String string = null;
//		for (FileDetailsInfo fileDetailsInfo : showfilelist1) {
//			String[] strings = fileDetailsInfo.getT_fileinfo_filepath().split("WebRoot");
//			String string1 = strings[strings.length - 1];
//			string = string1.substring(1, string1.length());
//		}
//		System.out.println("string" + string);

		// 判断ifdelete是否为1，为1则已经放入回收站

		for (int i = 0; i < showfilelist1.size(); i++) {
			int j = showfilelist1.get(i).getT_fileinfo_ifdelete();
			if (j == 1) {
				showfilelist.add(showfilelist1.get(i));
			}
		}

		int count = fileinfoservice.findAllFilecount();
		request.setAttribute("showfilelist", showfilelist);
		request.setAttribute("count", count);
//		request.setAttribute("filepath", string);

		return "trashshow";
	}

}
