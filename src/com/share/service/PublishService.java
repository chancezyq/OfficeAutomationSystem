package com.share.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.share.bean.MessageDetailsBean;
import com.share.dao.PublishDao;

@Service
public class PublishService {

	@Autowired
	private PublishDao publishdao;

	/**
	 * 获取所有公布消息
	 * 
	 * @return
	 */
	public List<MessageDetailsBean> selectPublish() {
		return publishdao.selectPublish();
	}

	/**
	 * 获取单条公告的详细信息
	 * 
	 * @return
	 */
	public MessageDetailsBean getPublishes(int publishid) {
		return publishdao.getPublishes(publishid);
	}

	/**
	 * 获取公布公告的总数量
	 * 
	 * @return
	 */
	public int getPublishCounts() {
		return publishdao.getPublishCounts();
	}

}
