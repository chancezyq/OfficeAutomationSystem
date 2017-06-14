package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.FileDetailsInfo;
import com.share.bean.FileInfoBean;
import com.share.dao.FileInfoDao;

/**
 * 文件信息处理service层
 * 
 * @author Administrator
 */
@Service
public class FileInfoService {

	@Autowired
	private FileInfoDao fileinfodao;

	/**
	 * service层获取文件及相关附件的所有信息
	 * 
	 * @return
	 */
	public List<FileDetailsInfo> findFileDetailsInfo() {
		return fileinfodao.findFileDetailsInfo();

	}


	/**
	 * service层获取数据库文件总数量
	 * 
	 * @return
	 */
	public int findAllFilecount() {
		return fileinfodao.findAllfileCount();
	}

	/**
	 * service层获取需要修改的文件信息
	 * 
	 * @return
	 */
	public FileInfoBean findUpdateFileinfo(int fileinfoid) {
		return fileinfodao.findUpdateFileinfo(fileinfoid);
	}
	public  void addFile(FileInfoBean fileInfoBean) {
		fileinfodao.addFile(fileInfoBean);
	}

	/**
	 * service层修改文件信息
	 * 
	 * @param fileinfo
	 */
	public void updateFileInfo(FileInfoBean fileinfo) {
		fileinfodao.updateFileinfo(fileinfo);

	}
	
	//搜索文件
	public List<FileDetailsInfo> fileSearch(FileDetailsInfo file){
		return fileinfodao.fileSearch(file);
	}
}
