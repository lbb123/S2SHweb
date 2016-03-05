package com.service;

import com.model.Doctor;
import com.model.Order;
import com.model.User;
import com.util.Page;
import com.util.Results;


public interface OrderService {

	void save(Order order);

	Results listuser(Page page, int id);

	Doctor querydoctor(int did);

	Results listdoctor(Page page, int did);

	User queryUser(int uid);

	void update(Order queryOrder);

	Order querybyid(int oid);


}
