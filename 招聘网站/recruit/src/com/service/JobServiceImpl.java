package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.CompanyDao;
import com.dao.JobDao;
import com.dao.ResumeDao;
import com.dao.UserDao;
import com.model.Company;
import com.model.Job;
import com.model.Resume;
import com.util.Page;
import com.util.Results;

@Service
public class JobServiceImpl implements JobService {

	@Resource
	private JobDao jobDao;

	// 职位创建
	public void save(Job job) {
		jobDao.save(job);
	}

	// 职位列表
	public Results joblist(Page page) {
		return jobDao.Listpages(page);
	}

	//职位删除
	public void delete(Job job) {
		jobDao.delete(job);
	}

	public Job querybyid(int id) {
		return jobDao.querybyid(id);
	}

	//修改
	public void update(Job job) {
		jobDao.update(job);
	}

	//模糊查询
	public List<Job> jobfind(Job job) {
		return jobDao.jobfind(job);
	}

	// 某公司职位列表
	public Results joblistbycid(Page page, int id) {
		return jobDao.Listpagebycid(page,id);
	}

}