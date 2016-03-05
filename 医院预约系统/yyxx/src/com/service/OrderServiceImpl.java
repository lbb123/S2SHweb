package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.OrderDao;
import com.model.Doctor;
import com.model.Order;
import com.model.User;
import com.util.Page;
import com.util.Results;

@Service 
public class OrderServiceImpl implements OrderService{
	@Resource  
    private OrderDao orderDao;

	//添加预约信息
	public void save(Order order) {
		orderDao.save(order);
	}
	
	//预约信息列表
	public Results list(Page page) {
		return orderDao.Listpages(page);
	}

	//预约信息删除
	public void delete(Order order) {
		orderDao.delete(order);
	}

	//预约信息修改
	public void update(Order order) {
		orderDao.update(order);
	}

	//预约信息查询
	public Order querybyid(int oid) {
		return orderDao.querybyid(oid);
	}

	//预约信息用户列表
	public Results listuser(Page page, int id) {
		return orderDao.listuser(page,id);
	}
	//医生信息查询
	public Doctor querydoctor(int did) {
		return orderDao.querydoctor(did);
	}
	//医生信息列表
	public Results listdoctor(Page page, int did) {
		return orderDao.listdoctor(page,did);
	}
	//用户信息查询
	public User queryUser(int uid) {
		return orderDao.queryUser(uid);
	}


}
