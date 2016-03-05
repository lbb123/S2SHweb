package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.NewsDao;
import com.dao.UserDao;
import com.model.News;
import com.model.User;
import com.util.Page;
import com.util.Results;

@Service 
public class NewsServiceImpl implements NewsService{
	
	@Resource  
    private NewsDao newsDao;  

	//添加新闻信息
	public void save(News news) {
		newsDao.save(news);  
		
	}


	//查询新闻信息
	public News querybyid(int nid) {
		 return newsDao.querybyid(nid);
	}

	//修改新闻信息
	public void update(News news) {
		newsDao.update(news);
	}

	//新闻信息列表
	public Results companylist(Page page) {
		return newsDao.Listpages(page);
	}

	//管理员删除新闻信息
	public void delete(News news) {
		newsDao.delete(news);
	}

}
