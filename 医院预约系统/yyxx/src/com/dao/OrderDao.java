package com.dao;

import com.model.Doctor;
import com.model.Order;
import com.model.User;
import com.util.Page;
import com.util.Results;

public interface OrderDao {

	void save(Order order);

	Results listuser(Page page, int id);

	Results Listpages(Page page);

	void delete(Order order);

	void update(Order order);

	Order querybyid(int oid);

	Doctor querydoctor(int did);

	Results listdoctor(Page page, int did);

	User queryUser(int uid);


}
