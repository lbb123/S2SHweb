package com.dao;

import java.util.List;

import com.model.Catelog;
import com.util.Page;
import com.util.Results;

public interface CatelogDao {

	Results Listpages(Page page);

	void save(Catelog catelog);

	Catelog querybyid(int cid);

	void update(Catelog catelog);

	void delete(Catelog catelog);

	List<Catelog> List();

}
