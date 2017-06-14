package com.share.bean;

import java.io.Serializable;

/**
 * 查询文件详情（包括文件地址与图片信息）
 * 
 * @author Administrator
 *
 */
public class FileDetailsInfo implements Serializable {
	private int t_fileinfo_id;// 文件id
	private String t_fileinfo_name;// 文件名称
	private String t_fileinfo_owner;// 文件创建者
	private String t_fileinfo_createdate;// 文件创建时间
	private String t_filetypeinfo_name;// 文件类型名字
	private String t_filetypeinfo_image;// 文件类型图片
	private String t_fileinfo_filepath;// 文件的路径
	private int t_fileinfo_ifdelete;// 文件是否已删除
	private String t_fileinfo_remark;// 文件备注

	public int getT_fileinfo_id() {
		return t_fileinfo_id;
	}

	public void setT_fileinfo_id(int t_fileinfo_id) {
		this.t_fileinfo_id = t_fileinfo_id;
	}

	public String getT_fileinfo_name() {
		return t_fileinfo_name;
	}

	public void setT_fileinfo_name(String t_fileinfo_name) {
		this.t_fileinfo_name = t_fileinfo_name;
	}

	public String getT_fileinfo_owner() {
		return t_fileinfo_owner;
	}

	public void setT_fileinfo_owner(String t_fileinfo_owner) {
		this.t_fileinfo_owner = t_fileinfo_owner;
	}

	public String getT_fileinfo_createdate() {
		return t_fileinfo_createdate;
	}

	public void setT_fileinfo_createdate(String t_fileinfo_createdate) {
		this.t_fileinfo_createdate = t_fileinfo_createdate;
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

	public String getT_fileinfo_filepath() {
		return t_fileinfo_filepath;
	}

	public void setT_fileinfo_filepath(String t_fileinfo_filepath) {
		this.t_fileinfo_filepath = t_fileinfo_filepath;
	}

	public int getT_fileinfo_ifdelete() {
		return t_fileinfo_ifdelete;
	}

	public void setT_fileinfo_ifdelete(int t_fileinfo_ifdelete) {
		this.t_fileinfo_ifdelete = t_fileinfo_ifdelete;
	}

	public String getT_fileinfo_remark() {
		return t_fileinfo_remark;
	}

	public void setT_fileinfo_remark(String t_fileinfo_remark) {
		this.t_fileinfo_remark = t_fileinfo_remark;
	}

}
