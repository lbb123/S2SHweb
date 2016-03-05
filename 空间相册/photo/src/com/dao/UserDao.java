package com.dao;

import java.util.List;

import com.model.Manager;
import com.model.User;
import com.util.Page;
import com.util.Results;

public interface UserDao {

	void addUser(User user);

	List<User> list();

	void delete(User user);

	void update(User user);

	Results Listpages(Page page);

	User login(User user);

	Manager mlogin(Manager manager);

	User query(User user);
	
	

}
