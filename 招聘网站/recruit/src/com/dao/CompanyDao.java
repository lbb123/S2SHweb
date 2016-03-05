package com.dao;

import com.model.Company;
import com.util.Page;
import com.util.Results;

public interface CompanyDao {

	void save(Company company);

	Company login(Company company);

	Company querybyid(int id);

	void update(Company company);

	Results Listpages(Page page);

	void delete(Company company);

}
