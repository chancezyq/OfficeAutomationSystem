package com.share.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.FileInfoBean;
import com.share.dao.FileInfoDao;

@Service
public class FileDeleteService {

	@Autowired
	private FileInfoDao fileInfoDao;

	// 删除数据库文件信息
	public void fileDelete(int i) {
		fileInfoDao.fileDelete(i);
	}

	// 删除数据文件本生
	public void delFile(String path) {
		System.out.println("进入文件删除service");
		File file = new File(path);
		System.out.println("删除文件的路径"+path);
		System.out.println("是否存在"+file.exists());
		System.out.println("是否是文件"+file.isFile());
		if (file.exists() && file.isFile()) {
			boolean d = file.delete();

			if (d) {
				System.out.println("删除成功");
			} else {
				System.out.println("删除失败");
			}
		}
	}

	// 放入回收站
	public void trash(FileInfoBean deletefile) {
		fileInfoDao.ifDelete(deletefile);
	}
	//从回收站取回
	public void cancel(FileInfoBean deletefile){
		fileInfoDao.cancelDelete(deletefile);
	}
}
