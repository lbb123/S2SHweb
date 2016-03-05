package com.service;

import java.util.List;

import com.model.Goods;
import com.model.Order;
import com.model.Orderitem;
import com.util.Page;
import com.util.Results;

public interface OrderService {

	void save(Order order);

	void saveitem(Orderitem orderitem);

	Results list(Page page);

	void delete(Order order);

	void update(Order order);

	Order querybyid(int oid);

	Goods queryGoods(int gid);

	String querycatelog(int cid);

	Order querybyobiaohao(String obiaohao);

	List<Orderitem> orderitemList(int oid);

	void updateGoods(Goods queryGoods);

	Results listuser(Page page, int id);

	Results messagelistgoods(Page page, int gid);

}
