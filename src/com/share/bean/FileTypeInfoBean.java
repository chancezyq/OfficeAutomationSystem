package com.share.bean;

import java.io.Serializable;

/**
 * 文件类型javabean(数据表t_filetypeinfo的javabean)
 * 
 * @author Administrator
 *
 */

public class FileTypeInfoBean implements Serializable {

	private int t_fileinfo_filetypeid;// 文件类型id
	private String t_filetypeinfo_name;// 文件类型名
	private String t_filetypeinfo_image;// 文件类型对应的图标
	private String t_filetypeinfo_suffix;// 文件类型后缀

	public int getT_fileinfo_filetypeid() {
		return t_fileinfo_filetypeid;
	}

	public void setT_fileinfo_filetypeid(int t_fileinfo_filetypeid) {
		this.t_fileinfo_filetypeid = t_fileinfo_filetypeid;
	}

	public String getT_filetypeinfo_name() {
		return t_filetypeinfo_name;
	}

	public void setT_filetypeinfo_name(String t_filetypeinfo_name) {
		this.t_filetypeinfo_name = t_filetypeinfo_name;
	}

	public String getT_filetypeinfo_image() {
		return t_filetypeinfo_image;
	}

	public void setT_filetypeinfo_image(String t_filetypeinfo_image) {
		this.t_filetypeinfo_image = t_filetypeinfo_image;
	}

	public String getT_filetypeinfo_suffix() {
		return t_filetypeinfo_suffix;
	}

	public void setT_filetypeinfo_suffix(String t_filetypeinfo_suffix) {
		this.t_filetypeinfo_suffix = t_filetypeinfo_suffix;
	}

}
