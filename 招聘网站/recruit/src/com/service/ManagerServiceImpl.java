package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.ManagerDao;
import com.dao.UserDao;
import com.model.Manager;
import com.model.User;

@Service 
public class ManagerServiceImpl implements ManagerService{
	
	@Resource  
    private ManagerDao managerDao;  



	//登录
	public Manager logins(Manager manager) {
		return managerDao.logins(manager);
	}


}
