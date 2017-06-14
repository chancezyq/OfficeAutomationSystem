package com.share.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.share.bean.MessageDetailsBean;

@Repository
public interface PublishDao {
	
	/**
	 * 查询所有公告
	 * @return
	 */
	public List<MessageDetailsBean> selectPublish();
	
	/**
	 * 获取单条公告具体详情
	 * @return
	 */
	public MessageDetailsBean getPublishes(int publishid);
	/**
	 * 获取已发布公告的总数
	 * @return
	 */
	public int getPublishCounts();

}
