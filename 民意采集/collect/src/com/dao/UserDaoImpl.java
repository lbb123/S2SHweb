package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("userDao")
public class UserDaoImpl extends MyHibernateDaoSupport implements UserDao {

	// 用户注册
	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}

	// 用户登录
	public User logins(User user) {
		String hql = "from User user where user.name='" + user.getName()
				+ "' and user.password='" + user.getPassword() + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (User) list.get(0);
	}

	// 用户查询
	public User querybyid(int id) {
		String hql = "from User user where user.id='" + id + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (User) list.get(0);
	}

	// 修改用户信息
	public void update(User user) {
		this.getHibernateTemplate().update(user);
	}

	// 用户信息列表
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from User");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from User  order by id desc");
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

	// 删除用户信息
	public void delete(User user) {
		this.getHibernateTemplate().delete(user);
	}

	//找回密码查询
	public User passwordquery(String name, String email) {
		String hql = "from User user where user.name='" + name
				+ "' and user.email='" + email + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (User) list.get(0);
	}

	//ajax列表
	public List<User> ajaxList() {
		String hql = "from User u ";
		return this.getHibernateTemplate().find(hql);
	}

}
