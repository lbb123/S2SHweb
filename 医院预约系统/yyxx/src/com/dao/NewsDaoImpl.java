package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.model.News;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("newsDao")
public class NewsDaoImpl extends MyHibernateDaoSupport implements NewsDao {

	//添加新闻信息
	public void save(News news) {
		this.getHibernateTemplate().save(news);
	}


	// 查询新闻信息
	public News querybyid(int nid) {
		String hql = "from News n where n.nid='" + nid + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (News) list.get(0);
	}

	// 修改新闻信息
	public void update(News news) {
		this.getHibernateTemplate().update(news);
	}

	// 新闻信息列表
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from News");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<News> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from News  order by id desc");
						// 设置每页显示多少个，设置多大结果。
						query.setMaxResults(page2.getEveryPage());
						// 设置起点
						query.setFirstResult(page2.getBeginIndex());
						return query.list();
					}

				});
		Results result = new Results();
		result.setPage(page2);
		result.setList(all);
		return result;
	}

	// 删除新闻信息
	public void delete(News news) {
		this.getHibernateTemplate().delete(news);
	}


}
