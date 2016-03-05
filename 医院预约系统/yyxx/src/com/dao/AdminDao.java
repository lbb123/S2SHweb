package com.dao;

import com.model.Admin;
import com.util.Page;
import com.util.Results;

public interface AdminDao {

	void save(Admin admin);

	Admin logins(Admin admin);

	Results Listpages(Page page);

	Admin querybyid(int id);

	void update(Admin admin);

	void delete(Admin admin);

}
