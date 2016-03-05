package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.AdminDao;
import com.dao.CatelogDao;
import com.model.Catelog;
import com.util.Page;
import com.util.Results;

@Service 
public class CatelogServiceImpl implements CatelogService{
	@Resource  
    private CatelogDao catelogDao;

	//列表
	public Results companylist(Page page) {
		return catelogDao.Listpages(page);
	}

	//添加
	public void save(Catelog catelog) {
		catelogDao.save(catelog);
	}

	//查询
	public Catelog querybyid(int cid) {
		return catelogDao.querybyid(cid);
	}

	//修改
	public void update(Catelog catelog) {
		catelogDao.update(catelog);
	}

	//删除
	public void delete(Catelog catelog) {
		catelogDao.delete(catelog);
	}

	//列表
	public java.util.List<Catelog> List() {
		return catelogDao.List();
	}

}
