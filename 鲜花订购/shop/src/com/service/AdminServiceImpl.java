package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.AdminDao;
import com.model.Admin;
import com.util.Page;
import com.util.Results;


@Service 
public class AdminServiceImpl implements AdminService{
	@Resource  
    private AdminDao adminDao;

	//保存
	public void save(Admin admin) {
		adminDao.save(admin);
	}

	//登录
	public Admin logins(Admin admin) {
		return adminDao.logins(admin);
	}

	//列表
	public Results companylist(Page page) {
		return adminDao.Listpages(page);
	}

	//查询
	public Admin querybyid(int id) {
		return adminDao.querybyid(id);
	}

	//修改
	public void update(Admin admin) {
		adminDao.update(admin);		
	}

	//删除
	public void delete(Admin admin) {
		adminDao.delete(admin);	
	} 

}
