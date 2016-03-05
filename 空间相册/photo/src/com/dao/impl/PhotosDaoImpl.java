package com.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.dao.PhotosDao;
import com.dao.UserDao;
import com.model.Photos;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("photosDao")
public class PhotosDaoImpl extends MyHibernateDaoSupport implements PhotosDao {

	public void save(Photos photos) {
		this.getHibernateTemplate().save(photos);
	}

	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Photos photos");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Photos  order by id desc");
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

	public void delete(Photos photos) {
		this.getHibernateTemplate().delete(photos);

	}

	public void update(Photos photos) {
		this.getHibernateTemplate().update(photos);

	}

	public Photos query(Photos photos) {
		String hql = "from Photos photos where photos.id='" + photos.getId()
				+ "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Photos) list.get(0);
	}

	public List<Photos> List() {
		String hql = "from Photos";
		return this.getHibernateTemplate().find(hql);
	}

	public Photos queryby(int photosId) {
		String hql = "from Photos photos where photos.id='" + photosId + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Photos) list.get(0);
	}

	@SuppressWarnings("unchecked")
	public Results Listbypageid(Page page, final int id) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Photos photos where photos.userId='"+id+"'");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Photos photos where photos.userId='"+id+"' order by id desc");
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

	public List<Photos> ListbyUid(int id) {
		String hql = "from Photos photos where photos.userId='" + id
		+ "'";
		return this.getHibernateTemplate().find(hql);
	}

}
