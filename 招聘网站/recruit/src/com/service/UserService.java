package com.service;

import com.model.User;
import com.util.Page;
import com.util.Results;

public interface UserService {

	void save(User user);

	User logins(User user);

	User querybyid(int id);

	void update(User user);

	Results companylist(Page page);

	void delete(User user);

}
