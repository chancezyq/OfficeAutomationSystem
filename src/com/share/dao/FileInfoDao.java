package com.share.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.share.bean.FileDetailsInfo;
import com.share.bean.FileInfoBean;

/**
 * 文件信息处理dao层
 * 
 * @author Administrator
 *
 */

@Repository
public interface FileInfoDao {
	/**
	 * dao层获取所有文件及附件的详细信息
	 * 
	 * @return
	 */

	public List<FileDetailsInfo> findFileDetailsInfo();

	/**
	 * dao层获取数据库文件总数量
	 * 
	 * @return
	 */
	public int findAllfileCount();

	/**
	 * dao层获取需要修改的文件信息
	 * 
	 * @return
	 */
	public FileInfoBean findUpdateFileinfo(int fileinfoid);

	/**
	 * dao层修改文件信息
	 * 
	 * @param fileinfo
	 */
	public void updateFileinfo(FileInfoBean fileinfo);
	/**
	 * dao层插入添加文件的信息 
	 */
	public void addFile(FileInfoBean fileInfoBean);
	
	//删除文件
	public void fileDelete(int i);
	
	//放入回收站
	public void ifDelete(FileInfoBean deletefile);
	//从回收站取回
	public void cancelDelete(FileInfoBean deletefile);
	//搜索文件
	public List<FileDetailsInfo> fileSearch(FileDetailsInfo file);
}
