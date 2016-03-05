package com.service;

import java.util.List;

import org.apache.struts2.convention.annotation.Result;

import com.model.Manager;
import com.model.User;
import com.util.Page;
import com.util.Results;

public interface UserService {
	public void save(User user);

	public List<User> list();

	public void delete(User user);

	public void update(User user);

	public Results Listbypage(Page page);

	public boolean login(User user);

	public User logins(User user);

	public Manager mlogins(Manager manager);

	public User query(User user);

}
