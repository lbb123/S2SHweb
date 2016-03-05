package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.MessageDao;
import com.model.Message;
import com.model.Reply;
import com.util.Page;
import com.util.Results;

@Service 
public class MessageServiceImpl implements MessageService{
	@Resource  
    private MessageDao messageDao;

	//添加
	public void save(Message message) {
		messageDao.save(message);
	}

	//列表
	public Results messagelist(Page page) {
		return messageDao.listpage(page);
	}

	//删除
	public void delete(Message message) {
		messageDao.delete(message);
	}

	//回复列表
	public Results replylist(Page page, int mid) {
		return messageDao.replylist(page, mid);
	}

	//查询
	public Message querymessage(int mid) {
		return messageDao.querymessage(mid);
	}

	//添加回复
	public void savereply(Reply reply) {
		messageDao.savereply(reply);
	}

	//列表
	public Results messagelistuser(Page page, int id) {
		return messageDao.messagelistuser(page,id);
	}

}
