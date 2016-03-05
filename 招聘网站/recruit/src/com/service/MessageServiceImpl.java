package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.CompanyDao;
import com.dao.MessageDao;
import com.dao.ResumeDao;
import com.dao.UserDao;
import com.model.Company;
import com.model.Message;
import com.model.Resume;
import com.util.Page;
import com.util.Results;

@Service
public class MessageServiceImpl implements MessageService {

	@Resource
	private MessageDao messageDao;

	//添加投递信息
	public void save(Message message) {
		messageDao.save(message);
	}
	//用户投递列表
	public Results messageList(Page page) {
		return messageDao.Listpages(page);
	}
	//删除投递信息
	public void delete(Message message) {
		messageDao.delete(message);
	}
	public Message querybyid(int id) {
		return messageDao.querybyid(id);
	}
	public void update(Message message) {
		messageDao.update(message);
	}
	//查询用户投递信息
	public Results messageListbyuid(Page page, int id) {
		return messageDao.Listpagesbyuid(page,id);
	}
	
	//查看某公司投递列表
	public Results messageListbycid(Page page, int id) {
		return messageDao.messageListbycid(page,id);
	}




}