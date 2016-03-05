package com.service;

import java.util.List;

import com.model.Job;
import com.util.Page;
import com.util.Results;

public interface JobService {

	void save(Job job);

	Results joblist(Page page);

	void delete(Job job);

	Job querybyid(int id);

	void update(Job job);

	List<Job> jobfind(Job job);

	Results joblistbycid(Page page, int id);

}
