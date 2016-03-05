package com.service;

import java.util.List;

import com.model.Catelog;
import com.util.Page;
import com.util.Results;

public interface CatelogService {

	void save(Catelog catelog);

	Results companylist(Page page);

	Catelog querybyid(int cid);

	void update(Catelog catelog);

	void delete(Catelog catelog);

	List<Catelog> List();

}
