package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.AdminDao;
import com.dao.WuyeDao;
import com.model.Admin;
import com.model.User;
import com.model.Wuye;
import com.util.Page;
import com.util.Results;


@Service 
public class WuyeServiceImpl implements WuyeService{
	@Resource  
    private WuyeDao wuyeDao;

	//添加
	public void save(Wuye wuye) {
		wuyeDao.save(wuye);
	}

	//列表
	public Results companylist(Page page) {
		return wuyeDao.Listpages(page);
	}

	//查询
	public Wuye querybyid(int id) {
		return wuyeDao.querybyid(id);
	}

	//修改
	public void update(Wuye wuye) {
		wuyeDao.update(wuye);		
	}
	//删除
	public void delete(Wuye wuye) {
		wuyeDao.delete(wuye);	
	}

	//查询用户
	public User queryuser(int uid) {
		return wuyeDao.queryuser(uid);	
	}

	//用户物业列表
	public Results userwuyelist(Page page, int id) {
		return wuyeDao.userwuyelist(page,id);	
	} 

}
