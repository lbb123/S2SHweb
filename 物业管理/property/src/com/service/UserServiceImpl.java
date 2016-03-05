package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.model.User;
import com.util.Page;
import com.util.Results;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserDao userDao;

	// 注册用户
	public void save(User user) {
		userDao.save(user);

	}

	// 用户登录
	public User logins(User user) {
		return userDao.logins(user);
	}

	// 用户查询
	public User querybyid(int id) {
		return userDao.querybyid(id);
	}

	// 用户修改
	public void update(User user) {
		userDao.update(user);
	}

	// 用户信息列表
	public Results companylist(Page page) {
		return userDao.Listpages(page);
	}

	// 管理员删除
	public void delete(User user) {
		userDao.delete(user);
	}

	// 用户信息查询
	public User passwordquery(String name, String email) {
		return userDao.passwordquery(name, email);
	}

	//ajax列表
	public List<User> ajaxList() {
		return userDao.ajaxList();
	}

}
