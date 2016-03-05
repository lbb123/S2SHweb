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
import com.model.Wuye;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("wuyeDao")
public class WuyeDaoImpl extends MyHibernateDaoSupport implements WuyeDao {

	// 添加
	public void save(Wuye wuye) {
		this.getHibernateTemplate().save(wuye);
	}

	// 列表
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Wuye w ");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<Wuye> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Wuye w  order by id desc");
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

	// 查询
	public Wuye querybyid(int id) {
		String hql = "from Wuye w where w.wid='" + id + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Wuye) list.get(0);
	}

	// 修改
	public void update(Wuye wuye) {
		this.getHibernateTemplate().update(wuye);
	}

	// 删除
	public void delete(Wuye wuye) {
		this.getHibernateTemplate().delete(wuye);
	}

	// 查询用户
	public User queryuser(int uid) {
		String hql = "from User u where u.id='" + uid + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (User) list.get(0);
	}

	@SuppressWarnings("unchecked")
	public Results userwuyelist(Page page, final int id) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Wuye w where w.uid='" + id + "'");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<Wuye> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Wuye w where w.uid='" + id
										+ "' order by id desc");
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

}
