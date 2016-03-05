package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.CompanyDao;
import com.dao.ResumeDao;
import com.dao.UserDao;
import com.model.Company;
import com.model.Resume;
import com.util.Page;
import com.util.Results;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Resource
	private CompanyDao companyDao;

	// 创建
	public void save(Company company) {
		companyDao.save(company);

	}

	// 登录
	public Company logins(Company company) {
		return companyDao.login(company);
	}

	//查询
	public Company querybyid(int id) {
		return companyDao.querybyid(id);
	}

	//修改
	public void update(Company company) {
		companyDao.update(company);
	}

	//列表
	public Results companylist(Page page) {
		return companyDao.Listpages(page);
	}

	//删除
	public void delete(Company company) {
		companyDao.delete(company);
	}



}