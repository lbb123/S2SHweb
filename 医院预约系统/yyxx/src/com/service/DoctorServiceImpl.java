package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.model.Discuss;
import com.model.Doctor;
import com.model.User;
import com.util.Page;
import com.util.Results;

@Service 
public class DoctorServiceImpl implements DoctorService{
	
	@Resource  
    private DoctorDao doctorDao;  


	//医生登录
	public Doctor logins(Doctor doctor) {
		 return doctorDao.logins(doctor);
	}

	//查询医生信息
	public Doctor querybyid(int id) {
		 return doctorDao.querybyid(id);
	}

	//修改医生信息
	public void update(Doctor doctor) {
		doctorDao.update(doctor);
	}

	//医生信息列表
	public Results companylist(Page page) {
		return doctorDao.Listpages(page);
	}

	//管理员删除医生信息
	public void delete(Doctor doctor) {
		doctorDao.delete(doctor);
	}

    //添加医生信息
	public void save(Doctor doctor) {
		doctorDao.save(doctor);  
	}

	//医生详情
	public Results queryDiscuss(Page page, int did) {
		return doctorDao.queryDiscuss(page,did);  
	}

	//添加评论
	public void savediscuss(Discuss discuss) {
		doctorDao.savediscuss(discuss);  
	}

	//评论列表
	public Results queryDiscusslist(Page page) {
		return doctorDao.queryDiscusslist(page);
	}

	//评论删除
	public void deletediscuss(Discuss discuss) {
		doctorDao.deletediscuss(discuss);  
	}

}
