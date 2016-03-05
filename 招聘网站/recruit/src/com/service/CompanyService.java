package com.service;

import com.model.Company;
import com.util.Page;
import com.util.Results;

public interface CompanyService {

	void save(Company company);

	Company logins(Company company);

	Company querybyid(int id);

	void update(Company company);

	Results companylist(Page page);

	void delete(Company company);

}
