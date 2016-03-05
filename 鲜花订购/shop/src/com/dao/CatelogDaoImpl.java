package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.model.Admin;
import com.model.Catelog;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("catelogDao")
public class CatelogDaoImpl extends MyHibernateDaoSupport implements CatelogDao {

	// 类别列表
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Catelog catelog ");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Catelog catelog  order by id desc");
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

	// 保存
	public void save(Catelog catelog) {
		this.getHibernateTemplate().save(catelog);
	}

	// 查询
	public Catelog querybyid(int cid) {
		String hql = "from Catelog c where c.cid='" + cid + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Catelog) list.get(0);
	}

	// 修改
	public void update(Catelog catelog) {
		this.getHibernateTemplate().update(catelog);
	}

	//删除
	public void delete(Catelog catelog) {
		this.getHibernateTemplate().delete(catelog);
	}

	// 列表
	public List<Catelog> List() {
		String hql = "from Catelog c ";
		return this.getHibernateTemplate().find(hql);
	}

}
