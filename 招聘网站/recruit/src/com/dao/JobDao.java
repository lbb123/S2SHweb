package com.dao;

import java.util.List;

import com.model.Job;
import com.util.Page;
import com.util.Results;

public interface JobDao {

	void save(Job job);

	Results Listpages(Page page);

	void delete(Job job);

	Job querybyid(int id);

	void update(Job job);

	List<Job> jobfind(Job job);

	Results Listpagebycid(Page page, int id);

}
