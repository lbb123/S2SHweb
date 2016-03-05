package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.OrderDao;
import com.model.Goods;
import com.model.Order;
import com.model.Orderitem;
import com.util.Page;
import com.util.Results;

@Service 
public class OrderServiceImpl implements OrderService{
	@Resource  
    private OrderDao orderDao;

	//添加
	public void save(Order order) {
		orderDao.save(order);
	}

	//添加
	public void saveitem(Orderitem orderitem) {
		orderDao.saveitem(orderitem);
	}

	//列表
	public Results list(Page page) {
		return orderDao.Listpages(page);
	}

	//删除
	public void delete(Order order) {
		orderDao.delete(order);
	}

	
	//修改
	public void update(Order order) {
		orderDao.update(order);
	}

	//查询
	public Order querybyid(int oid) {
		return orderDao.querybyid(oid);
	}

	//查询
	public Goods queryGoods(int gid) {
		return orderDao.queryGoods(gid);
	}

	//查询
	public String querycatelog(int cid) {
		return orderDao.querycatelog(cid);
	}

	//查询
	public Order querybyobiaohao(String obiaohao) {
		return orderDao.querybyobiaohao(obiaohao);
	}

	//列表
	public List<Orderitem> orderitemList(int oid) {
		return orderDao.orderitemList(oid);
	}

	//修改
	public void updateGoods(Goods queryGoods) {
		orderDao.updateGoods(queryGoods);
	}

	//列表
	public Results listuser(Page page, int id) {
		return orderDao.listuser(page,id);
	}

	//列表
	public Results messagelistgoods(Page page, int gid) {
		return orderDao.messagelistgoods(page,gid);
	}

}
