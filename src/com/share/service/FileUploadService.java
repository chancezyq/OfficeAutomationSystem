package com.share.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.catalina.core.ApplicationPart;
import org.springframework.stereotype.Service;

@Service
@MultipartConfig()
public class FileUploadService {
	//文件上传
	
	private static final long serialVersionUID = 1L;

	public String fileUpload(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String path = request.getSession().getServletContext().getRealPath("/");
		Part p = request.getPart("file1");
		if (p.getContentType().contains("image") || p.getContentType().contains("MSWORD")
				|| p.getContentType().contains("PDF")) {
			ApplicationPart ap = (ApplicationPart) p;
			System.out.println("获得头name" + ap.getHeaderNames());
			System.out.println("获得头信息" + ap.getHeader("content-disposition"));
			String content = ap.getHeader("content-disposition");
			String fname1 = content.substring(content.lastIndexOf("filename") + 10);
			fname1 = fname1.substring(0, fname1.length() - 1);
			File file = new File(path + "/upload/" + fname1);
			p.write(file.getPath());
			return "文件上传成功";
		} else {
			return "文件上传失败";
		}
	}
}
