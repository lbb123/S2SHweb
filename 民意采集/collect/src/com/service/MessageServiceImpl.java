package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.MessageDao;
import com.model.Catelog;
import com.model.Message;
import com.model.User;
import com.util.Page;
import com.util.Results;

@Service 
public class MessageServiceImpl implements MessageService{
	@Resource  
    private MessageDao messageDao;

	//添加民意信息
	public void save(Message message) {
		messageDao.save(message);
	}
	//民意信息列表
	public Results messagelist(Page page) {
		return messageDao.listpage(page);
	}

	//民意信息删除
	public void delete(Message message) {
		messageDao.delete(message);
	}


	//民意信息查询
	public Message querymessage(int mid) {
		return messageDao.querymessage(mid);
	}


	//民意信息列表
	public Results messagelistuser(Page page, int id) {
		return messageDao.messagelistuser(page,id);
	}

	//民意信息列表
	public Results messagelistDoctor(Page page, int did) {
		return messageDao.messagelistDoctor(page,did);
	}
	//查询分类
	public Catelog queryCatelog(int cid) {
		return messageDao.queryCatelog(cid);
	}
	//修改民意
	public void update(Message message) {
		messageDao.update(message);
	}
	//查询民意处理状态的民意列表
	public Results messagelistmtype(Page page, String mtype) {
		return messageDao.messagelistmtype(page,mtype);
	}
	//查询用户
	public User queryUser(int msendid) {
		return messageDao.queryUser(msendid);
	}
	//查询待审批的民意列表
	public Results messagelistmsendid(Page page, int msendid) {
		return messageDao.messagelistmsendid(page,msendid);
	}
	//模糊组合查询
	public Results queryallmessage(Page page, Message message) {
		return messageDao.queryallmessage(page,message);
	}

}
