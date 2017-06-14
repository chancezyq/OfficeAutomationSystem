package com.share.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.util.PropertiesUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.StaticApplicationContext;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import com.mchange.v2.util.PropertiesUtils;
import com.share.bean.FileInfoBean;
import com.share.service.FileInfoService;
import com.sun.xml.internal.fastinfoset.sax.Properties;

@Controller
public class FileUploadController {
	/*
	 * MultipartFile:用于接收客户端传来的文件。
	 */
	@Autowired
	private FileInfoService fileInfoService;

	// public String
	// PATH="D:\\eclipse-jee\\workspace\\OfficeAutomationSystem\\WebRoot\\upload\\";
	@RequestMapping("fileupload.do")
	public void filesUpload(@RequestParam("myfiles") MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("====文件上传controller===");
		// 获得文件路径
		String path = request.getSession().getServletContext().getRealPath("/");
		String filePath = path + "upload\\" + file.getOriginalFilename();
		// 保存文件
		saveFile(request, file);
		int id = Integer.parseInt(request.getParameter("fileid"));
		String name = file.getOriginalFilename();
		String remark = request.getParameter("fileremark");
		String username = (String) request.getSession().getAttribute("username");
		// 获取系统当前时间
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String creatDate = dateFormat.format(date);
		int typeid = 0;
		if (name.contains("doc")) {
			typeid = 2;
		}
		if (name.contains("xlsx")) {
			typeid = 3;
		}
		if (name.contains("txt")) {
			typeid = 1;
		}
		System.out.println("typeid" + typeid);
		//设置ifdelete为2，将其放入回收站
		int ifdelete = 2;
		FileInfoBean fileInfoBean = new FileInfoBean(id, name, typeid, remark, username, creatDate,
				filePath,ifdelete);
		fileInfoService.addFile(fileInfoBean);
		request.getRequestDispatcher("file_management.do").forward(request, response);
	}

	/**
	 * ResponseEntity<byte[]>:响应文件下载
	 */
	@RequestMapping("filedownload")
	public ResponseEntity<byte[]> download(HttpServletRequest request) throws IOException {
		// 得到文件路径
		String path = request.getParameter("filepath");
		// 得到文件名
		String fileName1 = request.getParameter("filename");
		// 把文件封装到File对象中
		File file = new File(path);
		// 设置响应头
		HttpHeaders headers = new HttpHeaders();
		// 为了结局中文名称乱码问题
		String fileName = new String(fileName1.getBytes("UTF-8"), "iso-8859-1");
		// 文件下载响应头的固定格式
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", fileName);
		/*
		 * FielUtils:SpringMVC中，读取文件的类
		 */
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(FileUtils.readFileToByteArray(file), headers,
				HttpStatus.CREATED);
		return responseEntity;
	}

	@ExceptionHandler(MaxUploadSizeExceededException.class)
	public String handleException(MaxUploadSizeExceededException ex) throws Exception {
		System.out.println("------");
		return "redirect:/fileUpload.jsp";
	}

	private void saveFile(HttpServletRequest request, MultipartFile file) {
		// 判断文件是否为空
		if (!file.isEmpty()) {
			try {

				/*
				 * MultipartFile类的getOriginalFilename方法用于获取文件名
				 */
				String path = request.getSession().getServletContext().getRealPath("/");
				System.out.println(path);
				String filePath = path + "upload\\" + file.getOriginalFilename();
				System.out.println(filePath);
				// 把上传文件封装到File对象中
				File saveDir = new File(filePath);
				System.out.println("FIle::"+saveDir.getAbsolutePath());
				// 判断上传文件的路径是否存在，如果文件路径不存在，则创始该目录
				if (!saveDir.getParentFile().exists())
					saveDir.getParentFile().mkdirs();
				/*
				 * 存放文件 MultipartFile对象的transferTo完成文件的读写操作
				 */
				file.transferTo(saveDir);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping("fileupload1.do")
	public String upload() {
		return "fileupload";

	}
}
