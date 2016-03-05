package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.GoodsDao;
import com.model.Goods;
import com.util.Page;
import com.util.Results;

@Service 
public class GoodsServiceImpl implements GoodsService{
	@Resource  
    private GoodsDao goodsDao;

	//添加
	public void save(Goods goods) {
		goodsDao.save(goods);
	}

	//列表
	public Results list(Page page) {
		return goodsDao.Listpages(page);
	}

	//删除
	public void delete(Goods goods) {
		goodsDao.delete(goods);
	}

	//查询
	public Goods querybyid(int gid) {
		return goodsDao.querybyid(gid);
	}

	//修改
	public void update(Goods goods) {
		goodsDao.update(goods);
	}


}
