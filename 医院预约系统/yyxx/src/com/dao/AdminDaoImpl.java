package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.model.Admin;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("adminDao")
public class AdminDaoImpl extends MyHibernateDaoSupport implements AdminDao {

	//添加管理员
	public void save(Admin admin) {
		this.getHibernateTemplate().save(admin);
	}

	//管理员登录
	public Admin logins(Admin admin) {
		String hql = "from Admin admin where admin.name='" + admin.getName()
				+ "' and admin.password='" + admin.getPassword() + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Admin) list.get(0);
	}

	//管理员列表
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Admin admin where admin.atype=1");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Admin admin where admin.atype=1 order by id desc");
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

	// 管理员查询
	public Admin querybyid(int id) {
		String hql = "from Admin admin where admin.id='" + id + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Admin) list.get(0);
	}

	//修改管理员
	public void update(Admin admin) {
		this.getHibernateTemplate().update(admin);
	}

	//删除管理员
	public void delete(Admin admin) {
		this.getHibernateTemplate().delete(admin);
	}

}
