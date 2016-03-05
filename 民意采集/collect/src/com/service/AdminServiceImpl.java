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

	//添加管理员
	public void save(Admin admin) {
		adminDao.save(admin);
	}
	//管理员登录
	public Admin logins(Admin admin) {
		return adminDao.logins(admin);
	}

	//管理员列表
	public Results companylist(Page page) {
		return adminDao.Listpages(page);
	}

	//管理员查询
	public Admin querybyid(int id) {
		return adminDao.querybyid(id);
	}

	//管理员修改
	public void update(Admin admin) {
		adminDao.update(admin);		
	}
	//管理员删除
	public void delete(Admin admin) {
		adminDao.delete(admin);	
	} 

}
