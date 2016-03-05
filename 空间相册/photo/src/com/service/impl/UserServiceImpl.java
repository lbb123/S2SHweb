package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.model.Manager;
import com.model.User;
import com.service.UserService;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Service 
public class UserServiceImpl implements UserService {

	@Resource  
    private UserDao userDao;  
	
	//�û�ע��
	public void save(User user) {
		userDao.addUser(user);  
	}

	//�û��б� ��
	public List<User> list() {
		// TODO Auto-generated method stub
		return userDao.list();  
	}


	//�û�ɾ��
	public void delete(User user) {
		userDao.delete(user);  
	}

	//�û��޸�
	public void update(User user) {
		userDao.update(user);  
	}

	//�û��б� ����ҳ
	public Results Listbypage(Page page) {
		return userDao.Listpages(page);
	}

	public boolean login(User user) {
		User queryUser = userDao.login(user);
		if (queryUser != null && !queryUser.equals("")) {
			return true;
		} else {
			return false;
		}
	}

	public User logins(User user) {
		// TODO Auto-generated method stub
		return userDao.login(user);
	}

	public Manager mlogins(Manager manager) {
		return userDao.mlogin(manager);
	}

	public User query(User user) {
		// TODO Auto-generated method stub
		return userDao.query(user);
	}


}
