package com.dao;

import com.model.User;
import com.util.Page;
import com.util.Results;

public interface UserDao {

	void save(User user);

	User logins(User user);

	User querybyid(int id);

	void update(User user);

	Results Listpages(Page page);

	void delete(User user);

}
