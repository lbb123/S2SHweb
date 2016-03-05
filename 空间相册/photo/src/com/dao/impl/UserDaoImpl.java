package com.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.dao.UserDao;
import com.model.Manager;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("userDao")
public class UserDaoImpl extends MyHibernateDaoSupport implements UserDao {

	// 用户注册
	public void addUser(User user) {
		this.getHibernateTemplate().save(user);
	}

	// 用户列表
	public List<User> list() {
		return this.getHibernateTemplate().find("from User user");
	}

	// 用户删除
	public void delete(User user) {
		this.getHibernateTemplate().delete(user);
	}

	// 用户修改
	public void update(User user) {
		this.getHibernateTemplate().update(user);
	}

	// 用户列表 带分页
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from User user");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from User  order by userId desc");
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

	public User login(User user) {
		String hql = "from User user where user.username='"
				+ user.getUsername() + "' and user.password='"
				+ user.getPassword() + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (User) list.get(0);
	}

	public Manager mlogin(Manager manager) {
		String hql = "from Manager manager where manager.name='"
			+ manager.getName() + "' and manager.password='"
			+ manager.getPassword() + "'";
	List list = this.getHibernateTemplate().find(hql);
	return (Manager) list.get(0);
	}

	public User query(User user) {
		String hql = "from User user where user.userId='"
			+ user.getUserId()+ "'";
	List list = this.getHibernateTemplate().find(hql);
	return (User) list.get(0);
	}

}
