package com.service;

import com.model.Admin;
import com.util.Page;
import com.util.Results;

public interface AdminService {

	void save(Admin admin);

	Admin logins(Admin admin);

	Results companylist(Page page);

	Admin querybyid(int id);

	void update(Admin admin);

	void delete(Admin admin);

}
