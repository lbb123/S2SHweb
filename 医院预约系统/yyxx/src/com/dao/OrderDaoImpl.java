package com.dao;


import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.model.Doctor;
import com.model.Order;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("orderDao")
public class OrderDaoImpl extends MyHibernateDaoSupport implements OrderDao {

	// 预约信息列表
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Order o ");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<Order> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Order o  order by id desc");
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

	// 查询预约信息
	public Order querybyid(int oid) {
		String hql = "from Order o where o.oid='" + oid + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Order) list.get(0);
	}

	// 修改预约信息
	public void update(Order order) {
		this.getHibernateTemplate().update(order);
	}

	// 删除预约信息
	public void delete(Order order) {
		this.getHibernateTemplate().delete(order);
	}

	// 添加预约信息
	public void save(Order order) {
		this.getHibernateTemplate().save(order);
	}
	//预约信息列表查询
	@SuppressWarnings("unchecked")
	public Results listuser(Page page, final int id) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Order o where o.uid='"+id+"'");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<Order> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Order o where o.uid='"+id+"'  order by id desc");
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

	//医生信息查询
	public Doctor querydoctor(int did) {
		String hql = "from Doctor d where d.did='" + did + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Doctor) list.get(0);
	}

	//预约信息列表查询
	@SuppressWarnings("unchecked")
	public Results listdoctor(Page page, final int did) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Order o where o.did='"+did+"'");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<Order> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Order o where o.did='"+did+"'  order by id desc");
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

	//用户信息查询
	public User queryUser(int uid) {
		String hql = "from User u where u.id='" + uid + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (User) list.get(0);
	}

}
