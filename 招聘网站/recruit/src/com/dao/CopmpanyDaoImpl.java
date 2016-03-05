package com.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import com.model.Company;
import com.model.User;
import com.util.MyHibernateDaoSupport;
import com.util.Page;
import com.util.PageUtil;
import com.util.Results;

@Repository("companyDao")
public class CopmpanyDaoImpl extends MyHibernateDaoSupport implements
		CompanyDao {

	// 注册
	public void save(Company company) {
		this.getHibernateTemplate().save(company);
	}

	// 登录
	public Company login(Company company) {
		String hql = "from Company company where company.name='"
				+ company.getName() + "' and company.password='"
				+ company.getPassword() + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Company) list.get(0);
	}

	// 查询
	public Company querybyid(int id) {
		String hql = "from Company company where company.id='" + id + "'";
		List list = this.getHibernateTemplate().find(hql);
		return (Company) list.get(0);
	}

	// 修改
	public void update(Company company) {
		this.getHibernateTemplate().update(company);
	}

	// 列表
	@SuppressWarnings("unchecked")
	public Results Listpages(Page page) {
		List find = this.getHibernateTemplate().find(
				"select count(*) from Company");
		page = PageUtil.createPage(page, ((Long) find.get(0)).intValue());
		final Page page2 = page;
		List<User> all = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session
								.createQuery("from Company  order by id desc");
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

	public void delete(Company company) {
		this.getHibernateTemplate().delete(company);
	}

}
